//
//  DeviceHelper.h

//
//  Created by admin on 15/12/20.
//  Copyright © 2015年 AlezJi. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 和设备相关的一些类
*/
#import <UIKit/UIKit.h>


@interface DeviceHelper : NSObject
//获取设备IP地址  192.168.0.112
+(NSString *)getIpAddresses;

//颜色转变成图片
+(UIImage *)createImageWithColor:(UIColor *)color;

//app评分跳转--把id换掉
+(void)goToAppStore;

//获取uuid   EE2E4823-38B2-46A6-89F2-854EEB349A0E
+(NSString *)getUserUUID;

//获取软件版本号  1.1.1
+(NSString*)getAppVision;

//获取系统版本  9.2
+(NSString*)getDeviceVision;

//获取系统名字  iPhone OS
+(NSString*)getDeviceOS;


@end
