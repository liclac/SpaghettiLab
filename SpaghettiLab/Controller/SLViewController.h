//
//  SLViewController.h
//  SpaghettiLab
//
//  Created by Johannes Ekberg on 2013-09-20.
//  Copyright (c) 2013 MacaroniCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLWorld.h"
#import "SLMaterial.h"

@interface SLViewController : UIViewController <SLWorldDelegate>
{
    NSTimer *_timer;
    NSTimeInterval _lastFrameTime;
	
	SLMaterial *_iron;
}

@property (nonatomic, strong) SLWorld *world;

- (IBAction)actionPlay:(UIBarButtonItem *)sender;
- (void)tick:(NSTimer *)timer;

@end
