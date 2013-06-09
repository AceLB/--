//
//  ActivityViewController.m
//  DriverOfRentalCar
//
//  Created by song longbiao on 13-4-28.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import "ActivityViewController.h"

@interface ActivityViewController ()

@end

@implementation ActivityViewController

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
//下岗提示
- (IBAction)Activity:(id)sender{
    
    UIButton *button = (UIButton *)sender;
    
    if ([button.titleLabel.text isEqualToString:@"上岗"]) {
        [button setTitle:@"下岗" forState:UIControlStateNormal];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"\r\n \r\n \r\n \r\n      请确认交活后再下岗！"
                                                       delegate:self
                                              cancelButtonTitle:@"不下岗" otherButtonTitles:@"下岗",nil];
        UIImageView *viewe = [[UIImageView alloc] initWithFrame:CGRectMake(120.0, 50.0, 45.0, 45.0)];
        viewe.image = [UIImage imageNamed:@"pin.png"];
        [alert addSubview:viewe];
        [alert show];
//        [button setTitle:@"上岗" forState:UIControlStateNormal];

    }

}
#pragma mark Alert delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1) {
        [_activityBtn setTitle:@"上岗" forState:UIControlStateNormal];
    }
}


@end
