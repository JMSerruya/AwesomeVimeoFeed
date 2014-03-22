//
//  AVFVideoCell.m
//  AwesomeVimeoFeed
//
//  Created by Juan Manuel Serruya on 3/22/14.
//  Copyright (c) 2014 Juan Manuel Serruya. All rights reserved.
//

#import "AVFVideoCell.h"

@implementation AVFVideoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)playButton:(id)sender {
    NSLog(@"Not Implemented");
}

@end
