//
//  MyLocationViewController.h
//  DriverOfRentalCar
//
//  Created by song longbiao on 13-4-28.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "DisMap.h"
@interface MyLocationViewController : UIViewController<CLLocationManagerDelegate,MKMapViewDelegate,UIActionSheetDelegate>{
    IBOutlet MKMapView *_mapView;
    NSArray *annArr;
}

@end
