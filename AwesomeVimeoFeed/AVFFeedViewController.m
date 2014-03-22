//
//  AVFFeedViewController.m
//  AwesomeVimeoFeed
//
//  Created by Juan Manuel Serruya on 3/22/14.
//  Copyright (c) 2014 Juan Manuel Serruya. All rights reserved.
//

#import "AVFFeedViewController.h"
#import "AVFAPIWrapper.h"
#import "AVFVideoCell.h"
#import "AVFVideoPreviewModel.h"


@interface AVFFeedViewController ()

@end

@implementation AVFFeedViewController
int _currentPage;
int _totalPages = 3; //Hardcoded :(

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
    _currentPage = 1;
    self.dataArray = [[NSMutableArray alloc] init];
    UINib * feedCellNib = [UINib nibWithNibName:@"VideoFeedItem" bundle:nil];
    [self.tableView registerNib:feedCellNib forCellReuseIdentifier:@"AVFVideoCell"];
    [self fetchVideos];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - fetchVideos

- (void)fetchVideos
{
    [[AVFAPIWrapper instance] requestVideosForPage:_currentPage callback:^(BOOL success, NSData *response, NSError *error) {
        NSArray *dictionaryArray = (NSArray*)response;
        for (id videoDictionary in dictionaryArray) {
            AVFVideoPreviewModel *videoModel = [[AVFVideoPreviewModel alloc]
                          initWithDictionary:videoDictionary];
            if (![self.dataArray containsObject:videoModel]) {
                [self.dataArray addObject:videoModel];
            }
        }
        [self.tableView reloadData];
    }];
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
    AVFVideoCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"AVFVideoCell" forIndexPath:indexPath];
    [cell setData:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView
{
    CGPoint offset = aScrollView.contentOffset;
    CGRect bounds = aScrollView.bounds;
    CGSize size = aScrollView.contentSize;
    UIEdgeInsets inset = aScrollView.contentInset;
    float y = offset.y + bounds.size.height - inset.bottom;
    float h = size.height;
    float reload_distance = 100; // Distance from bottom.
    if (y >= h + reload_distance )
    {
        if (_currentPage < _totalPages)
        {
            _currentPage++;
            [self fetchVideos];
        }
    }
}


@end
