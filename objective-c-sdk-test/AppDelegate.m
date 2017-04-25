//
//  AppDelegate.m
//  objective-c-sdk-test
//
//  Created by Matt Smollinger on 10/25/16.
//  Copyright © 2016 Mapzen. All rights reserved.
//

#import "AppDelegate.h"
@import Mapzen_ios_sdk;

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  NSString *apiKey = [self getEnvironmentVariable:@"MAPZEN_API_KEY"];
  NSAssert([apiKey containsString:@"mapzen-"], @"Set your Mapzen API key in the scheme by adding a MAPZEN_API_KEY environment variable.");
  [[MapzenManager sharedManager] setApiKey:apiKey];
  return YES;
}

- (NSString *)getEnvironmentVariable:(NSString *)key {
  return NSProcessInfo.processInfo.environment[key];
}

@end
