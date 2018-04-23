//
//  LineCalculator.h
//  CodeJam_02_Line-Calculator
//
//  Created by anthony volkov on 4/19/18.
//  Copyright © 2018 anthony volkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LineCalculator : NSObject

typedef void(^BlockType)(LineCalculator *);

@property (nonatomic, strong) NSMutableArray *inMind;

+ (instancetype)defaultValue:(NSNumber *)defaultValue;


- (instancetype)pow:(NSNumber *)powNumder;
- (instancetype)multiply:(NSNumber *)multiplyNumber;
- (instancetype)devide:(NSNumber *)devideNumber;
- (instancetype)add:(NSNumber *)addNumber;
- (instancetype)subtarct:(NSNumber *)subtarctNumber;



@end
