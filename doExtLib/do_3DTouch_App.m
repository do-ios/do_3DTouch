//
//  do_3DTouch_App.m
//  DoExt_SM
//
//  Created by @userName on @time.
//  Copyright (c) 2015年 DoExt. All rights reserved.
//

#import "do_3DTouch_App.h"
#import "do_3DTouch_SM.h"
#import "doScriptEngineHelper.h"

static do_3DTouch_App* instance;
@implementation do_3DTouch_App
@synthesize OpenURLScheme;
+(id) Instance
{
    if(instance==nil)
        instance = [[do_3DTouch_App alloc]init];
    return instance;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    CGFloat sdkVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (sdkVersion>=9.0) {
        UIApplicationShortcutItem *curItem = [launchOptions valueForKey:UIApplicationLaunchOptionsShortcutItemKey];
        if (curItem) {
            [self fireEvent:curItem];
        }
    }
    return YES;
}
- (void) application:(UIApplication *)application performActionForShortcutItem:(nonnull UIApplicationShortcutItem *)shortcutItem completionHandler:(nonnull void (^)(BOOL))completionHandler
{
    [self fireEvent:shortcutItem];
    completionHandler(YES);
}
-(void)fireEvent:(UIApplicationShortcutItem *)curItem
{
    do_3DTouch_SM *touchSM = (do_3DTouch_SM*)[doScriptEngineHelper ParseSingletonModule:nil :@"do_3DTouch" ];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:curItem.type forKey:@"id"];
    [dict setObject:curItem.localizedTitle forKey:@"title"];
    if (curItem.localizedSubtitle) {
        [dict setObject:curItem.localizedSubtitle forKey:@"subTitle"];
    }
    if (curItem.userInfo) {
        [dict setObject:curItem.userInfo forKey:@"userInfo"];
    }
    doInvokeResult *invokeResult = [[doInvokeResult alloc]init];
    [invokeResult SetResultNode:dict];
    [touchSM.EventCenter FireEvent:@"touch" :invokeResult];
}
@end
