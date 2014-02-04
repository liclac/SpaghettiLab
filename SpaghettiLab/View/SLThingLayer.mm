//
//  SLThingLayer.m
//  SpaghettiLab
//
//  Created by Johannes Ekberg on 2013-09-30.
//  Copyright (c) 2013 MacaroniCode. All rights reserved.
//

#import "SLThingLayer.h"

@interface SLThingLayer ()

- (void)makePath;

@end

@implementation SLThingLayer

- (id)initWithThing:(SLThing *)thing
{
    if((self = [super init]))
    {
		self.thing = thing;
		[self makePath];
		
		self.masksToBounds = NO;
		self.fillColor = nil;
		self.strokeColor = [[UIColor redColor] CGColor];
		self.lineWidth = 1;
    }
    
    return self;
}

- (void)makePath
{
	self.path = CGPathCreateWithRect(CGRectMake(0, 0, _thing.size.x, _thing.size.y), NULL);
}

@end
