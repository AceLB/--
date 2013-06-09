//
//  PriceViewController.h
//  UserOfRentalCar
//
//  Created by song longbiao on 13-5-30.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PriceViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
{
    IBOutlet UIPickerView *_modelPicker;
    IBOutlet UIToolbar *toolbar;
    IBOutlet UIButton *_selectKind;
    IBOutlet UIView *_infoView;
    IBOutlet UIImageView *_bgimage;
    IBOutlet UIScrollView *_myScrollView;
    IBOutlet UILabel *kindLab;
    IBOutlet UILabel *hourLab;
    IBOutlet UILabel *halfdayLab;
    IBOutlet UILabel *dayLab;
    IBOutlet UILabel *airLab;
    IBOutlet UILabel *abovehourLab;
    IBOutlet UILabel *abovekmLab;

    NSArray *_model;
    NSMutableDictionary  *_priceList;
}

@end
