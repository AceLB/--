//
//  UIButton+Down.h
//  ChiHao
//
//  Created by s on 12-3-19.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDWebDataManager.h"

@interface UIButton (UIButton_Down)<SDWebDataManagerDelegate>
- (void)setImageView:(NSString *)urlStr;

@end
