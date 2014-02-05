//
//  SLWorld.m
//  SpaghettiLab
//
//  Created by Johannes Ekberg on 2013-10-01.
//  Copyright (c) 2013 MacaroniCode. All rights reserved.
//

#import "SLWorld.h"
#import "SLThing.h"

@implementation SLWorld

- (id)init
{
    if((self = [super init]))
    {
		_things = [[NSMutableArray alloc] init];
		
        _g = SLVector(0, 9.82);
    }
    
    return self;
}

- (void)addThing:(SLThing *)thing
{
	[_things addObject:thing];
	[_delegate world:self didAddThing:thing];
}

- (void)removeThing:(SLThing *)thing
{
	[_things removeObject:thing];
	[_delegate world:self didRemoveThing:thing];
}

- (void)tick:(NSTimeInterval)t
{
    for(SLThing *thing in _things)
	{
		[thing tickBegin:t];
		if(thing.mass != 0)
			[thing applyForce:_g time:t];
		SLVector dPos = [thing tickEnd:t];
		
		//thing.pos += dPos;
		[self attemptMotion:dPos forThing:thing];
	}
}

- (void)attemptMotion:(SLVector &)motion forThing:(SLThing *)thing
{
	thing.pos += motion;
	
	// Check world boundaries
	SLVector min = SLVector(0, 0);
	SLVector max = [_delegate worldBoundary:self] - thing.size;	// Account for the thing's size!
	
	if(thing.pos.y > max.y)
	{
		thing.pos = SLVector(thing.pos.x, max.y);
		thing.v = SLVector(thing.v.x, 0);
	}
	else if(thing.pos.x > max.x)
	{
		thing.pos = SLVector(max.x, thing.pos.y);
		thing.v = SLVector(0, thing.v.y);
	}
	
	if(thing.pos.y < min.y)
	{
		thing.pos = SLVector(thing.pos.x, min.y);
		thing.v = SLVector(thing.v.x, 0);
	}
	else if(thing.pos.x < min.x)
	{
		thing.pos = SLVector(min.x, thing.pos.y);
		thing.v = SLVector(0, thing.v.y);
	}
	
	// Check for collissions
	SLVector normal((motion.x > 0 ? 1 : (motion.x < 0 ? -1 : 0)),
					(motion.y > 0 ? 1 : (motion.y < 0 ? -1 : 0)));
	for(SLThing *otherThing in _things)
	{
		// Skip the object iself and anything that doesn't collide with it
		if(thing == otherThing || ![thing collidesWith:otherThing])
			continue;
		
		// Skip objects
		float nv = dot(otherThing.v - thing.v, normal);
		if(nv > 0)
			continue;
		
		float e = MIN(thing.restitution, otherThing.restitution);
		float j = (-(1 + e) * nv) / (1/thing.mass + 1/otherThing.mass);
		
		SLVector impulse = j*normal;
		thing.v -= 1/thing.mass * impulse;
	}
}

@end
