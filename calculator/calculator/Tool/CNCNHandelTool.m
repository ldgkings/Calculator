//
//  CNCNHandelTool.m
//  calculator
//
//  Created by 卢大刚 on 15/12/3.
//  Copyright © 2015年 cncn. All rights reserved.
//

#import "CNCNHandelTool.h"
#import "CNCNOpration.h"
@implementation CNCNHandelTool

+ (id)creatOprationTool:(char)operate
{

    CNCNOpration *oper;
    //根据参数的不同创建对象，这里的参数是输入的运算符
    //
    switch (operate) {
        case '+':
            oper=[[OprationAdd alloc]init];
            break;
        case '-':
            oper=[[OprationSub alloc]init];
            break;
        case '*':
            oper=[[OprationMul alloc]init];
            break;
        case '/':
            oper=[[OprationDiv alloc]init];
            break;
        default:
            break;
    }
    return oper;

}


@end
