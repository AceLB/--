//
//  NearCarViewController.h
//  UserOfRentalCar
//
//  Created by song longbiao on 13-5-2.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NearCarViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UISearchDisplayDelegate,UISearchBarDelegate>
{
    NSMutableArray *_model;
    IBOutlet UIPickerView *_modelPicker;
    IBOutlet UIToolbar *toolbar;
    IBOutlet UISearchBar *_searchBar;
}

@end
