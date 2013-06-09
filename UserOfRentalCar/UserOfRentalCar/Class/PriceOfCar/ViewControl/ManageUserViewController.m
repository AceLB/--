//
//  ManageUserViewController.m
//  UserOfRentalCar
//
//  Created by song longbiao on 13-5-30.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import "ManageUserViewController.h"
#import "CommonClass.h"
@interface ManageUserViewController ()

@end

@implementation ManageUserViewController

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
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"UserId"]) {
        _myPhoneNo.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserId"];
        [binding setTitle:@"解    除" forState:UIControlStateNormal];
        _inputPhoneNo.hidden = YES;
    }else{
        [binding setTitle:@"绑    定" forState:UIControlStateNormal];
        _inputPhoneNo.hidden = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark Btn 事件
//返回上一层
- (IBAction)GoBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
//绑定&解绑
- (IBAction)Bind:(id)sender
{
    if ([binding.titleLabel.text isEqualToString:@"绑    定"]) {
        [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
        if( [CommonClass isMobileNumber:_inputPhoneNo.text ]){
            [[NSUserDefaults standardUserDefaults] setObject:_inputPhoneNo.text forKey:@"UserId"];
            _myPhoneNo.text = _inputPhoneNo.text;
            [binding setTitle:@"解    除" forState:UIControlStateNormal];
            _inputPhoneNo.hidden = YES;
        }else{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"手机号码不合法,请重新输入" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
    }else{
        _inputPhoneNo.hidden = NO;
        [binding setTitle:@"绑    定" forState:UIControlStateNormal];
    }
}
#pragma mark textfield delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    return NO;
}
- (IBAction)PressBackground:(id)sender
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];

}

@end
