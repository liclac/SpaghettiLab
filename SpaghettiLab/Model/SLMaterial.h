//
//  SLMaterial.h
//  SpaghettiLab
//
//  Created by Johannes Ekberg on 2013-09-30.
//  Copyright (c) 2013 MacaroniCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLMaterial : NSObject

@property (nonatomic, assign) float density;

- (id)initWithDensity:(float)density;

@end
