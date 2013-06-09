//
//  NearCarViewController.m
//  UserOfRentalCar
//
//  Created by song longbiao on 13-5-2.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import "NearCarViewController.h"
#import "SDImageView+SDWebCache.h"
#import "DriverViewController.h"
#import "CarInfoCell.h"

@interface NearCarViewController ()

@end

@implementation NearCarViewController

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

    _model = [[NSMutableArray alloc]initWithObjects:@"低档型",@"中档型",@"高档型", nil];
    UIBarButtonItem *barBtnQuit = [[UIBarButtonItem alloc]initWithTitle:@"退出" style:UIBarButtonItemStyleBordered target:self action:@selector(toolbarcancel)];
    UIBarButtonItem *btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *barBtnConfirm = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleBordered target:self action:@selector(toolbarcertain)];
    NSArray *btnArr = [NSArray arrayWithObjects:barBtnQuit,btnSpace,barBtnConfirm, nil];
    toolbar.items = btnArr;
    [[_searchBar.subviews objectAtIndex:0]removeFromSuperview];
    _searchBar.showsCancelButton = NO;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UItableview delegate
//设置tableview 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}
//设置tableview 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
//设置tableview 每行内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier= @"Cell";
    
//   UITableViewCell * Cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
//                                  reuseIdentifier:cellIdentifier];
    CarInfoCell *cell = (CarInfoCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"CarInfoCell" owner:self options:nil];
        cell = [array objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        [cell.carImg setImageWithURL:[NSURL URLWithString:@"http://t10.baidu.com/it/u=729795828,46840287&fm=59"] refreshCache:NO placeholderImage:[UIImage imageNamed:@"defaultIcon.png"]];
        for (int i = 0; i < 5; i++) {
            UIImageView *xing = [[UIImageView alloc]initWithFrame:CGRectMake(120 + 20*i, 65, 15, 15)];
            if (i < 4) {
                [xing setImage:[UIImage imageNamed:@"icon_phone_03.png"] ];
            }else{
                [xing setImage:[UIImage imageNamed:@"icon_phone_03.png"] ];
            }
            [cell addSubview:xing];
        }
    }


    return cell;
    
}
//选中cell的处理
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Cell搜索");
    DriverViewController *driver = [[DriverViewController alloc]init];
    [self.navigationController pushViewController:driver animated:YES];
    
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
    return 3;
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
    [self toolbarcancel];

}
- (IBAction)PickerBtnClick:(id)sender
{
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:1];
    toolbar.frame = CGRectMake(0, 244, 320, 44);
    _modelPicker.frame  = CGRectMake(0, 288, 320, 216);
    [UIView commitAnimations];
}

#pragma mark SearchBar Delegate
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    searchBar.showsCancelButton = YES;
    for(id cc in [searchBar subviews])
    {
        if([cc isKindOfClass:[UIButton class]])
        {
            UIButton *btn = (UIButton *)cc;
            [btn setTitle:@"取消"  forState:UIControlStateNormal];
            [btn removeFromSuperview];
        }
    }
    searchBar.showsCancelButton = NO;

}
@end
