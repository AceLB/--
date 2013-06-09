//
//  MyOrderViewController.m
//  DriverOfRentalCar
//
//  Created by song longbiao on 13-4-28.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import "MyOrderViewController.h"

@interface MyOrderViewController ()

@end

@implementation MyOrderViewController

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
    [_bgImage.layer setCornerRadius:10.0f];
    [_bgImage.layer setBorderWidth:1.0f];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//交活
- (IBAction)Submit:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LayOff" object:nil];

    NSLog(@"交活");
}
//返回订单列表
- (IBAction)AllOrder:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
