//
//  SLThing.m
//  SpaghettiLab
//
//  Created by Johannes Ekberg on 2013-09-30.
//  Copyright (c) 2013 MacaroniCode. All rights reserved.
//

#import "SLThing.h"

@implementation SLThing

- (id)initWithMaterial:(SLMaterial *)material inWorld:(SLWorld *)world
{
    if((self = [super init]))
    {
		self.material = material;
        self.world = world;
    }
    
    return self;
}

- (float)mass
{
    return _material.density * _size.x * _size.y;
}

- (void)tickBegin:(NSTimeInterval)t
{
	_tmpVector = SLVector();
}

- (void)applyForce:(const SLVector&)f time:(NSTimeInterval)t
{
	_v += f*t;
}

- (SLVector)tickEnd:(NSTimeInterval)t
{
	for(std::deque<SLVector>::const_iterator it = _forces.cbegin(); it != _forces.cend(); it++)
		[self applyForce:*it time:t];
	
	_tmpVector += _v;
	return _tmpVector;
}

- (BOOL)collidesWith:(SLThing *)other
{
	if((self.pos.x + self.size.x) < other.pos.x || self.pos.x > (other.pos.x + other.size.x)) return false;
	if((self.pos.y + self.size.y) < other.pos.y || self.pos.y > (other.pos.y + other.size.y)) return false;
	
	return true;
}

@end
