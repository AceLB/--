//
//  GoodInfo.h
//  dajieguoji
//
//  Created by lzh on 13-2-26.
//  Copyright (c) 2013年 eastedge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodInfo : NSObject
//订单ID
@property(nonatomic,copy)NSString *tradeNO;
//商品名称
@property(nonatomic,copy)NSString *productName;
//商品详情
@property(nonatomic,copy)NSString *productDescription;
//商品价格
@property(nonatomic,assign)float amount;

@end
