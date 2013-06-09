//
//  AboutUsViewController.m
//  UserOfRentalCar
//
//  Created by song longbiao on 13-5-30.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import "AboutUsViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

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
    //构建视图
    [_infoView.layer setCornerRadius:5.0f];
    [_infoView.layer setBorderWidth:1.0f];
    [_infoView setFrame:CGRectMake(10, 20, 300, 500)];
    [_myScrollView setContentSize:CGSizeMake(320, 530)];
    [_myScrollView addSubview:_infoView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//返回上一层
- (IBAction)GoBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
//拨打电话
- (IBAction)CallUs:(id)sender{
    NSURL *phoneURL = [NSURL URLWithString:@"tel:400-660-7168"];
    UIWebView *phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero] ;
    [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
    [self.view addSubview:phoneCallWebView];
}
@end
