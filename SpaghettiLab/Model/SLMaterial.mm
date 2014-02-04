//
//  SLMaterial.m
//  SpaghettiLab
//
//  Created by Johannes Ekberg on 2013-09-30.
//  Copyright (c) 2013 MacaroniCode. All rights reserved.
//

#import "SLMaterial.h"

@implementation SLMaterial

- (id)initWithDensity:(float)density
{
	if((self = [super init]))
	{
		_density = density;
	}
	
	return self;
}

@end
