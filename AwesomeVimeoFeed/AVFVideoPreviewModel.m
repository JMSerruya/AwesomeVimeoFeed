//
//  AVFVideoPreviewModel.m
//  AwesomeVimeoFeed
//
//  Created by Juan Manuel Serruya on 3/22/14.
//  Copyright (c) 2014 Juan Manuel Serruya. All rights reserved.
//

#import "AVFVideoPreviewModel.h"

@implementation AVFVideoPreviewModel
@synthesize userPortrait,userName,videoTitle,videoDescription,videoUploadDate,videoThumb;

- (id) initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        userPortrait = [dictionary objectForKey:@"user_portrait_large"];
        userName = [dictionary objectForKey:@"user_name"];
        videoTitle = [dictionary objectForKey:@"title"];
        videoDescription = [dictionary objectForKey:@"description"];
        videoUploadDate = [dictionary objectForKey:@"upload_date"];
        videoThumb = [dictionary objectForKey:@"thumbnail_large"];
    }
    return self;
}
@end
