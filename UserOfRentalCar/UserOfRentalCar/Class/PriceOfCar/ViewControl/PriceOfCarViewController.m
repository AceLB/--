//
//  PriceOfCarViewController.m
//  UserOfRentalCar
//
//  Created by song longbiao on 13-5-6.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import "PriceOfCarViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "PriceViewController.h"
#import "AboutUsViewController.h"
#import "ManageUserViewController.h"
@interface PriceOfCarViewController ()

@end

@implementation PriceOfCarViewController

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
    [bgImage.layer setCornerRadius:5.0f];
    [bgImage.layer setBorderWidth:1.0f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SelectBtn:(id)sender{
    switch (((UIButton *)sender).tag) {
        case 30:{
            PriceViewController *price = [[PriceViewController alloc]init];
            [self.navigationController pushViewController:price animated:YES];
        }
            break;
        case 31:{
            ManageUserViewController *manage = [[ManageUserViewController alloc]init];
            [self.navigationController pushViewController:manage animated:YES];
        }
            break;
        case 32:{
            AboutUsViewController *aboutUs = [[AboutUsViewController alloc]init];
            [self.navigationController pushViewController:aboutUs animated:YES];
        }
            break;
        case 33:{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"已为最新版本!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
            break;
        default:
            break;
    }
}
@end
