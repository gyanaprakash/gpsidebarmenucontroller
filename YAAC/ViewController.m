//
//  ViewController.m
//  YAAC
//
//  Created by Bsetecip10 on 05/12/14.
//  Copyright (c) 2014 gyana. All rights reserved.
//

#import "ViewController.h"
#import "BlockClass.h"
@interface ViewController ()<UIGestureRecognizerDelegate>
{
    //***************************BLOCK CREATING/DECLARING****************

    int (^add)(int, int, int);
}
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
    isclick = 0;
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
//***********************************************************************
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
