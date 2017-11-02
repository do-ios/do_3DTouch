//
//  do_3DTouch_SM.m
//  DoExt_API
//
//  Created by @userName on @time.
//  Copyright (c) 2015年 DoExt. All rights reserved.
//

#import "do_3DTouch_SM.h"

#import "doScriptEngineHelper.h"
#import "doIScriptEngine.h"
#import "doInvokeResult.h"
#import "doJsonHelper.h"
#import <UIKit/UIKit.h>

@implementation do_3DTouch_SM
#pragma mark - 方法
#pragma mark - 同步异步方法的实现
//同步
//异步
- (void)addShortcutItem:(NSArray *)parms
{
    //异步耗时操作，但是不需要启动线程，框架会自动加载一个后台线程处理这个函数
    NSDictionary *_dictParas = [parms objectAtIndex:0];
    //参数字典_dictParas
    //自己的代码实现
    NSString *typeID = [doJsonHelper GetOneText:_dictParas :@"id" :@""];
    NSString *title = [doJsonHelper GetOneText:_dictParas :@"title":@""];
    NSString *subTitle = [doJsonHelper GetOneText:_dictParas :@"subTitle":@""];
    NSString *icon = [doJsonHelper GetOneText:_dictParas :@"icon":@""];
    NSDictionary *userInfo = [doJsonHelper GetOneNode:_dictParas :@"userInfo"];
    UIApplicationShortcutIcon *shortcutIcon = [self getShortIcon:icon];
    UIApplicationShortcutItem *shortcutItem = [[UIApplicationShortcutItem alloc]initWithType:typeID localizedTitle:title localizedSubtitle:subTitle icon:shortcutIcon userInfo:userInfo];
    NSArray *itmes = [UIApplication sharedApplication].shortcutItems;
    NSMutableArray *mutableItems = [NSMutableArray arrayWithArray:itmes];
    for (UIApplicationShortcutItem *shortcutItem in itmes) {
        if ([shortcutItem.type isEqualToString:typeID]) {
            [mutableItems removeObject:shortcutItem];
        }
    }
    [mutableItems insertObject:shortcutItem atIndex:0];
    [UIApplication sharedApplication].shortcutItems = mutableItems;
}
- (void)removeShortcutItem:(NSArray *)parms
{
    //异步耗时操作，但是不需要启动线程，框架会自动加载一个后台线程处理这个函数
    NSDictionary *_dictParas = [parms objectAtIndex:0];
    //参数字典_dictParas
    //自己的代码实现
    NSString *typeID = [doJsonHelper GetOneText:_dictParas :@"id" :@""];
    NSArray *itmes = [UIApplication sharedApplication].shortcutItems;
    if (itmes.count < 1) {
        return;
    }
    NSMutableArray *mutableItems = [NSMutableArray array];
    for (UIApplicationShortcutItem *shortcutItem in itmes) {
        if (![shortcutItem.type isEqualToString:typeID]) {
            [mutableItems addObject:shortcutItem];
        }
    }
    [UIApplication sharedApplication].shortcutItems = mutableItems;
}
-(UIApplicationShortcutIcon *)getShortIcon:(NSString *)icon
{
    UIApplicationShortcutIconType type;
    if ([icon isEqualToString:@"Compose"]) {
        type = UIApplicationShortcutIconTypeCompose;
    }
    else if ([icon isEqualToString:@"Play"])
    {
        type = UIApplicationShortcutIconTypePlay;
    }
    else if ([icon isEqualToString:@"Pause"])
    {
        type = UIApplicationShortcutIconTypePause;
    }
    else if ([icon isEqualToString:@"Add"])
    {
        type = UIApplicationShortcutIconTypeAdd;
    }
    else if ([icon isEqualToString:@"Location"])
    {
        type = UIApplicationShortcutIconTypeLocation;
    }
    else if ([icon isEqualToString:@"Search"])
    {
        type = UIApplicationShortcutIconTypeSearch;
    }
    else if ([icon isEqualToString:@"Share"])
    {
        type = UIApplicationShortcutIconTypeShare;
    }
    else if ([icon isEqualToString:@"Prohibit"])
    {
        type = UIApplicationShortcutIconTypeProhibit;
    }
    else if ([icon isEqualToString:@"Contact"])
    {
        type = UIApplicationShortcutIconTypeContact;
    }
    else if ([icon isEqualToString:@"Home"])
    {
        type = UIApplicationShortcutIconTypeHome;
    }
    else if ([icon isEqualToString:@"MarkLocation"])
    {
        type = UIApplicationShortcutIconTypeMarkLocation;
    }
    else if ([icon isEqualToString:@"Favorite"])
    {
        type = UIApplicationShortcutIconTypeFavorite;
    }
    else if ([icon isEqualToString:@"Love"])
    {
        type = UIApplicationShortcutIconTypeLove;
    }
    else if ([icon isEqualToString:@"Cloud"])
    {
        type = UIApplicationShortcutIconTypeCloud;
    }
    else if ([icon isEqualToString:@"Confirmation"])
    {
        type = UIApplicationShortcutIconTypeConfirmation;
    }
    else if ([icon isEqualToString:@"Invitation"])
    {
        type = UIApplicationShortcutIconTypeInvitation;
    }
    else if ([icon isEqualToString:@"Mail"])
    {
        type = UIApplicationShortcutIconTypeMail;
    }
    else if ([icon isEqualToString:@"Message"])
    {
        type = UIApplicationShortcutIconTypeMessage;
    }
    else if ([icon isEqualToString:@"Date"])
    {
        type = UIApplicationShortcutIconTypeDate;
    }
    else if ([icon isEqualToString:@"Time"])
    {
        type = UIApplicationShortcutIconTypeTime;
    }
    else if ([icon isEqualToString:@"CapturePhoto"])
    {
        type = UIApplicationShortcutIconTypeCapturePhoto;
    }
    else if ([icon isEqualToString:@"CaptureVideo"])
    {
        type = UIApplicationShortcutIconTypeCaptureVideo;
    }
    else if ([icon isEqualToString:@"Task"])
    {
        type = UIApplicationShortcutIconTypeTask;
    }
    else if ([icon isEqualToString:@"TaskCompleted"])
    {
        type = UIApplicationShortcutIconTypeTaskCompleted;
    }
    else if ([icon isEqualToString:@"Alarm"])
    {
        type = UIApplicationShortcutIconTypeAlarm;
    }
    else if ([icon isEqualToString:@"Bookmark"])
    {
        type = UIApplicationShortcutIconTypeBookmark;
    }
    else if ([icon isEqualToString:@"Shuffle"])
    {
        type = UIApplicationShortcutIconTypeShuffle;
    }
    else if ([icon isEqualToString:@"Audio"])
    {
        type = UIApplicationShortcutIconTypeAudio;
    }
    else if ([icon isEqualToString:@"Update"])
    {
        type = UIApplicationShortcutIconTypeUpdate;
    }
    UIApplicationShortcutIcon *ShortcutIcon = [UIApplicationShortcutIcon iconWithType:type];
    return ShortcutIcon;
}
@end