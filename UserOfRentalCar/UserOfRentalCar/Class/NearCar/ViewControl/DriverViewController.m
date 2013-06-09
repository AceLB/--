//
//  DriverViewController.m
//  UserOfRentalCar
//
//  Created by song longbiao on 13-5-2.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import "DriverViewController.h"
#import "RentCarViewController.h"
#import "SDImageView+SDWebCache.h"
#import <QuartzCore/QuartzCore.h>

@interface DriverViewController ()

@end

@implementation DriverViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _myScroll.contentSize = _myView.frame.size;
    [_myScroll addSubview:_myView];
    //设置圆角
    [_titleBgImg.layer  setCornerRadius:5.0f];
    [_titleBgImg.layer setBorderWidth:1.0f];
    [_titleImg.layer  setCornerRadius:5.0f];
    [_titleImg.layer setBorderWidth:1.0f];
//    [_titleImg setImageWithURL:[NSURL URLWithString:@"http://t10.baidu.com/it/u=729795828,46840287&fm=59"] refreshCache:NO placeholderImage:[UIImage imageNamed:@"defaultIcon.png"]];
    [_contentBgImg.layer  setCornerRadius:5.0f];
    [_contentBgImg.layer setBorderWidth:1.0f];
    [_evaluateBgImg.layer  setCornerRadius:5.0f];
    [_evaluateBgImg.layer setBorderWidth:1.0f];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//返回按钮
- (IBAction)GoBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
//立即租车
- (IBAction)RentCar:(id)sender
{
    RentCarViewController *rentCar = [[RentCarViewController alloc]init];
    [self.navigationController pushViewController:rentCar animated:YES];
}
@end
