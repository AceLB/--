//
//  PriceViewController.m
//  UserOfRentalCar
//
//  Created by song longbiao on 13-5-30.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import "PriceViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface PriceViewController ()

@end

@implementation PriceViewController

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
    //设置toolbar
    UIBarButtonItem *barBtnQuit = [[UIBarButtonItem alloc]initWithTitle:@"退出" style:UIBarButtonItemStyleBordered target:self action:@selector(toolbarcancel)];
    UIBarButtonItem *btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *barBtnConfirm = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleBordered target:self action:@selector(toolbarcertain)];
    NSArray *btnArr = [NSArray arrayWithObjects:barBtnQuit,btnSpace,barBtnConfirm, nil];
    toolbar.items = btnArr;
    
    //读取接口文件
    NSString *filenames = [[NSBundle mainBundle] pathForResource:@"PriceList" ofType:@"plist"];
    _priceList = [[NSMutableDictionary alloc] initWithContentsOfFile:filenames];
    _model = [_priceList objectForKey:@"class"];
    [self InitMyView:0];
    //构建视图
    [_bgimage.layer setCornerRadius:5.0f];
    [_bgimage.layer setBorderWidth:1.0f];
    [_infoView setFrame:CGRectMake(20, 20, 280, 460)];
    [_myScrollView setContentSize:CGSizeMake(320, 480)];
    [_myScrollView addSubview:_infoView];

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
    return [_model count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_model objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
}
#pragma mark toolbar Btn事件
- (void)toolbarcancel
{
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:1];
    toolbar.frame = CGRectMake(0, 504, 320, 44);
    _modelPicker.frame = CGRectMake(0, 548, 320, 216);
    [UIView commitAnimations];
}
- (void)toolbarcertain
{

    [self InitMyView:[_modelPicker selectedRowInComponent:0]];
    [self toolbarcancel];
    
}

- (void)InitMyView:(int)path
{
    [_selectKind setTitle:[NSString stringWithFormat:@"%@       ",[_model objectAtIndex:path]] forState:UIControlStateNormal] ;
    NSDictionary *dic =[[_priceList objectForKey:@"content"] objectAtIndex:path];
    kindLab.text = [dic objectForKey:@"kind"];
    hourLab.text = [dic objectForKey:@"hour"];
    dayLab.text = [dic objectForKey:@"day"];
    halfdayLab.text = [dic objectForKey:@"halfday"];
    airLab.text = [dic objectForKey:@"air"];
    abovehourLab.text = [dic objectForKey:@"abovehour"];
    abovekmLab.text = [dic objectForKey:@"abovekm"];
    
}

- (IBAction)PickerBtnClick:(id)sender
{
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:1];
    toolbar.frame = CGRectMake(0, 244, 320, 44);
    _modelPicker.frame  = CGRectMake(0, 288, 320, 216);
    [UIView commitAnimations];
}
//返回上一个界面
- (IBAction)GoBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
