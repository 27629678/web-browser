//
//  OCRunner.m
//  WKWebViewDemo
//
//  Created by hzyuxiaohua on 2018/7/11.
//  Copyright © 2018 hzyuxiaohua. All rights reserved.
//

#import "OCRunner.h"

#import <GRMustache/GRMustache.h>

@implementation OCRunner

+ (void)run
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sig" ofType:@"html"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    NSString *ftl = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    if (ftl.length == 0) {
        return;
    }
    
    NSError *error = nil;
    NSDictionary *obj = @{ @"title": @"hello",
                           @"avatar_section" : @YES,
                           @"url": @"https://"
                           };
    NSString *html = [GRMustacheTemplate renderObject:obj fromString:ftl error:&error];
    NSLog(@"");
}

@end
