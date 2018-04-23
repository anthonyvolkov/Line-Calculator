//
//  LineCalculator.m
//  CodeJam_02_Line-Calculator
//
//  Created by anthony volkov on 4/19/18.
//  Copyright © 2018 anthony volkov. All rights reserved.
//

#import "LineCalculator.h"

@interface LineCalculator ()

- (void)exponentiation;
- (void)multiplication;
- (void)division;
- (void)substraction;
- (void)addition;

@end

@implementation LineCalculator


+ (instancetype)defaultValue:(NSNumber *) defaultValue {
    LineCalculator *calc = [[LineCalculator new] autorelease];
    calc.inMind = [[@[] mutableCopy] autorelease];
    [calc.inMind addObject:[NSString stringWithFormat:@"%@", defaultValue]];
    return calc;
}


#pragma mark - math operations
- (instancetype)pow:(NSNumber *)powNumder {
    [self.inMind addObject:@"^"];
    [self.inMind addObject:[NSString stringWithFormat:@"%@", powNumder]];
    return self;
}

- (instancetype)multiply:(NSNumber *)multiplyNumber {
    [self.inMind addObject:@"*"];
    [self.inMind addObject:[NSString stringWithFormat:@"%@", multiplyNumber]];
    return self;
}

- (instancetype)devide:(NSNumber *)devideNumber {
    [self.inMind addObject:@"/"];
    [self.inMind addObject:[NSString stringWithFormat:@"%@", devideNumber]];
    return self;
}

- (instancetype)add:(NSNumber *)addNumber {
    [self.inMind addObject:@"+"];
    [self.inMind addObject:[NSString stringWithFormat:@"%@", addNumber]];
    return self;
}
    
- (instancetype)subtarct:(NSNumber *)subtarctNumber {
    [self.inMind addObject:@"-"];
    [self.inMind addObject:[NSString stringWithFormat:@"%@", subtarctNumber]];
    return self;
}



#pragma mark - description
- (NSString *)description {
//    NSLog(@"%@", self.inMind);   //comment this
    [self exponentiation];
    [self multiplication];
    [self division];
    [self substraction];
    [self addition];
    
    return [NSString stringWithFormat:@"result = %@", [self.inMind objectAtIndex:0]];
}


#pragma mark - calculations

- (void)exponentiation {
    
    //------------------------------------------------------------check how many actions------------------------------------------------------------
    int exponentiationTimes = 0;
    for (int q = 0; q < [self.inMind count]; q++) {
        if ([[self.inMind objectAtIndex:q] isEqualToString:@"^"]) {
            exponentiationTimes++;
        }
    }
    //    NSLog(@"exponentiation times - %d", exponentiation);   //comment this
    
    
    
    //------------------------------------------------------------exponentiation------------------------------------------------------------
    int count = [self.inMind count] - exponentiationTimes * 2;
    //    NSLog(@"%d", count);   //comment this
    
    while ([self.inMind count] > count) {
        for (int q = 1; q < [self.inMind count]; q++) {
            if ([[self.inMind objectAtIndex:q] isEqualToString:@"^"]) {
                
                double number = [[self.inMind objectAtIndex:q - 1] doubleValue];
                double numberInPow = number;
                
                //number in pow
                for (int w = 1; w < [[self.inMind objectAtIndex:q + 1] intValue]; w++) {
                    numberInPow = numberInPow * number;
                }
                
                [self.inMind removeObjectAtIndex:q + 1];
                [self.inMind removeObjectAtIndex:q];
                [self.inMind removeObjectAtIndex:q - 1];
                
                [self.inMind insertObject:[[NSNumber numberWithDouble:numberInPow] stringValue] atIndex:q - 1];
                
//                NSLog(@"%@", calc.inMind);   //comment this
                break;
            }
        }
    }
//    NSLog(@"%@", self.inMind);   //comment this
}

- (void)multiplication {
   
    //----------------------------------------check how many actions----------------------------------------
    int multiplicationTimes = 0;
    for (int q = 0; q < [self.inMind count]; q++) {
        if ([[self.inMind objectAtIndex:q] isEqualToString:@"*"]) {
            multiplicationTimes++;
        }
    }
    //    NSLog(@"multiplication times - %d", multiplicationTimes);   //comment this
    
    
    
    //------------------------------------------------------------multiplication------------------------------------------------------------
    int count = [self.inMind count] - multiplicationTimes * 2;
    //        NSLog(@"%d", count);   //comment this
    
    while ([self.inMind count] > count) {
        for (int q = 1; q < [self.inMind count]; q++) {
            if ([[self.inMind objectAtIndex:q] isEqualToString:@"*"]) {
                
                double multResult = [[self.inMind objectAtIndex:q - 1] doubleValue] * [[self.inMind objectAtIndex:q + 1] doubleValue];
                
                [self.inMind removeObjectAtIndex:q + 1];
                [self.inMind removeObjectAtIndex:q];
                [self.inMind removeObjectAtIndex:q - 1];
                
                [self.inMind insertObject:[[NSNumber numberWithDouble:multResult] stringValue] atIndex:q - 1];
                
//                NSLog(@"%@", self.inMind);   //comment this
                break;
            }
        }
    }
//    NSLog(@"%@", self.inMind);   //comment this
}

- (void)division {
    
    //------------------------------------------------------------check how many actions------------------------------------------------------------
    int divisionTimes = 0;
    for (int q = 0; q < [self.inMind count]; q++) {
        if ([[self.inMind objectAtIndex:q] isEqualToString:@"/"]) {
            divisionTimes++;
        }
    }
    //    NSLog(@"division times - %d", divisionTimes);   //comment this
    
    
    
    //------------------------------------------------------------division------------------------------------------------------------
    int count = [self.inMind count] - divisionTimes * 2;
    //    NSLog(@"%d", count);   //comment this
    
    while ([self.inMind count] > count) {
        for (int q = 1; q < [self.inMind count]; q++) {
            if ([[self.inMind objectAtIndex:q] isEqualToString:@"/"]) {
                
                double multResult = [[self.inMind objectAtIndex:q - 1] doubleValue] / [[self.inMind objectAtIndex:q + 1] doubleValue];
                
                [self.inMind removeObjectAtIndex:q + 1];
                [self.inMind removeObjectAtIndex:q];
                [self.inMind removeObjectAtIndex:q - 1];
                
                [self.inMind insertObject:[[NSNumber numberWithDouble:multResult] stringValue] atIndex:q - 1];
                
//                NSLog(@"%@", self.inMind);   //comment this
                break;
            }
        }
    }
//    NSLog(@"%@", self.inMind);   //comment this
}

- (void)substraction {
    
    //------------------------------------------------------------check how many actions------------------------------------------------------------
    int substractionTimes = 0;
    for (int q = 0; q < [self.inMind count]; q++) {
        if ([[self.inMind objectAtIndex:q] isEqualToString:@"-"]) {
            substractionTimes++;
        }
    }
    //    NSLog(@"substraction times - %d", substractionTimes);   //comment this
    
    
    
    //------------------------------------------------------------substraction------------------------------------------------------------
    int count = [self.inMind count] - substractionTimes * 2;
    //    NSLog(@"%d", count);   //comment this
    
    while ([self.inMind count] > count) {
        for (int q = 1; q < [self.inMind count]; q++) {
            if ([[self.inMind objectAtIndex:q] isEqualToString:@"-"]) {
                
                double multResult = [[self.inMind objectAtIndex:q - 1] doubleValue] - [[self.inMind objectAtIndex:q + 1] doubleValue];
                
                [self.inMind removeObjectAtIndex:q + 1];
                [self.inMind removeObjectAtIndex:q];
                [self.inMind removeObjectAtIndex:q - 1];
                
                [self.inMind insertObject:[[NSNumber numberWithDouble:multResult] stringValue] atIndex:q - 1];
                
                //                NSLog(@"%@", self.inMind);   //comment this
                break;
            }
        }
    }
    //    NSLog(@"%@", self.inMind);   //comment this
}

- (void)addition {
    
    //------------------------------------------------------------check how many actions------------------------------------------------------------
    int additionTimes = 0;
    for (int q = 0; q < [self.inMind count]; q++) {
        if ([[self.inMind objectAtIndex:q] isEqualToString:@"+"]) {
            additionTimes++;
        }
    }
    //    NSLog(@"addition times - %d", additionTimes);   //comment this
    
    
    
    //------------------------------------------------------------addition------------------------------------------------------------
    int count = [self.inMind count] - additionTimes * 2;
    //    NSLog(@"%d", count);   //comment this
    
    while ([self.inMind count] > count) {
        for (int q = 1; q < [self.inMind count]; q++) {
            if ([[self.inMind objectAtIndex:q] isEqualToString:@"+"]) {
                
                double multResult = [[self.inMind objectAtIndex:q - 1] doubleValue] + [[self.inMind objectAtIndex:q + 1] doubleValue];
                
                [self.inMind removeObjectAtIndex:q + 1];
                [self.inMind removeObjectAtIndex:q];
                [self.inMind removeObjectAtIndex:q - 1];
                
                [self.inMind insertObject:[[NSNumber numberWithDouble:multResult] stringValue] atIndex:q - 1];
                
//                NSLog(@"%@", self.inMind);   //comment this
                break;
            }
        }
    }
//    NSLog(@"%@", self.inMind);   //comment this
}



@end
