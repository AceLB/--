//
//  AppDelegate.m
//  DriverOfRentalCar
//
//  Created by song longbiao on 13-4-28.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    application.applicationIconBadgeNumber = 0;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    /** 注册推送通知功能, */
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
    
    //判断程序是不是由推送服务完成的
    if (launchOptions) {
        NSDictionary* pushNotificationKey = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
        if (pushNotificationKey) {
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"**推送消息**"
                                                            message:[NSString stringWithFormat:@"%@",pushNotificationKey]
                                                           delegate:self
                                                  cancelButtonTitle:@"不上岗"
                                                  otherButtonTitles:@"上岗",nil];
            [alert show];
            [self alertNotice:@"" withMSG:@"这是通过推送窗口启动的程序，你可以在这里处理推送内容" cancleButtonTitle:@"知道了" otherButtonTitle:nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"LayOn" object:nil];
            [[ViewController viewCtl] myStatusAction];
        }
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - 实现远程推送需要实现的监听接口
/** 接收从苹果服务器返回的唯一的设备token，该token需要发送回推送服务器*/
- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSLog(@"%@",deviceToken);
    NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:token forKey:@"deviceToken"];
    [user synchronize];
    
}


/** 接收注册推送通知功能时出现的错误，并做相关处理*/
- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
    NSLog(@"apns -> 注册推送功能时发生错误， 错误信息:\n %@", err);
    //    [self alertNotice:@"注册推送功能时发生错误" withMSG:[err localizedDescription] cancleButtonTitle:@"Ok" otherButtonTitle:@""];
}

//程序处于启动状态，或者在后台运行时，会接收到推送消息，解析处理
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    NSLog(@"\napns -> didReceiveRemoteNotification,Receive Data:\n%@", userInfo);
    //把icon上的标记数字设置为0,
    application.applicationIconBadgeNumber = 0;
    if ([[userInfo objectForKey:@"aps"] objectForKey:@"alert"]!=NULL) {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"**推送消息**"
                                                        message:[[userInfo objectForKey:@"aps"] objectForKey:@"alert"]
                                                       delegate:self
                                              cancelButtonTitle:@"不上岗"
                                              otherButtonTitles:@"上岗",nil];
        alert.tag = alert_tag_push;
        [alert show];
    }
}
#pragma mark - 处理推送服务器push过来的数据
-(void) pushAlertButtonClicked:(NSInteger)buttonIndex
{
    NSLog(@"响应推送对话框");
    if (buttonIndex == 0) {
        NSLog(@"--->点了第一个按钮");
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"LayOn" object:nil];
        [[ViewController viewCtl] myStatusAction];
    }
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (alertView.tag) {
        case alert_tag_push:
        {
            [self pushAlertButtonClicked:buttonIndex];
        }
            break;
        default:
            break;
    }
}

-(void)alertNotice:(NSString *)title withMSG:(NSString *)msg cancleButtonTitle:(NSString *)cancleTitle otherButtonTitle:(NSString *)otherTitle
{
    UIAlertView *alert;
    if(!otherTitle || [otherTitle isEqualToString:@""])
        alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:cancleTitle otherButtonTitles:nil,nil];
    else
        alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:cancleTitle otherButtonTitles:otherTitle,nil];
    [alert show];
}
@end
