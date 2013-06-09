//
//  AlixPay.h
//  dajieguoji
//
//  Created by lzh on 13-2-26.
//  Copyright (c) 2013年 eastedge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GoodInfo.h"

@interface AlixPayFor : NSObject
@property(nonatomic,retain) GoodInfo *goodinfo;

-(void)goodAalixPay:(GoodInfo *)goods;

@end
