//
//  LoginViewController.m
//  DriverOfRentalCar
//
//  Created by song longbiao on 13-4-28.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import "LoginViewController.h"
#import "ActivityViewController.h"
#import "CommonClass.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender
{
    if ([CommonClass isMobileNumber:iphoneNum.text]) {
        [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
        [[NSUserDefaults standardUserDefaults] setValue: iphoneNum.text forKey:@"DriverUser"];
        ActivityViewController *activity = [[ActivityViewController alloc]init];
        [self.navigationController  pushViewController:activity animated:YES];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"手机号码格式不正确，请重新输入" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }

}
@end
