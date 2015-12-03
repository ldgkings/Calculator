//
//  CNCNOpration.h
//  calculator
//
//  Created by 卢大刚 on 15/12/3.
//  Copyright © 2015年 cncn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CNCNOpration : NSObject

@property (nonatomic,assign)double number1;
@property (nonatomic,assign)double number2;

-(id)initWithNum1:(double)num1 Num2:(double)num2;

-(NSString*)getResult;

@end


@interface OprationAdd : CNCNOpration
@end

@interface OprationSub : CNCNOpration
@end

@interface OprationMul : CNCNOpration
@end

@interface OprationDiv : CNCNOpration
@end