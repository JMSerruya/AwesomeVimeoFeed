//
//  AVFAPIWrapper.h
//  AwesomeVimeoFeed
//
//  Created by Juan Manuel Serruya on 3/22/14.
//  Copyright (c) 2014 Juan Manuel Serruya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFURLRequestSerialization.h"

@interface AVFAPIWrapper : NSObject

typedef void(^CompletionBlock)(BOOL success, NSData * response, NSError * error );
+(id)instance;
@property (nonatomic,strong) AFHTTPRequestSerializer * requestSerializer;

@end
