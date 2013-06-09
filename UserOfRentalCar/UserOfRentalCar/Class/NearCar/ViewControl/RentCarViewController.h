//
//  RentCarViewController.h
//  UserOfRentalCar
//
//  Created by song longbiao on 13-5-2.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RentCarViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>
{
    IBOutlet UIPickerView *_urbanAreaPicker;//城区选择
    IBOutlet UIDatePicker *_datePicker;//城区选择
    IBOutlet UIToolbar *toolbar;
    NSMutableArray *_urbanArea;
    NSInteger _btnFlag;
    NSInteger _kindFlag;
    NSInteger _limitLong;
}

- (IBAction)PickerBtnClick:(id)sender;
- (IBAction)BackGround:(id)sender;
- (IBAction)GoBack:(id)sender;
- (IBAction)NextStep:(id)sender;

@end
