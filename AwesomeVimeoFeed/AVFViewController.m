//
//  AVFViewController.m
//  AwesomeVimeoFeed
//
//  Created by Juan Manuel Serruya on 3/22/14.
//  Copyright (c) 2014 Juan Manuel Serruya. All rights reserved.
//

#import "AVFViewController.h"
#import "AVFAPIWrapper.h"
#import "SVProgressHUD.h"

@interface AVFViewController ()

@end

@implementation AVFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [SVProgressHUD showWithStatus:@"Loading Feed"];
    [[AVFAPIWrapper instance] requestVideosForPage:2 callback:^(BOOL success, NSData *response, NSError *error) {
        NSDictionary * videos = (NSDictionary*) response;
        NSLog(@"%@", videos);
        [SVProgressHUD dismiss];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
