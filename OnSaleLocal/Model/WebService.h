//
//  WebService.h
//  OrderMenu
//
//  Created by tiankong360 on 13-7-17.
//  Copyright (c) 2013年 tiankong360. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"


@interface WebService : NSObject
+(ASIHTTPRequest *)LoginWithUserName:(NSString *)aName password:(NSString *)aPwd;
+(ASIHTTPRequest *)GetStoryListLatitude:(float)aLat longitude:(float)aLong radius:(float)aRadius offset:(int)aOffiset size:(int)aSize category:(NSString *)optional offer:(NSString *)aOptional;
@end
