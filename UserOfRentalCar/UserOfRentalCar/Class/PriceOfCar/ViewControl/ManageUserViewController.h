//
//  ManageUserViewController.h
//  UserOfRentalCar
//
//  Created by song longbiao on 13-5-30.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManageUserViewController : UIViewController<UITextFieldDelegate>{
    IBOutlet UITextField *_inputPhoneNo;
    IBOutlet UILabel *_myPhoneNo;
    IBOutlet UIButton *binding;
}

@end
