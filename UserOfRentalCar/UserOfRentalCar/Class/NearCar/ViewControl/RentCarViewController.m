//
//  RentCarViewController.m
//  UserOfRentalCar
//
//  Created by song longbiao on 13-5-2.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import "RentCarViewController.h"
#import "PayForViewController.h"
#import "PriceViewController.h"

@interface RentCarViewController ()

@end

@implementation RentCarViewController

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
    //城区选择pickview

    _urbanArea = [[NSMutableArray alloc]initWithObjects:@"朝阳区",@"东城区",@"西城区", @"海淀区",@"丰台区",@"大兴区",@"通州区",@"昌平区", nil];
    UIBarButtonItem *barBtnQuit = [[UIBarButtonItem alloc]initWithTitle:@"退出" style:UIBarButtonItemStyleBordered target:self action:@selector(toolbarcancel)];
    UIBarButtonItem *btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *barBtnConfirm = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleBordered target:self action:@selector(toolbarcertain)];
    NSArray *btnArr = [NSArray arrayWithObjects:barBtnQuit,btnSpace,barBtnConfirm, nil];
    toolbar.items = btnArr;
    //初始化时间
    NSDate *today = [NSDate date];
    UILabel *startLab = (UILabel *)[self.view viewWithTag:31];
    UILabel *endLab = (UILabel *)[self.view viewWithTag:32];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *times =[dateFormatter stringFromDate:today];
    startLab.text = times;
    endLab.text = times;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark PickerView delegate
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_urbanArea count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_urbanArea objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
}
//pickerBtn点击事件
- (IBAction)PickerBtnClick:(id)sender
{
    _btnFlag = ((UIButton *)sender).tag;
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:1];
    toolbar.frame = CGRectMake(0, 244, 320, 44);

    switch (_btnFlag) {
        case 21:
        case 22:
            _datePicker.frame = CGRectMake(0, 288, 320, 216);
            break;
        case 23:
        case 24:
            _urbanAreaPicker.frame = CGRectMake(0, 288, 320, 216);
            break;
    }
    [UIView commitAnimations];
}
#pragma mark toolbar Btn事件
- (void)toolbarcancel
{
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:1];
    toolbar.frame = CGRectMake(0, 504, 320, 44);
    _datePicker.frame = CGRectMake(0, 548, 320, 216);
    _urbanAreaPicker.frame = CGRectMake(0, 548, 320, 216);
    [UIView commitAnimations];
}
- (void)toolbarcertain
{
    UILabel *lable = (UILabel *)[self.view viewWithTag:_btnFlag + 10];
    switch (_btnFlag) {
        case 21:
        case 22:{
                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
                NSString *times =[dateFormatter stringFromDate:_datePicker.date];
                lable.text = times;
        }
            break;
        case 23:
        case 24:
                lable.text = [_urbanArea objectAtIndex:[_urbanAreaPicker selectedRowInComponent:0]];
            break;
    }
//    UILabel *startLab = (UILabel *)[self.view viewWithTag:31];
//    UILabel *endLab = (UILabel *)[self.view viewWithTag:32];
//    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSDate *startTime =[dateFormatter dateFromString:startLab.text];
//    NSDate *endTime =[dateFormatter dateFromString:endLab.text];
//    if ([endTime compare:startTime]<=0) {
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"退房时间不能早于入住时间" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
//        [alert show];
//    }else{
        [self toolbarcancel];
//    }

}
//点击背景关键盘
- (IBAction)BackGround:(id)sender
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}
#pragma mark textfield delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = textField.frame;
    int offset = frame.origin.y + 32 - (self.view.frame.size.height - 216.0)+frame.size.height +88;//键盘高度216
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;
    if(offset > 0)
    {
        CGRect rect = CGRectMake(0.0f, -offset,width,height);
        self.view.frame = rect;
    }
    [UIView commitAnimations];
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
    self.view.frame = rect;
    [UIView commitAnimations];
    [textField resignFirstResponder];
}
#pragma mark Btn 事件
//选择类型
- (IBAction)SelectKind:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    _kindFlag = btn.tag - 100;
    for (int i = 0; i < 4; i++) {
        UIButton *oneBtn = (UIButton *)[self.view viewWithTag:100+i];
        if (_kindFlag ==i) {
            [oneBtn setBackgroundImage:[UIImage imageNamed:@"button-bg01.png"] forState:UIControlStateNormal];
        }else{
            [oneBtn setBackgroundImage:[UIImage imageNamed:@"button-bg01-w.png"] forState:UIControlStateNormal];
        }
    }
}
//返回按钮
- (IBAction)GoBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
//查看价格
- (IBAction)Price:(id)sender
{
    PriceViewController *price = [[PriceViewController alloc]init];
    [self.navigationController pushViewController:price animated:YES];
}
//下一步
- (IBAction)NextStep:(id)sender
{
    UILabel *startLab = (UILabel *)[self.view viewWithTag:31];
    UILabel *endLab = (UILabel *)[self.view viewWithTag:32];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *startTime =[dateFormatter dateFromString:startLab.text];
    NSDate *endTime =[dateFormatter dateFromString:endLab.text];
    double midTime = [endTime timeIntervalSinceDate:startTime];
    NSLog(@"%f",midTime);
    int limitTime = 0;
    switch (_kindFlag) {
        case 0:
            limitTime = 2;
            _limitLong = 20;
            break;
        case 1:
            limitTime = 4;
            _limitLong = 50;
            break;
        case 3:
            limitTime = 8;
            _limitLong = 100;
            break;
        default:
            break;
    }
    if (midTime/3600 > limitTime) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"您选择的时间超出了租车类型,请重新选择!如有疑问请点击价格表单,查看价格及备注!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        PayForViewController *payFor = [[PayForViewController alloc]init];
        [self.navigationController pushViewController:payFor animated:YES];
    }

}
@end
