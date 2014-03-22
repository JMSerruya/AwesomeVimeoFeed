//
//  AVFFeedViewController.m
//  AwesomeVimeoFeed
//
//  Created by Juan Manuel Serruya on 3/22/14.
//  Copyright (c) 2014 Juan Manuel Serruya. All rights reserved.
//

#import "AVFFeedViewController.h"
//#import "SVProgressHUD"
#import "AVFAPIWrapper.h"
#import "AVFVideoCell.h"

@interface AVFFeedViewController ()

@end

@implementation AVFFeedViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UINib * feedCellNib = [UINib nibWithNibName:@"VideoFeedItem" bundle:nil];
    [self.tableView registerNib:feedCellNib forCellReuseIdentifier:@"AVFVideoCell"];

    //[SVProgressHUD showWithStatus:@"Loading Feed"];
    [[AVFAPIWrapper instance] requestVideosForPage:1 callback:^(BOOL success, NSData *response, NSError *error) {
        self.dataArray = (NSArray*) response;
        NSLog(@"%d", [self.dataArray count]);
        [self.tableView reloadData];
        //[SVProgressHUD dismiss];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return 360;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AVFVideoCell";

    AVFVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell setData:[self.dataArray objectAtIndex:indexPath.row]];
    
    
    return cell;
}
@end
