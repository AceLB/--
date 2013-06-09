//
//  AllOrderViewController.m
//  DriverOfRentalCar
//
//  Created by song longbiao on 13-4-28.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import "AllOrderViewController.h"
#import "OrderCell.h"
#import "AlixPayFor.h"
#import "GoodInfo.h"
#import "EvaluateViewController.h"
#import <QuartzCore/QuartzCore.h>

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
 
    return 300.0;
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
    if (cell == nil) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"OrderCell" owner:self options:nil];
        cell = [array objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.bgimage.layer setCornerRadius:5.0f];
        [cell.bgimage.layer setBorderWidth:1.0f];
        cell.evaluateBtn.tag = 100+indexPath.row;
        cell.payForBtn.tag = 10+indexPath.row;
    }
    
    return cell;
    
}
//选中cell的处理
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}
- (IBAction)PayFor:(id)sender
{
    NSLog(@"支付");
    NSLog(@"Botton.tag = %d",((UIButton *)sender).tag);
//    GoodInfo *goods = [[GoodInfo alloc]init];
//    goods.tradeNO = @"10001";
//    goods.productName = @"路费";
//    goods.productDescription = @"从北京到上海";
//    goods.amount = 0.01;
//    AlixPayFor *alix = [[AlixPayFor alloc]init];
//    [alix goodAalixPay:goods];
}
- (IBAction)Evaluate:(id)sender
{
    NSLog(@"评价");
    NSLog(@"Botton.tag = %d",((UIButton *)sender).tag);
    EvaluateViewController *evaluate = [[EvaluateViewController alloc]init];
    [self.navigationController pushViewController:evaluate animated:YES];

}
@end
