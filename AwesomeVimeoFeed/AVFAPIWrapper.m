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

- (void)performMethod:(NSString *)method AtPath:(NSString *)path parameters:(NSDictionary *)params callback:(CompletionBlock)callback
{
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:method URLString:path parameters:params error:nil];
    [request setTimeoutInterval:20.0];

    [self performRequest:request callback:callback];
}

-(void)performRequest:(NSURLRequest *)request callback:(CompletionBlock)callback
{

    AFHTTPRequestOperation * httpOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [httpOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (callback != nil) callback(TRUE,responseObject,nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        @try {
            if (operation.response.statusCode == 401) {

            }
        } @catch (NSException *ex) {

        }

        if (callback != nil) callback(FALSE,nil,error);
    }];
    [httpOperation start];
}


- (void)performGetRequestAtPath:(NSString *)path parameters:(NSDictionary *)params callback:(CompletionBlock)callback
{
    [self performMethod:@"GET" AtPath:path parameters:params callback:callback];
}
@end
