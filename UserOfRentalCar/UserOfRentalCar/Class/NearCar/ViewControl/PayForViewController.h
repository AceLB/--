//
//  PayForViewController.h
//  UserOfRentalCar
//
//  Created by song longbiao on 13-5-6.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayForViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UITextField *_mobilNum;
    IBOutlet UITextView *_clauseText;
    IBOutlet UIImageView *_clauseImg;
    BOOL _clauseFlag;
}
@property (nonatomic,retain) IBOutlet UILabel *longLab;
@property (nonatomic,retain) IBOutlet UILabel *timesLab;
@property (nonatomic,retain) IBOutlet UILabel *priceLab;

- (IBAction)BackGround:(id)sender;
- (IBAction)GoBack:(id)sender;
- (IBAction)PayFor:(id)sender;

@end
