//
//  ViewController.m
//  UserOfRentalCar
//
//  Created by song longbiao on 13-5-2.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //取得自己
        _mapView = [[BMKMapView alloc]init];
        _mapView.showsUserLocation = YES;
        //隐藏 主界面中下面按钮
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MainBtnHidden) name:@"MainBtnHidden" object:nil];
        //显示 主界面中下面按钮
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MainBtnAppear) name:@"MainBtnAppear" object:nil];
        [self initViews];
    }
    return self;
}

- (void)initViews
{
    _nearCarView = [[NearCarViewController alloc] initWithNibName:@"NearCarViewController" bundle:nil];
    _priceOfCarView = [[PriceOfCarViewController  alloc] initWithNibName:@"PriceOfCarViewController" bundle:nil];
    _myLocationView = [[MyLocationViewController alloc] initWithNibName:@"MyLocationViewController" bundle:nil];
    _allOrderView= [[AllOrderViewController alloc] initWithNibName:@"AllOrderViewController" bundle:nil];
    
    appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.carModel = [[UINavigationController alloc] initWithRootViewController:_nearCarView ] ;
    
    appDelegate.carPrice = [[UINavigationController alloc] initWithRootViewController:_priceOfCarView];
    appDelegate.myLocationNav = [[UINavigationController alloc] initWithRootViewController:_myLocationView];
    appDelegate.myOrderNav = [[UINavigationController alloc] initWithRootViewController:_allOrderView] ;
    appDelegate.carModel.navigationBarHidden = YES;
    appDelegate.carPrice.navigationBarHidden = YES;
    appDelegate.myLocationNav.navigationBarHidden = YES;
    appDelegate.myOrderNav.navigationBarHidden = YES;
    appDelegate.carModel.view.frame = CGRectMake(0, 0, 320, [[UIScreen mainScreen] bounds].size.height-64);
    appDelegate.carPrice.view.frame = CGRectMake(0, 0, 320, [[UIScreen mainScreen] bounds].size.height-64);
    appDelegate.myLocationNav.view.frame = CGRectMake(0, 0, 320, [[UIScreen mainScreen] bounds].size.height-64);
    appDelegate.myOrderNav.view.frame = CGRectMake(0, 0, 320, [[UIScreen mainScreen] bounds].size.height-64);
    [self.view addSubview:appDelegate.carModel.view];
    [self.view addSubview:appDelegate.carPrice.view];
    [self.view addSubview:appDelegate.myLocationNav.view];
    [self.view addSubview:appDelegate.myOrderNav.view];
    [self.view bringSubviewToFront:_priceOfCarBtn];
    [self.view bringSubviewToFront:_nearCarBtn];
    [self.view bringSubviewToFront:_myLocationBtn];
    [self.view bringSubviewToFront:_myOrderBtn];
    [self myLocationAction];
}


-(void)MainBtnAppear
{
    
    [UIView beginAnimations:@"animations" context:nil];
    [UIView setAnimationDuration:1];
    _nearCarBtn.alpha = 1;
    _priceOfCarBtn.alpha = 1;
    _myLocationBtn.alpha = 1;
    _myOrderBtn.alpha = 1;
    [UIView  commitAnimations];
    
    
}
-(void)MainBtnHidden
{
    [UIView beginAnimations:@"animations" context:nil];
    [UIView setAnimationDuration:0.5];
    _nearCarBtn.alpha = 0;
    _priceOfCarBtn.alpha = 0;
    _myLocationBtn.alpha = 0;
    _myOrderBtn.alpha = 0;
    [UIView  commitAnimations];
    
    
}
-(IBAction)myLocationAction
{

    appDelegate.carModel.view.hidden = YES;
    appDelegate.carPrice.view.hidden = YES;
    appDelegate.myLocationNav.view.hidden = NO;
    appDelegate.myOrderNav.view.hidden =YES;
    [_myLocationBtn setImage:[UIImage imageNamed:@"button-bottom-link-1.png"] forState:UIControlStateNormal];
    [_nearCarBtn setImage:[UIImage imageNamed:@"button-bottom-2.png"] forState:UIControlStateNormal];
    [_priceOfCarBtn setImage:[UIImage imageNamed:@"button-bottom-3.png"] forState:UIControlStateNormal];
    [_myOrderBtn setImage:[UIImage imageNamed:@"button-bottom-4.png"] forState:UIControlStateNormal];
    [appDelegate.myLocationNav popToRootViewControllerAnimated:NO];
}

-(IBAction)nearCarAction
{
    appDelegate.carPrice.view.hidden = YES;
    appDelegate.carModel.view.hidden = NO;
    appDelegate.myLocationNav.view.hidden = YES;
    appDelegate.myOrderNav.view.hidden =YES;
    [_myLocationBtn setImage:[UIImage imageNamed:@"button-bottom-1.png"] forState:UIControlStateNormal];
    [_nearCarBtn setImage:[UIImage imageNamed:@"button-bottom-link-2.png"] forState:UIControlStateNormal];
    [_priceOfCarBtn setImage:[UIImage imageNamed:@"button-bottom-3.png"] forState:UIControlStateNormal];
    [_myOrderBtn setImage:[UIImage imageNamed:@"button-bottom-4.png"] forState:UIControlStateNormal];
    [appDelegate.carModel popToRootViewControllerAnimated:NO];
    
}
-(IBAction)priceOfCarAction
{
    appDelegate.carPrice.view.hidden = YES;
    appDelegate.carModel.view.hidden = YES;
    appDelegate.myLocationNav.view.hidden = YES;
    appDelegate.myOrderNav.view.hidden =NO;
    [_myLocationBtn setImage:[UIImage imageNamed:@"button-bottom-1.png"] forState:UIControlStateNormal];
    [_nearCarBtn setImage:[UIImage imageNamed:@"button-bottom-2.png"] forState:UIControlStateNormal];
    [_priceOfCarBtn setImage:[UIImage imageNamed:@"button-bottom-link-3.png"] forState:UIControlStateNormal];
    [_myOrderBtn setImage:[UIImage imageNamed:@"button-bottom-4.png"] forState:UIControlStateNormal];
    [appDelegate.myOrderNav popToRootViewControllerAnimated:NO];}

-(IBAction)myOrderAction
{
    appDelegate.carPrice.view.hidden = NO;
    appDelegate.carModel.view.hidden = YES;
    appDelegate.myLocationNav.view.hidden = YES;
    appDelegate.myOrderNav.view.hidden =YES;
    [_myLocationBtn setImage:[UIImage imageNamed:@"button-bottom-1.png"] forState:UIControlStateNormal];
    [_nearCarBtn setImage:[UIImage imageNamed:@"button-bottom-2.png"] forState:UIControlStateNormal];
    [_priceOfCarBtn setImage:[UIImage imageNamed:@"button-bottom-3.png"] forState:UIControlStateNormal];
    [_myOrderBtn setImage:[UIImage imageNamed:@"button-bottom-link-4.png"] forState:UIControlStateNormal];
    [appDelegate.carPrice popToRootViewControllerAnimated:NO];
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
@end
