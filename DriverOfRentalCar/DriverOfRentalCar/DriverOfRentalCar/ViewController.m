//
//  ViewController.m
//  DriverOfRentalCar
//
//  Created by song longbiao on 13-4-28.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
static  ViewController *detail = nil;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //隐藏 主界面中下面按钮
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MainBtnHidden) name:@"MainBtnHidden" object:nil];
    //显示 主界面中下面按钮
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MainBtnAppear) name:@"MainBtnAppear" object:nil];
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //取得自己
        detail = self;
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"DriverUser"]) {
        _activityView = [[ActivityViewController alloc] initWithNibName:@"ActivityViewController" bundle:nil];
        }else{
        _loginView = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
        }
        _myStatusView = [[MyStatusViewController alloc] initWithNibName:@"MyStatusViewController" bundle:nil];
        _myLocationView = [[MyLocationViewController alloc] initWithNibName:@"MyLocationViewController" bundle:nil];
        _allOrderView= [[AllOrderViewController alloc] initWithNibName:@"AllOrderViewController" bundle:nil];
        
        appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"DriverUser"]) {
            appDelegate.homePageNav = [[UINavigationController alloc] initWithRootViewController:_activityView ] ;
        }else{
            appDelegate.homePageNav = [[UINavigationController alloc] initWithRootViewController:_loginView ] ;

        }
        appDelegate.myStatusNav = [[UINavigationController alloc] initWithRootViewController:_myStatusView];
        appDelegate.myLocationNav = [[UINavigationController alloc] initWithRootViewController:_myLocationView];
        appDelegate.myOrderNav = [[UINavigationController alloc] initWithRootViewController:_allOrderView] ;
        appDelegate.homePageNav.navigationBarHidden = YES;
        appDelegate.myStatusNav.navigationBarHidden = YES;
        appDelegate.myLocationNav.navigationBarHidden = YES;
        appDelegate.myOrderNav.navigationBarHidden = YES;
        appDelegate.homePageNav.view.frame = CGRectMake(0, 0, 320, [[UIScreen mainScreen] bounds].size.height-64);
        appDelegate.myStatusNav.view.frame = CGRectMake(0, 0, 320, [[UIScreen mainScreen] bounds].size.height-64);
        appDelegate.myLocationNav.view.frame = CGRectMake(0, 0, 320, [[UIScreen mainScreen] bounds].size.height-64);
        appDelegate.myOrderNav.view.frame = CGRectMake(0, 0, 320, [[UIScreen mainScreen] bounds].size.height-64);
        [self.view addSubview:appDelegate.homePageNav.view];
        [self.view addSubview:appDelegate.myStatusNav.view];
        [self.view addSubview:appDelegate.myLocationNav.view];
        [self.view addSubview:appDelegate.myOrderNav.view];
        [self.view bringSubviewToFront:_homePageButton];
        [self.view bringSubviewToFront:_myStatusButton];
        [self.view bringSubviewToFront:_myLocationButton];
        [self.view bringSubviewToFront:_myOrderButton];
        [self homePageAction];
        
    }
    return self;
}

-(void)MainBtnAppear
{
    
    [UIView beginAnimations:@"animations" context:nil];
    [UIView setAnimationDuration:1];
    _homePageButton.alpha = 1;
    _myStatusButton.alpha = 1;
    _myLocationButton.alpha = 1;
    _myOrderButton.alpha = 1;
    [UIView  commitAnimations];
    
    
}
-(void)MainBtnHidden
{
    [UIView beginAnimations:@"animations" context:nil];
    [UIView setAnimationDuration:0.5];
    _homePageButton.alpha = 0;
    _myStatusButton.alpha = 0;
    _myLocationButton.alpha = 0;
    _myOrderButton.alpha = 0;
    [UIView  commitAnimations];
    
    
}
-(IBAction)homePageAction
{
    appDelegate.homePageNav.view.hidden = NO;
    appDelegate.myStatusNav.view.hidden = YES;
    appDelegate.myLocationNav.view.hidden = YES;
    appDelegate.myOrderNav.view.hidden =YES;
    [_homePageButton setImage:[UIImage imageNamed:@"bar_shouye_press_btn.png"] forState:UIControlStateNormal];
    [_myStatusButton setImage:[UIImage imageNamed:@"bar_fenlei_btn.png"] forState:UIControlStateNormal];
    [_myLocationButton setImage:[UIImage imageNamed:@"bar_wanyixia_btn.png"] forState:UIControlStateNormal];
    [_myOrderButton setImage:[UIImage imageNamed:@"bar_gouwuche_btn.png"] forState:UIControlStateNormal];
    [appDelegate.homePageNav popToRootViewControllerAnimated:NO];
}

-(IBAction)myStatusAction
{
    appDelegate.homePageNav.view.hidden = YES;
    appDelegate.myStatusNav.view.hidden = NO;
    appDelegate.myLocationNav.view.hidden = YES;
    appDelegate.myOrderNav.view.hidden =YES;
    [_homePageButton setImage:[UIImage imageNamed:@"bar_shouye_press_btn.png"] forState:UIControlStateNormal];
    [_myStatusButton setImage:[UIImage imageNamed:@"bar_fenlei_btn.png"] forState:UIControlStateNormal];
    [_myLocationButton setImage:[UIImage imageNamed:@"bar_wanyixia_btn.png"] forState:UIControlStateNormal];
    [_myOrderButton setImage:[UIImage imageNamed:@"bar_gouwuche_btn.png"] forState:UIControlStateNormal];
    [appDelegate.homePageNav popToRootViewControllerAnimated:NO];
    
}
-(IBAction)myLocationAction
{
    appDelegate.homePageNav.view.hidden = YES;
    appDelegate.myStatusNav.view.hidden = YES;
    appDelegate.myLocationNav.view.hidden = NO;
    appDelegate.myOrderNav.view.hidden =YES;
    [_homePageButton setImage:[UIImage imageNamed:@"bar_shouye_press_btn.png"] forState:UIControlStateNormal];
    [_myStatusButton setImage:[UIImage imageNamed:@"bar_fenlei_btn.png"] forState:UIControlStateNormal];
    [_myLocationButton setImage:[UIImage imageNamed:@"bar_wanyixia_btn.png"] forState:UIControlStateNormal];
    [_myOrderButton setImage:[UIImage imageNamed:@"bar_gouwuche_btn.png"] forState:UIControlStateNormal];
    [appDelegate.homePageNav popToRootViewControllerAnimated:NO];}

-(IBAction)myOrderAction
{
    appDelegate.homePageNav.view.hidden = YES;
    appDelegate.myStatusNav.view.hidden = YES;
    appDelegate.myLocationNav.view.hidden = YES;
    appDelegate.myOrderNav.view.hidden =NO;
    [_homePageButton setImage:[UIImage imageNamed:@"bar_shouye_press_btn.png"] forState:UIControlStateNormal];
    [_myStatusButton setImage:[UIImage imageNamed:@"bar_fenlei_btn.png"] forState:UIControlStateNormal];
    [_myLocationButton setImage:[UIImage imageNamed:@"bar_wanyixia_btn.png"] forState:UIControlStateNormal];
    [_myOrderButton setImage:[UIImage imageNamed:@"bar_gouwuche_btn.png"] forState:UIControlStateNormal];
    [appDelegate.homePageNav popToRootViewControllerAnimated:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (ViewController *)viewCtl
{
    return detail;
}
@end
