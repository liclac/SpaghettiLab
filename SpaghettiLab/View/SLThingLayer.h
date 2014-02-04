//
//  SLThingLayer.h
//  SpaghettiLab
//
//  Created by Johannes Ekberg on 2013-09-30.
//  Copyright (c) 2013 MacaroniCode. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "SLThing.h"

@interface SLThingLayer : CAShapeLayer

@property (nonatomic, weak) SLThing *thing;

- (id)initWithThing:(SLThing *)thing;

@end
