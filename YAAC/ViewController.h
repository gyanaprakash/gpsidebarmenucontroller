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
}
@property (weak, nonatomic) IBOutlet UILabel *lbldecleration;
@property (weak, nonatomic) IBOutlet UIView *menueView;
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *gestureRecognizer;
@property (weak, nonatomic) IBOutlet UIButton *btn;

- (IBAction)btnClicked:(UIButton *)sender;

@end

