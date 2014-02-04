//
//  SLViewController.m
//  SpaghettiLab
//
//  Created by Johannes Ekberg on 2013-09-20.
//  Copyright (c) 2013 MacaroniCode. All rights reserved.
//

#import "SLViewController.h"
#import "SLThing.h"
#import "SLThingLayer.h"

#define kTickInterval (1/60)

@interface SLViewController ()

@end

@implementation SLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _world = [[SLWorld alloc] init];
	_world.delegate = self;
	
	_iron = [[SLMaterial alloc] initWithDensity:7.87];
	
	SLThing *thing = [[SLThing alloc] initWithMaterial:_iron inWorld:_world];
	thing.size = SLVector(100, 100);
	thing.pos = SLVector(50, 50);
	[_world addThing:thing];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)actionPlay:(UIBarButtonItem *)sender
{
	NSLog(@"Playing!");
    _lastFrameTime = [NSDate timeIntervalSinceReferenceDate];
    _timer = [NSTimer scheduledTimerWithTimeInterval:kTickInterval target:self selector:@selector(tick:) userInfo:nil repeats:YES];
}

- (void)tick:(NSTimer *)timer
{
    NSTimeInterval time = [NSDate timeIntervalSinceReferenceDate] - _lastFrameTime;
    {
		[_world tick:time];
		for(SLThingLayer *layer in self.view.layer.sublayers)
		{
			if(![layer isKindOfClass:[SLThingLayer class]])
				continue;
			
			layer.position = CGPointMake(layer.thing.pos.x, layer.thing.pos.y);
		}
	}
	_lastFrameTime = [NSDate timeIntervalSinceReferenceDate];
}

#pragma mark World Delegate
- (void)world:(SLWorld *)world didAddThing:(SLThing *)thing
{
	NSLog(@"Thing Added: %@", thing);
	SLThingLayer *layer = [[SLThingLayer alloc] initWithThing:thing];
	layer.position = CGPointMake(thing.pos.x, thing.pos.y);
	[self.view.layer addSublayer:layer];
}

- (void)world:(SLWorld *)world didRemoveThing:(SLThing *)thing
{
	NSLog(@"Thing Removed: %@", thing);
	SLThingLayer *layer = nil;
	for(SLThingLayer *aLayer in self.view.layer.sublayers)
	{
		if([aLayer isKindOfClass:[SLThingLayer class]] && layer.thing == thing)
		{
			layer = aLayer;
			break;
		}
	}
	[layer removeFromSuperlayer];
}

- (SLVector)worldBoundary:(SLWorld *)world
{
	return SLVector(self.view.frame.size.width, self.view.frame.size.height);
}

@end
