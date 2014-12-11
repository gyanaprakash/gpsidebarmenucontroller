//
//  ViewController.m
//  YAAC
//
//  Created by Bsetecip10 on 05/12/14.
//  Copyright (c) 2014 gyana. All rights reserved.
//

#import "ViewController.h"
#import "BlockClass.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ViewController ()<UIGestureRecognizerDelegate,CLLocationManagerDelegate,MKMapViewDelegate>
{
    //***************************BLOCK CREATING/DECLARING****************
   
        CLLocationManager *locationManager;
        CLGeocoder *geocoder;
        CLPlacemark *placemark;
        CLLocation *location;
     int (^add)(int, int, int);
}
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
//***********************************************************************
typedef int(^BlockOperation) (int, int);

BlockOperation operationCreater(int op)
{
    if (op == 0)
        return ^(int a, int b){return a+b;};
    if(op == 1)
        return ^(int a, int b){return a*b;};
    if(op == 2)
        return ^(int a, int b){return a/b;};
    return 0;
};
//***********************************************************************

typedef int(^iiblock_t)(int);

void func1(int arr[], int size, iiblock_t formula)
{
    for ( int i = 0; i < size; i++ )
    {
        arr[i] = formula(arr[i]);
    }
}

//***********************************************************************

@implementation ViewController

- (void)viewDidLoad
{
    
    
    [_mapView setHidden:YES];
    locationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    location =[[CLLocation alloc]init];

    isclick = 0;
    istap =0;

    //***********************************************************************
    int a[] = {10, 20, 30, 40, 50, 60};
    func1(a, 6, ^int(int x) {
        NSLog(@"%d",x*2);

        return x*2;
    });
   
    //***********************************************************************
    BlockOperation sum = operationCreater(0);
    
    NSLog(@"%d",sum(45,58));
    
    [super viewDidLoad];
    //***************************BLOCK CALLING****************
    add=^(int a, int b, int c){
        int result=0;
        result = a + b + c;
        return result;
    };
    NSLog(@"%d",add(2,2,2));

    //*****************2222***********************************
    add=^(int x, int y, int z){
        int result=0;
        result=x*y*z;
        return result;
    };
    NSLog(@"%d",add(2,2,2));
    
    //**************33333********************************
    add=^(int x, int y, int z){
        int result=0;
        result=x*y;
        return result;
    };
    NSLog(@"%d",add(2,2,7));
    
    //******************44444*******************************
    add=^(int x, int y, int z){
        int result=0;
        result=x;
        return result;
    };
    NSLog(@"%d",add(3,2,2));

    //**********BLOCK CALLING***********************************
    NSLog(@"%d",add1(10,2,5));
    
    //***********WE CAN ASSIGN A BLOCK TO AN INTEGER**************
    int sub=^(int p, int q){
        int result=0;
        result = p-q;
        return result;
        
    }(18,4);
    NSLog(@"%d",sub);
    
    //*****************************************
    void (^hw)(void) = ^{NSLog(@"hello, world!"); };
    hw();
    
    //***********************************************
    
    func(hw);
    
    //***************************************
    function(^{
        NSLog(@"success");
    });
}

//***********************************************************************

    int (^add1)(int, int, int)=^(int x, int y, int z){
        int result=0;
        result=x/y;
        return result;
    };
    void func(void (^a) (void)) // we do need to use an identifier in the parameter list now, of course
    {
        NSLog(@"going to invoke the passed in block now.");
        a();
    };
    void function(void(^b)(void))
    {
        b();
    }

//************************THIS IS FOR SIDE BAR MENU***********************************************

- (IBAction)btnClicked:(UIButton *)sender {
    if (isclick==0) {
        
        [UIView animateWithDuration:0.5
                              delay:0.1
                            options: UIViewAnimationOptionTransitionFlipFromLeft
                         animations:^
         {
             CGRect frame = self.view.frame;
             frame.origin.y = 0;
             frame.origin.x = (250);
             self.menueView.layer.shadowOpacity = 0.8;
             self.menueView.layer.shadowRadius = 25;
             self.menueView.layer.shadowOffset = CGSizeMake(5, 5);
             self.menueView.frame = frame;
             self.mainView.frame=self.view.frame;
             
         }
                         completion:^(BOOL finished)
         {
             isclick = 1;
             self.gestureRecognizer.enabled=YES;
             [self.gestureRecognizer addTarget:self action:@selector(gestureTap)];
             [self.menueView addGestureRecognizer:self.gestureRecognizer];
             NSLog(@"Completed");
         }];
    }
    else if (isclick == 1)
    {
        self.gestureRecognizer.enabled=NO;
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationOptionTransitionFlipFromRight
                     animations:^
     {
         CGRect frame = self.view.frame;
         frame.origin.y = 0;
         frame.origin.x = (-250);
         self.mainView.frame=frame;
         
         CGRect frame1 = self.view.frame;
         frame1.origin.y = 0;
         frame1.origin.x = 0;
        self.menueView.frame = frame1;
     }
                     completion:^(BOOL finished)
     {
         isclick = 0;

         NSLog(@"Completed");
         [self.menueView removeGestureRecognizer:self.gestureRecognizer];
         [self.menueView reloadInputViews];

     }];
    }
}

//*********************THESE ALL ARE SIDE BAR BUTTON ACTIONS****************************

- (IBAction)mint:(UIButton *)sender {
    UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(10, 40, 300, 40)];
    [lbl setText:@"GYANA PRAKASH GOUDA"];
    [self.menueView addSubview:lbl];

    if (istap == 0) {
    [lbl setTextColor:[UIColor redColor]];
    [lbl setFont:[UIFont fontWithName:@"ChalkboardSE-Bold" size:20]];
        istap=1;
         }
    else if (istap == 1) {
        istap=0;
        [lbl setFont:[UIFont fontWithName:@"ChalkboardSE-Bold" size:20]];
        [lbl setTextColor:[UIColor yellowColor]];
    }
}

- (IBAction)went:(UIButton *)sender{
    if (istap == 0) {
        UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(10, 100, 230, 40)];

        [lbl setText:@"+91-8895666168"];
        [lbl setFont:[UIFont fontWithName:@"ChalkboardSE-Bold" size:20]];
        [self.menueView addSubview:lbl];

        istap = 1;
    }
    else if (istap == 1){
        UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(10, 150, 230, 40)];

    [lbl setText:@"+91-8754866168"];
    [lbl setFont:[UIFont fontWithName:@"ChalkboardSE-Bold" size:20]];
        [self.menueView addSubview:lbl];

        istap = 0;
    }
}

- (IBAction)gone:(UIButton *)sender {
    NSLog(@"gone");
    UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(10, 200, 230, 40)];
    [lbl setText:@"IPHONE APP DEVELOPER"];
    [self.menueView addSubview:lbl];

}

- (IBAction)complete:(UIButton *)sender {
    NSLog(@"complete");
    UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(10, 270, 230, 40)];
    [lbl setText:@"COOL...."];
    [self.menueView addSubview:lbl];

}

- (IBAction)settingTaped:(UIButton *)sender {
    NSArray *imageNames = @[@"images.png"];
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++)
    {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    _animationImg.animationImages = images;
    _animationImg.animationDuration = 0.5;
    [_animationImg startAnimating];
    [self.view addSubview:_animationImg];

}

- (IBAction)storeTaped:(UIButton *)sender {
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    locationManager.distanceFilter = 200.0f;
    
    [locationManager requestWhenInUseAuthorization];
    [locationManager startMonitoringSignificantLocationChanges];
    [locationManager startUpdatingLocation];
    
    [_mapView setHidden:NO];
    [_mapView setRotateEnabled:YES];
    [_mapView setShowsBuildings:YES];
    [_mapView setMultipleTouchEnabled:YES];
    [_mapView setDelegate:self];

}

- (IBAction)logOutTaped:(UIButton *)sender {
    [self.menueView reloadInputViews];
}

- (IBAction)helpTaped:(id)sender {
    
}

//***************************THIS IS FOR GESTURE RECOGNISER METHOD ***************

-(void)gestureTap
{
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationOptionTransitionCrossDissolve
                     animations:^
     {
         CGRect frame = self.view.frame;
         frame.origin.y = 0;
         frame.origin.x = (-250);
         self.mainView.frame=frame;
         
         CGRect frame1 = self.view.frame;
         frame1.origin.y = 0;
         frame1.origin.x = 0;
         self.menueView.frame = frame1;
     }
                     completion:^(BOOL finished)
     {
         NSLog(@"Completed");
         [self.menueView removeGestureRecognizer:self.gestureRecognizer];
         [self.menueView reloadInputViews];
     }];
}


#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        _lat.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        _longnitude.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
    }
    
    // Stop Location Manager
    
    [locationManager stopUpdatingLocation];
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            _detail.text = [NSString stringWithFormat:@"%@ %@\n%@\n%@,\n%@,\n%@\n%@\n%@", placemark.locality, placemark.administrativeArea, placemark.country,placemark.postalCode,placemark.subLocality,placemark.subAdministrativeArea,placemark.accessibilityHint,placemark.country];
        } else {
            NSLog(@"complete");
        }
    } ];
}



- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = [_lat.text intValue];
    zoomLocation.longitude= [_longnitude.text intValue];
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 5, 5);
    [mapView setRegion:viewRegion animated:YES];
    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = userLocation.coordinate;
    point.title =[[UIDevice currentDevice]systemName];
    point.subtitle =placemark.locality.capitalizedString;
    
    [mapView addAnnotation:point];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
