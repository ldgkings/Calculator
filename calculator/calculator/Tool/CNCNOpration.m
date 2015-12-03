//
//  CNCNOpration.m
//  calculator
//
//  Created by 卢大刚 on 15/12/3.
//  Copyright © 2015年 cncn. All rights reserved.
//

#import "CNCNOpration.h"

@implementation CNCNOpration
//初始化两个数字
-(id)initWithNum1:(double)num1 Num2:(double)num2
{
    if ([super init]) {
        self.number1 = num1;
        self.number2 = num2;
    }
    return self;
}
//父类的运算
-(NSString*)getResult
{
    double result = 0;
    NSString *str = [NSString stringWithFormat:@"%lf",result];
    return str;
}

@end

@implementation OprationAdd
-(NSString*)getResult
{
    double result=0;
    result = self.number1 + self.number2;
    NSString *str = [NSString stringWithFormat:@"%lf",result];
    return str;
}
@end

@implementation OprationSub
-(NSString*)getResult
{
    double result=0;
    result= self.number1 - self.number2;
    NSString *str = [NSString stringWithFormat:@"%lf",result];
    return str;
}
@end

@implementation OprationMul
-(NSString*)getResult
{
    double result = 0;
    result = self.number1 * self.number2;
    NSString *str = [NSString stringWithFormat:@"%lf",result];
    return str;
}
@end

@implementation OprationDiv
-(NSString*)getResult
{
    double result = 0;
    NSString *str;
    if (self.number2 == 0) {
        str = [NSString stringWithFormat:@"错误"];
    }else{
        result = self.number1/self.number2;
        str = [NSString stringWithFormat:@"%lf",result];
    }
    return str;
    
}
@end






