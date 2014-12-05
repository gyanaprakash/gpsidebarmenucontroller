//
//  ViewController.m
//  YAAC
//
//  Created by Bsetecip10 on 05/12/14.
//  Copyright (c) 2014 gyana. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
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

//typedef int(^iiblock_t)(int);
//
//void func1(int arr[], int size, iiblock_t formula)
//{
//    for ( int i = 0; i < size; i++ )
//    {
//        arr[i] = formula(arr[i]);
//    }
//}

//***********************************************************************

@implementation ViewController

- (void)viewDidLoad
{
    //***********************************************************************

    //    int a[] = {10, 20, 30, 40, 50, 60};
//    func1(a, 6, ^int(int x) {
//        NSLog(@"%d",x*2);
//
//        return x*2;
//    });
   
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
//***********************************************************************

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
