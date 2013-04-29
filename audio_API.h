//
//  alert_API.h/Users/gsquare567/forge-workspace/plugins/audio/inspector/ios-inspector/ForgeCore.framework/Headers/ForgeApp.h
//  ForgeInspector
//
//  Created by Connor Dunn on 27/07/2012.
//  Copyright (c) 2012 Trigger Corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <ForgeCore/ForgeCore.h>

@interface audio_API : NSObject<AVAudioPlayerDelegate>

//+ (void)show:(ForgeTask*)task text:(NSString *)text;

+ (void)play:(ForgeTask*)task filename:(NSString *)filename;
+ (void)pause:(ForgeTask*)task;
+ (void)stop:(ForgeTask*)task;
+ (void)mute:(ForgeTask*)task;
+ (void)unmute:(ForgeTask*)task;

@end