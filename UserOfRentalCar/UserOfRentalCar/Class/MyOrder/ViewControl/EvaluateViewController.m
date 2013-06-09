//
//  EvaluateViewController.m
//  UserOfRentalCar
//
//  Created by song longbiao on 13-5-31.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import "EvaluateViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface EvaluateViewController ()

@end

@implementation EvaluateViewController

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
    _myvalue = 0;
    [_contentView.layer setCornerRadius:5.0f];
    [_contentView.layer setBorderWidth:1.0f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark Btn 事件
//提交评论
- (IBAction)Commit:(id)sender{
    
    [self GoBack:nil];
}

//选则评价
- (IBAction)SelectValue:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    for (int i = 0; i < 3; i++) {
        UIImageView *img = (UIImageView *)[self.view viewWithTag:40+i];
        if (i + 30 == btn.tag ) {
            _myvalue = i;
            [img setImage:[UIImage imageNamed:@"radio-bg-active.png"]];
        }else{
            [img setImage:[UIImage imageNamed:@"radio-bg.png"]];
        }
    }
}
//返回上一个界面
- (IBAction)GoBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
//点击背景关闭键盘
- (IBAction)PressBackground:(id)sender
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    
}
@end
