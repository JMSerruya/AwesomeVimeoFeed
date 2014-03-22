//
//  AVFVideoCell.h
//  AwesomeVimeoFeed
//
//  Created by Juan Manuel Serruya on 3/22/14.
//  Copyright (c) 2014 Juan Manuel Serruya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AVFVideoCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *userPortrait;
@property (strong, nonatomic) IBOutlet UILabel *userName;
@property (strong, nonatomic) IBOutlet UILabel *videoUploadDate;
@property (strong, nonatomic) IBOutlet UIImageView *videoThumb;
@property (strong, nonatomic) IBOutlet UILabel *videoDescription;

@property (strong, nonatomic) IBOutlet UILabel *videoTitle;

- (void)setData:(NSDictionary*)data;
@end
