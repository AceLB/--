//
//  PayForViewController.m
//  UserOfRentalCar
//
//  Created by song longbiao on 13-5-6.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import "PayForViewController.h"
#import "CommonClass.h"
#import "AlixPayFor.h"
#import "GoodInfo.h"
#import <QuartzCore/QuartzCore.h>

@interface PayForViewController ()

@end

@implementation PayForViewController

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
    [_clauseText.layer setCornerRadius:5.0f];
    [_clauseText.layer setBorderWidth:0.5f];
    _clauseFlag = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//点击背景关键盘
- (IBAction)BackGround:(id)sender
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    return YES;
}
#pragma mark btn 事件
//同意协议
- (IBAction)AgreeClause:(id)sender
{
    if (_clauseFlag) {
        [_clauseImg setImage:[UIImage imageNamed:@"radio-bg.png"]];
    }else{
        [_clauseImg setImage:[UIImage imageNamed:@"radio-bg-active.png"]];
    }
    _clauseFlag = !_clauseFlag;
}
//返回按钮
- (IBAction)GoBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
//支付
- (IBAction)PayFor:(id)sender
{
    if ([CommonClass isMobileNumber:_mobilNum.text]) {
        NSLog(@"是电话号码");
        GoodInfo *goods = [[GoodInfo alloc]init];
        goods.tradeNO = @"10001";
        goods.productName = @"路费";
        goods.productDescription = @"从北京到上海";
        goods.amount = 0.01;
        AlixPayFor *alix = [[AlixPayFor alloc]init];
        [alix goodAalixPay:goods];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"您输入的手机号码格式不正确!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
}
@end
