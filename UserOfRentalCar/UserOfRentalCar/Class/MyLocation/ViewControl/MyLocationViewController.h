//
//  MyLocationViewController.h
//  DriverOfRentalCar
//
//  Created by song longbiao on 13-4-28.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"
#import "DisMap.h"

#import "CalloutMapAnnotation.h"
#import "BasicMapAnnotation.h"

@interface MyLocationViewController : UIViewController<BMKMapViewDelegate, BMKSearchDelegate,UIActionSheetDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate,CLLocationManagerDelegate> {
    CLLocationManager* locationManager;
    IBOutlet UIView *mapsview;
     BMKMapView *_mapView;
    NSArray *annArr;
    NSMutableArray *_model;
    IBOutlet UIPickerView *_modelPicker;
    IBOutlet UIToolbar *toolbar;
    IBOutlet UITextField *seachText;
    NSMutableArray *AnnotationArr;
    BOOL kindAll;
    
}
@property (nonatomic,retain) NSMutableArray *carArr;
@property (nonatomic,assign) float localLatitude;
@property (nonatomic,assign) float localLongitude;

- (IBAction)PickerBtnClick:(id)sender;

- (void)resetAnnitations:(NSArray *)data;
@end


