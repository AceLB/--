//
//  DisMap.h
//  dajieguoji
//
//  Created by song longbiao on 13-1-31.
//  Copyright (c) 2013年 eastedge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMapKit.h"

@interface DisMap : NSObject
<BMKAnnotation>{
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;
    
}
@property (nonatomic,assign) int tag;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *classify;

@end
