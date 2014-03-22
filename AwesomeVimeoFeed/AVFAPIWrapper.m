//
//  AVFAPIWrapper.m
//  AwesomeVimeoFeed
//
//  Created by Juan Manuel Serruya on 3/22/14.
//  Copyright (c) 2014 Juan Manuel Serruya. All rights reserved.
//

#import "AVFAPIWrapper.h"
#import "AFNetworking.h"

@implementation AVFAPIWrapper

static AVFAPIWrapper *apiInstance = nil;

+(id)instance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (apiInstance == nil) {
            apiInstance = [[self alloc] init];
        }
    });
    return apiInstance;
}

#pragma mark -

- (void)requestVideosForPage:(int)page callback:(CompletionBlock)callback
{
    //Hardcoded values for everything except page number
    //https://developer.vimeo.com/apis/simple#album-request-url
    //http://vimeo.com/api/v2/album/58/videos.json?page=1
    NSString *request = [NSString stringWithFormat:@"http://vimeo.com/api/v2/album/58/videos.json?page=%d", page];
    [self performRequest:request parameters:nil callback:^(BOOL success, NSData *response, NSError *error) {
        callback(success, response, error);
    }];

}

#pragma mark -

-(void)performRequest:(NSString *)path parameters:(NSDictionary *)params callback:(CompletionBlock)callback
{
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];

    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (callback != nil) callback(TRUE,responseObject,nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        @try {
            if (operation.response.statusCode == 401) {

            }
        } @catch (NSException *ex) {

        }

        if (callback != nil) callback(FALSE,nil,error);
    }];
    [operation start];
}

@end
