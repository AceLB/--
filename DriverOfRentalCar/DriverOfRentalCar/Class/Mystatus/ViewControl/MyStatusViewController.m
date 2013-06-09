//
//  MyStatusViewController.m
//  DriverOfRentalCar
//
//  Created by song longbiao on 13-4-28.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import "MyStatusViewController.h"

@interface MyStatusViewController ()

@end

@implementation MyStatusViewController

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
    //隐藏 主界面中下面按钮
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(LayOn) name:@"LayOn" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(LayOff) name:@"LayOff" object:nil];


    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UIAlertView delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
}
//营业中
- (void)LayOn
{
    [businessBtn setTitle:@"营业中" forState:UIControlStateNormal];
    [freeBtn setTitle:@"空闲" forState:UIControlStateNormal];

    NSLog(@"上岗");
}
//空闲中
- (void)LayOff
{
    [businessBtn setTitle:@"营业" forState:UIControlStateNormal];
    [freeBtn setTitle:@"空闲中" forState:UIControlStateNormal];
    NSLog(@"下岗");

}
@end
