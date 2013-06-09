//
//  MyLocationViewController.m
//  DriverOfRentalCar
//
//  Created by song longbiao on 13-4-28.
//  Copyright (c) 2013年 songlb. All rights reserved.
//

#import "MyLocationViewController.h"
#import "MBProgressHUD.h"
#import "CallOutAnnotationVifew.h"
#import "JingDianMapCell.h"
#define span 40000

@interface MyLocationViewController ()
{
    NSMutableArray *_annotationList;
    
    CalloutMapAnnotation *_calloutAnnotation;
	CalloutMapAnnotation *_previousdAnnotation;
    
}
-(void)setAnnotionsWithList:(NSArray *)list;

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
    //
    kindAll = NO;
    //添加自己位置
    _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, [[UIScreen mainScreen] bounds].size.height - 44 - 20)];
    _mapView.showsUserLocation = YES;
    _mapView.delegate = self;
    _mapView.zoomLevel = 14;

    [mapsview addSubview:_mapView];

    AnnotationArr = [[NSMutableArray alloc]init];
    _annotationList = [[NSMutableArray alloc] init];

    NSDictionary *dic1=[NSDictionary dictionaryWithObjectsAndKeys:@"30.281843",@"latitude",@"120.102193",@"longitude",nil];
    
    NSDictionary *dic2=[NSDictionary dictionaryWithObjectsAndKeys:@"30.290144",@"latitude",@"120.146696‎",@"longitude",nil];
    
    NSDictionary *dic3=[NSDictionary dictionaryWithObjectsAndKeys:@"30.248076",@"latitude",@"120.164162‎",@"longitude",nil];
    
    NSDictionary *dic4=[NSDictionary dictionaryWithObjectsAndKeys:@"30.425622",@"latitude",@"120.299605",@"longitude",nil];
    
    NSArray *array = [NSArray arrayWithObjects:dic1,dic2,dic3,dic4, nil];
    
    [self resetAnnitations:array];


}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark Map delegate
- (void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view {
	if ([view.annotation isKindOfClass:[BasicMapAnnotation class]]) {
        if (_calloutAnnotation.coordinate.latitude == view.annotation.coordinate.latitude&&
            _calloutAnnotation.coordinate.longitude == view.annotation.coordinate.longitude) {
            return;
        }
        if (_calloutAnnotation) {
            [mapView removeAnnotation:_calloutAnnotation];
            _calloutAnnotation = nil;
        }
        _calloutAnnotation = [[CalloutMapAnnotation alloc]
                               initWithLatitude:view.annotation.coordinate.latitude
                               andLongitude:view.annotation.coordinate.longitude];
        [mapView addAnnotation:_calloutAnnotation];
        
        [mapView setCenterCoordinate:_calloutAnnotation.coordinate animated:YES];
	}
    else{
        NSLog(@"选择view做什么");
    }
}

- (void)mapView:(BMKMapView *)mapView didDeselectAnnotationView:(BMKAnnotationView *)view {
    if (_calloutAnnotation&& ![view isKindOfClass:[CallOutAnnotationVifew class]]) {
        if (_calloutAnnotation.coordinate.latitude == view.annotation.coordinate.latitude&&
            _calloutAnnotation.coordinate.longitude == view.annotation.coordinate.longitude) {
            [mapView removeAnnotation:_calloutAnnotation];
            _calloutAnnotation = nil;
        }
    }
}

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation {
	if ([annotation isKindOfClass:[CalloutMapAnnotation class]]) {
        
        CallOutAnnotationVifew *annotationView = (CallOutAnnotationVifew *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CalloutView"];
        if (!annotationView) {
            annotationView = [[CallOutAnnotationVifew alloc] initWithAnnotation:annotation reuseIdentifier:@"CalloutView"] ;
            JingDianMapCell  *cell = [[[NSBundle mainBundle] loadNibNamed:@"JingDianMapCell" owner:self options:nil] objectAtIndex:0];
            [annotationView.contentView addSubview:cell];
            //            annotationView.image = [UIImage imageNamed:@"otherLocation.png"];
            
            
        }
        return annotationView;
	} else if ([annotation isKindOfClass:[BasicMapAnnotation class]]) {
        
        BMKAnnotationView *annotationView =[_mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomAnnotation"];
        if (!annotationView) {
            annotationView = [[BMKAnnotationView alloc] initWithAnnotation:annotation
                                                           reuseIdentifier:@"CustomAnnotation"] ;
            annotationView.canShowCallout = NO;
            annotationView.image = [UIImage imageNamed:@"otherLocation.png"];
        }
		
		return annotationView;
    }
	return nil;
}
- (void)resetAnnitations:(NSArray *)data
{
    [_annotationList removeAllObjects];
    [_annotationList addObjectsFromArray:data];
    [self setAnnotionsWithList:_annotationList];
}
-(void)setAnnotionsWithList:(NSArray *)list
{
    for (NSDictionary *dic in list) {
        
        CLLocationDegrees latitude=[[dic objectForKey:@"latitude"] doubleValue];
        CLLocationDegrees longitude=[[dic objectForKey:@"longitude"] doubleValue];
        CLLocationCoordinate2D location=CLLocationCoordinate2DMake(latitude, longitude);
        
        BMKCoordinateRegion region=BMKCoordinateRegionMakeWithDistance(location,span ,span );
        BMKCoordinateRegion adjustedRegion = [_mapView regionThatFits:region];
        [_mapView setRegion:adjustedRegion animated:YES];
        
        BasicMapAnnotation *  annotation=[[BasicMapAnnotation alloc] initWithLatitude:latitude andLongitude:longitude];
        [_mapView   addAnnotation:annotation];
    }
}
#pragma mark - baiduMap delegate

//百度定位获取经纬度信息

-(void)mapView:(BMKMapView *)mapView didUpdateUserLocation:(BMKUserLocation *)userLocation{
    
    NSLog(@"!latitude!!!  %f",userLocation.location.coordinate.latitude);//获取经度
    
    NSLog(@"!longtitude!!!  %f",userLocation.location.coordinate.longitude);//获取纬度
    if (!_localLongitude) {
        _localLatitude=userLocation.location.coordinate.latitude;//把获取的地理信息记录下来
        _localLongitude=userLocation.location.coordinate.longitude;
//        [_mapView setCenterCoordinate:((CLLocationCoordinate2D){_localLatitude, _localLongitude})  animated:YES];
    }
}

- (void)mapView:(BMKMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
	if (error != nil)
		NSLog(@"locate failed: %@", [error localizedDescription]);
	else {
		NSLog(@"locate failed");
	}
	
}

- (void)mapViewWillStartLocatingUser:(BMKMapView *)mapView
{
	NSLog(@"start locate");
}
//滑动结束后
//- (void)mapView:(BMKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
//{
//    NSLog(@"centerCoordinate :%f,%f",mapView.centerCoordinate.latitude,mapView.centerCoordinate.longitude);
//}

#pragma mark PickerView delegate
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 3;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_model objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
}
#pragma mark toolbar Btn事件
- (void)showDetails:(id)sender
{
    NSLog(@"选中了超市%d",((UIButton *)sender).tag );
}

- (IBAction)PickerBtnClick:(id)sender
{
//    NSURL *phoneURL = [NSURL URLWithString:@"tel:400-100-1111"];
//    UIWebView *phoneCallWebView = [[[UIWebView alloc] initWithFrame:CGRectZero] autorelease];
//    [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
//    [self.view addSubview:phoneCallWebView];
    [UIView beginAnimations:@"admin" context:nil];
    [UIView setAnimationDuration:1];

    for (int i = 0; i < 7; i++) {
        UIButton *btn = (UIButton *)[self.view viewWithTag:31+i];
        if (kindAll) {
            btn.frame = CGRectMake(271, -2, 46, 46);
        }else{
            btn.frame = CGRectMake(271, 50 + 46*i, 46, 46);
        }
    }
    kindAll = !kindAll;
    [UIView commitAnimations];

}
//车型筛选
- (IBAction)SelectCarClass:(id)sender
{
    UIButton *btn = (UIButton *)sender;

    for (int i = 0; i <[AnnotationArr count]; i++) {
        BMKAnnotationView *ann= (BMKAnnotationView *)[AnnotationArr objectAtIndex:i];
        ann.hidden = YES;
        if (ann.tag/100000 ==btn.tag-30) {
            ann.hidden = NO;
        }
    }
    
}
//- (IBAction)findMe:(id)sender {
//    locationManager = [[[CLLocationManager alloc] init] autorelease];
//    locationManager.delegate = self;
//    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
//    locationManager.distanceFilter = 1000.0f;
//    [locationManager startUpdatingLocation];
//    NSLog(@"start gps");
//}
//搜索位置
- (IBAction)SearchPlace:(id)sender
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    if (seachText.text.length>0) {
       BMKSearch *mapSearch = [[[BMKSearch alloc]init] autorelease];
        mapSearch.delegate = self;
        [mapSearch geocode:seachText.text withCity:@"北京"];
        //加载菊花
        NSLog(@"%@",self.view);
        MBProgressHUD *hub=[MBProgressHUD showHUDAddedTo:self.view.window animated:NO];
        hub.minShowTime=1;
        hub.labelText=@"正在搜索，请稍后...";
        [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    }
}

#pragma mark Map Search delegate
- (void)onGetAddrResult:(BMKAddrInfo *)result errorCode:(int)error
{
    [MBProgressHUD hideHUDForView:self.view.window animated:NO];
    [[UIApplication sharedApplication] endIgnoringInteractionEvents];

    if (error == 0) {
        [_mapView setCenterCoordinate:result.geoPt  animated:YES];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"没有找到该位置!" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
    }
}

#pragma mark -关闭键盘
//点击背景关闭键盘
- (IBAction)Background:(id)sender
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}
//按Return关闭键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    return NO;
}
@end
