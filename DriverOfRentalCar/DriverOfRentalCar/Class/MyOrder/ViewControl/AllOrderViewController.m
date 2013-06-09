//
//  AllOrderViewController.m
//  DriverOfRentalCar
//
//  Created by song longbiao on 13-4-28.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import "AllOrderViewController.h"
#import "MyOrderViewController.h"
#import "OrderCell.h"

@interface AllOrderViewController ()

@end

@implementation AllOrderViewController

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
#pragma mark - UItableview delegate
//设置tableview 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    return 260.0;
}
//设置tableview 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 12;
}
//设置tableview 每行内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier= @"Cell";
    OrderCell *cell = (OrderCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"OrderCell" owner:self options:nil];
        cell = [array objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.bgImage.layer setCornerRadius:10.0];
    [cell.bgImage.layer setBorderWidth:1.0];
    return cell;
    
}
//选中cell的处理
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyOrderViewController *myOrder = [[MyOrderViewController alloc]init];
    [self.navigationController pushViewController:myOrder animated:YES];
}
@end
