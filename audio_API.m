//
//  alert_API.m
//  ForgeInspector
//
//  Created by Connor Dunn on 27/07/2012.
//  Copyright (c) 2012 Trigger Corp. All rights reserved.
//

#import "audio_API.h"

static AVAudioPlayer* player = nil;

@implementation audio_API

+ (void)play:(ForgeTask*)task filename:(NSString *)filename {

    // grab file url
    NSString * bundlePath = [[NSBundle mainBundle] pathForResource:@"audio" ofType:@"bundle"];
    NSBundle * myBundle = [NSBundle bundleWithPath:bundlePath];
    NSURL * url = [myBundle URLForResource:filename withExtension:nil];
    
    // test url
    if(![url isFileURL]) {
        NSLog(@"NOT a file url: %@", [url path]);
        [task error:[NSString stringWithFormat:@"%@%@%@%@", @"NOT a file url: ", [url path], @" from ", filename]];
    } else
        NSLog(@"IS a file url: %@", [url path]);
    
    // create the player
    NSError* error = nil;
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if(!player)
    {
        NSLog(@"Error creating player: %@", error);
        [task error:[NSString stringWithFormat:@"%@%@", @"Error creating player: ", [error localizedDescription]]];
    };
    
    player.delegate = (id<AVAudioPlayerDelegate>)[audio_API class];
    
    // activate the session (to use ducking)
    AudioSessionSetActive(true);
    
    // play the file
    [player play];
    
    // return success
	[task success:nil];
}

+ (void)pause:(ForgeTask*)task {
    [ForgeLog d:@"Pausing player playing..."];
    [ForgeLog d:[player url]];
    [player pause];
    
	[task success:nil];
}
+ (void)stop:(ForgeTask*)task {
    [ForgeLog d:@"Stopping player playing..."];
    [ForgeLog d:[player url]];
    [player stop];
    
	[task success:nil];
}
+ (void)mute:(ForgeTask*)task {
    [ForgeLog d:@"Muting player playing..."];
    [ForgeLog d:[player url]];
    player.volume = 0.0;
    
	[task success:nil];
}
+ (void)unmute:(ForgeTask*)task {
    [ForgeLog d:@"Unmuting player playing..."];
    [ForgeLog d:[player url]];
    player.volume = 1.0;
    
	[task success:nil];
}


+ (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if (flag) {
        [ForgeLog d:@"Audio finished playing successfully."];
    } else {
        [ForgeLog d:@"Audio did not finish playing successfully."];
    }
    
    // deactivate the session (to use ducking)
    AudioSessionSetActive(false);
    
    // call the audio.finishedPlaying event
    [[ForgeApp sharedApp] event:@"audio.finishedPlaying" withParam:nil];
}

+ (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{
    [ForgeLog d:@"Audio had error decoding."];
    [ForgeLog e:error];
    
    // deactivate the session (to use ducking)
    AudioSessionSetActive(false);
    
    // call the audio.decodeErrorOccurred event
    [[ForgeApp sharedApp] event:@"audio.decodeErrorOccurred" withParam:nil];
}

@end
