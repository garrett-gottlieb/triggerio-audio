//
//  alert_EventListener.m
//  ForgeInspector
//
//  Created by Connor Dunn on 09/10/2012.
//  Copyright (c) 2012 Trigger Corp. All rights reserved.
//

#import "audio_EventListener.h"

@implementation audio_EventListener

//+ (void)applicationWillEnterForeground:(UIApplication *)application {
//	[[ForgeApp sharedApp] event:@"alert.resume" withParam:nil];
//}

+ (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [ForgeLog d:@"Starting audio session."];
    AVAudioSession *session = [AVAudioSession sharedInstance];
    
    // set the category to ambient:
    NSError *setCategoryError = nil;
    BOOL success = [[AVAudioSession sharedInstance]
                    setCategory: AVAudioSessionCategoryAmbient
                    error: &setCategoryError];
    
    if (!success) {
        [ForgeLog e:@"Error setting audio session category."];
    }
    
    // set the ducking to true
    UInt32 duck = 1;
    AudioSessionSetProperty(kAudioSessionProperty_OtherMixableAudioShouldDuck, sizeof(duck), &duck);
    
    // initialize session to inactive
    AudioSessionSetActive(false);
}

@end
