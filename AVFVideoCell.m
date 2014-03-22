//
//  AVFVideoCell.m
//  AwesomeVimeoFeed
//
//  Created by Juan Manuel Serruya on 3/22/14.
//  Copyright (c) 2014 Juan Manuel Serruya. All rights reserved.
//

#import "AVFVideoCell.h"
#import "UIImageView+AFNetworking.h"

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
- (IBAction)playButton:(id)sender
{
    NSLog(@"Not Implemented");
}

- (void)setData:(NSDictionary*)data
{
    self.userName.text = [data objectForKey:@"user_name"];
    [self.userPortrait setImageWithURL:[NSURL URLWithString:[data objectForKey:@"user_portrait_large"]]
                      placeholderImage:nil];
    self.videoUploadDate.text = [self formatDate:[data objectForKey:@"upload_date"]];
    [self.videoThumb setImageWithURL:[NSURL URLWithString:[data objectForKey:@"thumbnail_large"]]
                      placeholderImage:nil];
    self.videoDescription.text = [self stringByStrippingHTML:[data objectForKey:@"description"]];
    self.videoTitle.text = [data objectForKey:@"title"];
    NSLog(@"%@", data);
}

- (NSString*)formatDate:(NSString*)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *dt = [formatter dateFromString:date];

    [formatter setDateStyle:NSDateFormatterFullStyle];
    NSString *dateAsString = [formatter stringFromDate:dt];

    return dateAsString;
}

#pragma mark - Remove HTML Tags
- (NSString *)stringByStrippingHTML:(NSString *)inputString
{
    NSMutableString *outString = [[NSMutableString alloc] initWithString:inputString];

    if ([inputString length] > 0)
    {
        NSRange r;

        while ((r = [outString rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        {
            [outString deleteCharactersInRange:r];
        }
    }

    return outString;
}

@end
