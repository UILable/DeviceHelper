
//
//  DeviceHelper.m
//  SDWebImage修改
//
//  Created by admin on 15/12/20.
//  Copyright © 2015年 AlezJi. All rights reserved.
//

#import "DeviceHelper.h"
#import <ifaddrs.h>
#import <arpa/inet.h>
@implementation DeviceHelper

//获取ip地址
/*
 倒入两个库
 #import <ifaddrs.h>
 #import <arpa/inet.h>
 */
+(NSString *)getIpAddresses{
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0)
    {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL)
        {
            if(temp_addr->ifa_addr->sa_family == AF_INET)
            {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"])
                {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
}

//颜色转变成图片
+(UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
//app评分跳转--把id换掉
+(void)goToAppStore
{
    NSString *str = [NSString stringWithFormat:
                     @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%d",547203890];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}
//获取uuid
+(NSString *)getUserUUID
{
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}
//获取软件版本号
+(NSString*)getAppVision
{
    NSDictionary *dict = [[NSBundle mainBundle]infoDictionary];
    return [dict objectForKey:@"CFBundleVersion"];
}
//获取系统版本

+(NSString*)getDeviceVision
{
    return [UIDevice currentDevice].systemVersion;
}

//获取系统名字
+(NSString*)getDeviceOS
{
    return [UIDevice currentDevice].systemName;
}
@end
