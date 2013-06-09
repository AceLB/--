//
//  AppDelegate.m
//  UserOfRentalCar
//
//  Created by song longbiao on 13-5-2.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "AlixPay.h"
#import "DataVerifier.h"

@implementation AppDelegate
BMKMapManager *mapManager; //百度地图引擎
//地图引擎的启动，就像车子先启动发动机一样, 需要注册keys
- (void)initBMKMap
{
    mapManager = [[BMKMapManager alloc] init];
    BOOL ret = [mapManager start:@"5663CFCCD252FA944194396CE2F3EB5F9EE60753"generalDelegate:self];
    if (!ret)
    {
        NSLog(@"manager start failed!");
    }
    //开启定位服务
    BMKMapView *mapView = [[BMKMapView alloc]init];
	mapView.showsUserLocation = YES;
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (kCLAuthorizationStatusDenied == status || kCLAuthorizationStatusRestricted == status) {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                             message:@"您的定位服务没有开启,请到隐私设置中开启APP的权限"
                                                            delegate:nil
                                                   cancelButtonTitle:@"确定"
                                                   otherButtonTitles:nil];
        [alertView show];    }else{
        NSLog(@"no");
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //启动地图位置管理
    [self initBMKMap];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
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
//支付宝回调
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
	//如果该 URL 不是由安全支付回调打开的,则返回 nil。
	[self parseURL:url application:application];
	return YES;
}

//程序先跳到支付宝，然后支付宝又跳到程序，也就是处理支付宝支付成功之后的跳转。判断支付是否成功
- (void)parseURL:(NSURL *)url application:(UIApplication *)application {
	AlixPay *alixpay = [AlixPay shared];
	AlixPayResult *result = [alixpay handleOpenURL:url];
	if (result) {
		//是否支付成功
		if (9000 == result.statusCode)
		{
			/*
			 *用公钥验证签名
			 */
          			id<DataVerifier> verifier = CreateRSADataVerifier([[NSBundle mainBundle] objectForInfoDictionaryKey:@"RSA public key"]);
			
			
			if ([verifier verifyString:result.resultString withSign:result.signString]) {
				UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                     message:result.statusMessage
                                                                    delegate:nil
                                                           cancelButtonTitle:@"确定"
                                                           otherButtonTitles:nil];
				[alertView show];
			}//验签错误
			else {
				UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                     message:@"签名错误"
                                                                    delegate:nil
                                                           cancelButtonTitle:@"确定"
                                                           otherButtonTitles:nil];
				[alertView show];
			}
		}
		//如果支付失败,可以通过result.statusCode查询错误码
		else {
			UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                 message:result.statusMessage
                                                                delegate:nil
                                                       cancelButtonTitle:@"确定"
                                                       otherButtonTitles:nil];
			[alertView show];
		}
	}
}

- (NSString *)upToString:(NSString *)string
{
    NSArray *array = [string componentsSeparatedByString:@"="];
    NSString *infor = [[array objectAtIndex:1] stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    return infor;
}
@end
