//
//  ViewController.h
//  YAAC
//
//  Created by Bsetecip10 on 05/12/14.
//  Copyright (c) 2014 gyana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    BOOL isclick;
    BOOL istap;
}
@property (weak, nonatomic) IBOutlet UILabel *lat;
@property (weak, nonatomic) IBOutlet UILabel *longnitude;
@property (weak, nonatomic) IBOutlet UILabel *detail;
@property (weak, nonatomic) IBOutlet UIButton *maptype;

@property (weak, nonatomic) IBOutlet UILabel *lbldecleration;
@property (weak, nonatomic) IBOutlet UIView *menueView;
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *gestureRecognizer;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@property (retain, nonatomic) IBOutlet UIImageView *animationImg;

- (IBAction)btnClicked:(UIButton *)sender;

//****************BUTTON ACTION (METHOD) DECLARATION*********************
- (IBAction)mint:(UIButton *)sender;
- (IBAction)went:(UIButton *)sender;
- (IBAction)gone:(UIButton *)sender;
- (IBAction)complete:(UIButton *)sender;

- (IBAction)settingTaped:(UIButton *)sender;
- (IBAction)storeTaped:(UIButton *)sender;
- (IBAction)logOutTaped:(UIButton *)sender;
- (IBAction)helpTaped:(UIButton *)sender;

@end

