//
//  SLThing.h
//  SpaghettiLab
//
//  Created by Johannes Ekberg on 2013-09-30.
//  Copyright (c) 2013 MacaroniCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <deque>
#import "SLTypes.h"
#import "SLMaterial.h"

@class SLWorld;

@interface SLThing : NSObject
{
	SLVector _tmpVector;
}

// References
@property (nonatomic, weak) SLWorld *world;

// Properties
@property (nonatomic, assign) SLVector size;
@property (nonatomic, assign) SLMaterial *material;

// Calculated Properties
@property (nonatomic, readonly) float mass;

// State
@property (nonatomic, assign) SLVector v, pos;
@property (nonatomic, assign) std::deque<SLVector> forces;

- (id)initWithMaterial:(SLMaterial *)material inWorld:(SLWorld *)world;

- (void)tickBegin:(NSTimeInterval)t;
- (void)applyForce:(const SLVector&)f time:(NSTimeInterval)t;
- (SLVector)tickEnd:(NSTimeInterval)t;

@end
