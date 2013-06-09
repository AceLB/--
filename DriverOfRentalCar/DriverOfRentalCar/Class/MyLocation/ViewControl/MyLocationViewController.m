//
//  MyLocationViewController.m
//  DriverOfRentalCar
//
//  Created by song longbiao on 13-4-28.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import "MyLocationViewController.h"

@interface MyLocationViewController ()

@end

@implementation MyLocationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //添加自己位置
    _mapView.showsUserLocation=YES;
    
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];//创建位置管理器
    locationManager.delegate=self;//设置代理
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;//指定需要的精度级别
    locationManager.distanceFilter=1000.0f;//设置距离筛选器
    [locationManager startUpdatingLocation];//启动位置管理器
    MKCoordinateSpan theSpan;
    //地图的范围 越小越精确
    theSpan.latitudeDelta=0.05;
    theSpan.longitudeDelta=0.05;
    MKCoordinateRegion theRegion;
    theRegion.center=[[locationManager location] coordinate];
    theRegion.span=theSpan;
    [_mapView setRegion:theRegion];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark Map delegate
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    //选中坐标
}
- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
  //上一个选中坐标
}
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    MKAnnotationView *pinView = nil;
    if(annotation != mapView.userLocation)
    {
        static NSString *defaultPinID = @"com.invasivecode.pin";
        pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
        if ( pinView == nil ) pinView = [[MKPinAnnotationView alloc]
                                          initWithAnnotation:annotation reuseIdentifier:defaultPinID] ;
        //        pinView.image = [UIImage imageNamed:@"pin.png"];
        pinView.canShowCallout = YES;
        
    }
    else {
        [mapView.userLocation setTitle:@"我的位置"];
        //        [mapView.userLocation setSubtitle:@"vsp"];
    }
    return pinView;
    
}
- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
//    annArr = [views retain];
    //    NSLog(@"____");
    //    for(NSInteger i = 0; i < [views count]; i++)
    //    {
    //        MKAnnotationView *annotationView = [views objectAtIndex:i];
    //        [mapView selectAnnotation:annotationView.annotation animated:YES];
    //    }
}


@end
