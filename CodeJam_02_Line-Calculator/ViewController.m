//
//  ViewController.m
//  CodeJam_02_Line-Calculator
//
//  Created by anthony volkov on 4/19/18.
//  Copyright © 2018 anthony volkov. All rights reserved.
//

#import "ViewController.h"
#import "LineCalculator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//------------------------------------------------------------test data------------------------------------------------------------
    LineCalculator *calc = [LineCalculator defaultValue:@2];
    NSLog(@"%@",[[calc add:@2] multiply:@2]);   //6
    
    calc = [LineCalculator defaultValue:@10];
    NSLog(@"%@",[calc add:@83]);   //93
    
    calc = [LineCalculator defaultValue:@4];
    NSLog(@"%@",[[[[[[[[[calc pow:@1] pow:@1] pow:@1] multiply:@2] add:@80]subtarct:@11] multiply:@1] subtarct:@41] subtarct:@65]);   //-29
    
    calc = [LineCalculator defaultValue:@6];
    NSLog(@"%@",[[[[[[[calc add:@14] subtarct:@16] add:@36] multiply:@1] subtarct:@46] add:@57] pow:@1]);   //51
    
    calc = [LineCalculator defaultValue:@10];
    NSLog(@"%@",[[calc pow:@1] pow:@1]);   //10
    
    calc = [LineCalculator defaultValue:@7];
    NSLog(@"%@",[[[[[[[[calc subtarct:@94] subtarct:@97] multiply:@1] pow:@1] multiply:@1] pow:@1] subtarct:@65] pow:@1]);   //-249
    
    calc = [LineCalculator defaultValue:@7];
    NSLog(@"%@",[[[[[[calc subtarct:@43] subtarct:@43] multiply:@1] subtarct:@60] add:@8] subtarct:@28]);   //-159
    
//------------------------------------------------------------my test data------------------------------------------------------------
    
    calc = [LineCalculator defaultValue:@5];
    NSLog(@"%@",[[[[[calc add:@3] pow:@2] multiply:@6] devide:@3] subtarct:@7]);   //16
    
    calc = [LineCalculator defaultValue:@5];
    NSLog(@"%@",[[[[[calc add:@3] pow:@2] multiply:@6] devide:@3] subtarct:@70]);   //-47

    calc = [LineCalculator defaultValue:@5];
    NSLog(@"%@",[[[[[[[calc add:@3] pow:@2] pow:@3] multiply:@6] devide:@3] subtarct:@7] pow:@4]);   //-938
    
    calc = [LineCalculator defaultValue:@5];
    NSLog(@"%@",[[[[[[[[[[calc add:@3] pow:@2] pow:@3] multiply:@6] devide:@3] subtarct:@7] pow:@4] add:@76] multiply:@44]devide:@30]);   //-826.5333333333

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
