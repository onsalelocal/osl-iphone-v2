//
//  WebService.m
//  OrderMenu
//
//  Created by tiankong360 on 13-7-17.
//  Copyright (c) 2013年 tiankong360. All rights reserved.
//

#import "WebService.h"
#import "TKHttpRequest.h"

@implementation WebService
//+(ASIHTTPRequest *)classInterfaceConfig:(int)aResultID
//{
//    ASIHTTPRequest *request=[TKHttpRequest RequestTKUrl:CLASS_URL];
//    NSString *postStr=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\
//                       <soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\
//                       <soap:Body>\
//                       <GetList xmlns=\"http://tempuri.org/\">\
//                       <id>%d</id>\
//                       </GetList>\
//                       </soap:Body>\
//                       </soap:Envelope>",aResultID];
//    [request addRequestHeader:@"Host" value:@"interface.hcgjzs.com"];
//    [request addRequestHeader:@"Content-Type" value:@"text/xml; charset=utf-8"];
//    [request addRequestHeader:@"Content-Length" value:[NSString stringWithFormat:@"%d",postStr.length]];
//    [request addRequestHeader:@"SOAPAction" value:@"http://tempuri.org/GetList"];
//    [request setPostBody:(NSMutableData *)[postStr dataUsingEncoding:4]];
//    return request;
//}
#pragma mark - 登录接口
+(ASIHTTPRequest *)LoginWithUserName:(NSString *)aName password:(NSString *)aPwd
{
    ASIHTTPRequest * request = [TKHttpRequest RequestNoCacheUrl:SIGN_UP];
  //  NSUUID* uuid = [[UIDevice currentDevice]identifierForVendor];
    NSUUID * uuid = [[NSUUID alloc] initWithUUIDString:@"6986564ddd"];
    NSString *version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
    //NSString* userID = [[NSUserDefaults standardUserDefaults] valueForKey:@""];
    NSString * userID = @"GUEST";
    NSString *header = [NSString stringWithFormat:@"ios;%@;%@;%@;%f;%f;%ld",[uuid UUIDString], version, userID,0.0, 0.0, (long)[[NSDate date]timeIntervalSince1970]];
//    NSString* s =//@"firstName=firstName&lastName=lastName&password=password&login=email@email.com&zipcode=12345";
    NSString * s = [NSString stringWithFormat:@"firstName=firstName&lastName=lastName&password=%@&login=%@&zipcode=12345",aName,aPwd];
    [request setPostBody: (NSMutableData *)[s dataUsingEncoding:NSUTF8StringEncoding]];
    [request addRequestHeader:header value:@"Reqid"];
    [request addRequestHeader:@"application/x-www-form-urlencoded" value:@"content-type"];
    [request addRequestHeader:@"application/json" value:@"Accept"];
    [request setUseCookiePersistence:YES];
    NSString *msgLength = [NSString stringWithFormat:@"%d", [[s dataUsingEncoding:NSUTF8StringEncoding] length]];
    [request addRequestHeader:msgLength value:@"Content-Length"];
    return request;
}
+(ASIHTTPRequest *)GetStoryListLatitude:(float)aLat longitude:(float)aLong radius:(float)aRadius offset:(int)aOffiset size:(int)aSize category:(NSString *)optional offer:(NSString *)aOptional
{
    ASIHTTPRequest * request = [TKHttpRequest RequestHaveCacheUrl:GET_NEARY_STORY];
    //  NSUUID* uuid = [[UIDevice currentDevice]identifierForVendor];
    NSUUID * uuid = [[NSUUID alloc] initWithUUIDString:@"6986564ddd"];
    NSString *version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
    //NSString* userID = [[NSUserDefaults standardUserDefaults] valueForKey:@""];
    NSString * userID = @"GUEST";
    NSString *header = [NSString stringWithFormat:@"ios;%@;%@;%@;%f;%f;%ld",[uuid UUIDString], version, userID,0.0, 0.0, (long)[[NSDate date]timeIntervalSince1970]];
    NSString * s = [NSString stringWithFormat:@"latitude=%f&longitude=%f&radius=%f&offset=%d&size=%d&category=%@&offer=%@",aLat,aLong,aRadius,0,20,optional,aOptional];
    [request setPostBody: (NSMutableData *)[s dataUsingEncoding:NSUTF8StringEncoding]];
    [request addRequestHeader:header value:@"Reqid"];
    [request addRequestHeader:@"application/json" value:@"content-type"];
    [request addRequestHeader:@"application/json" value:@"Accept"];
    [request setUseCookiePersistence:YES];
    NSString *msgLength = [NSString stringWithFormat:@"%d", [[s dataUsingEncoding:NSUTF8StringEncoding] length]];
    [request addRequestHeader:msgLength value:@"Content-Length"];
    return request;
}

@end
