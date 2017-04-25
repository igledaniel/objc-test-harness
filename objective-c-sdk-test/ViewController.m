//
//  ViewController.m
//  objective-c-sdk-test
//
//  Created by Matt Smollinger on 10/25/16.
//  Copyright © 2016 Mapzen. All rights reserved.
//

#import "ViewController.h"
@import Mapzen_ios_sdk;

@interface ViewController ()
@property (nonatomic, strong) MZMapViewController *map;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setupMap];

  [_map loadStyleAsync:MapStyleWalkabout error:nil onStyleLoaded:^(enum MapStyle style) {
    BOOL showingCurrLoc = [_map showCurrentLocation:true];
    if (showingCurrLoc) {
      [_map showFindMeButon:true];
    }
  }];
}


- (void)setupMap {
  _map = [[MZMapViewController alloc] init];
  [self addChildViewController:_map];

  [self.view addSubview:_map.view];
  _map.view.translatesAutoresizingMaskIntoConstraints = false;
  [_map.view.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = true;
  [_map.view.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = true;
  [_map.view.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = true;
  [_map.view.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = true;

  [_map didMoveToParentViewController:self];
}

@end
