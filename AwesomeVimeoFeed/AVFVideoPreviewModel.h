//
//  AVFVideoPreviewModel.h
//  AwesomeVimeoFeed
//
//  Created by Juan Manuel Serruya on 3/22/14.
//  Copyright (c) 2014 Juan Manuel Serruya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AVFVideoPreviewModel : NSObject

@property NSString *userPortrait;
@property NSString *userName;
@property NSString *videoUploadDate;
@property NSString *videoThumb;
@property NSString *videoDescription;
@property NSString *videoTitle;
- (id)initWithDictionary:(NSDictionary *)dictionary;
@end
