//
//  SLWorld.h
//  SpaghettiLab
//
//  Created by Johannes Ekberg on 2013-10-01.
//  Copyright (c) 2013 MacaroniCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLTypes.h"

@class SLWorld;
@class SLThing;

@protocol SLWorldDelegate <NSObject>

- (void)world:(SLWorld *)world didAddThing:(SLThing *)thing;
- (void)world:(SLWorld *)world didRemoveThing:(SLThing *)thing;
- (SLVector)worldBoundary:(SLWorld *)world;

@end

@interface SLWorld : NSObject
{
    NSMutableArray *_things;
}

// References
@property (nonatomic, readonly, strong) NSArray *things;
@property (nonatomic, weak) id<SLWorldDelegate> delegate;

// Properties
@property (nonatomic, assign) SLVector g;

- (void)addThing:(SLThing *)thing;
- (void)removeThing:(SLThing *)thing;
- (void)tick:(NSTimeInterval)t;

- (void)attemptMotion:(SLVector &)motion forThing:(SLThing *)thing;

@end
