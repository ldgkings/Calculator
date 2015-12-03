//
//  ViewController.m
//  calculator
//
//  Created by 卢大刚 on 15/12/2.
//  Copyright © 2015年 cncn. All rights reserved.
//


#define KShowViewH  [UIScreen mainScreen].bounds.size.height * 0.2
#define KSingleUIButtonW  [UIScreen mainScreen].bounds.size.width   / 4
#define KsingleUIButtonH  ([UIScreen mainScreen].bounds.size.height - KShowViewH - 20) / 7
#define KCalculatorData  @"CalculatorData"

#import "ViewController.h"
#import "UIView+Extension.h"
#import "CNCNnumberView.h"
#import "CNCNHandelView.h"
#import "CNCNResultVIew.h"
#import "CNCNFunctionView.h"
#import "CNCNDataView.h"
#import "CNCNLastView.h"
#import "CNCNOpration.h"
#import "CNCNHandelTool.h"

@interface ViewController ()<CNCNnumberViewDelegate,CNCNHandelViewDelegate,CNCNResultVIewDelegate,CNCNLastViewDelegate,CNCNDataViewDelegate,CNCNFunctionViewDelegate>
/**	上面显示的label */
@property (weak ,nonatomic) UILabel *showView;
@property (weak ,nonatomic) CNCNnumberView *numberView;
@property (weak ,nonatomic) CNCNHandelView *handelView;
@property (weak ,nonatomic) CNCNResultVIew *resultVIew;
@property (weak ,nonatomic) CNCNFunctionView *functionView;
@property (weak ,nonatomic) CNCNDataView *dataView;
@property (weak ,nonatomic) CNCNLastView *lastView;
@property (strong, nonatomic) CNCNOpration *opration;

@property (strong,nonatomic) NSMutableString * result;
@property (assign,nonatomic) double num1;
@property (assign,nonatomic) double num2;
/** 保存结果 */
@property (assign,nonatomic) double num;
@end

@implementation ViewController
///--------------------------------------
#pragma mark - 懒加载
///--------------------------------------
- (NSMutableString *)result
{
    if (_result == nil) {
        self.result = [[NSMutableString alloc] init];
    }
    return _result;
}

///--------------------------------------
#pragma mark - life cycle
///--------------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self setUpShowView];
    [self setUpNumberView];
    [self setUpHandelView];
    [self setUpResultView];
    [self setUpFunctionView];
    [self setUpDataView];
    [self setUpLastView];
}

///--------------------------------------
#pragma mark - private methods
///--------------------------------------

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)setUpShowView
{
    UILabel *showView = [[UILabel alloc] init];
    showView.frame = CGRectMake(10, 20, self.view.width - 10 *2, KShowViewH);
    showView.text = @"0";
    showView.textColor = [UIColor whiteColor];
    showView.textAlignment = NSTextAlignmentRight;
    showView.font = [UIFont systemFontOfSize:50];
    [self.view addSubview:showView];
    self.showView = showView;
}

- (void)setUpNumberView
{
    CNCNnumberView *numberView = [[CNCNnumberView alloc] init];
    numberView.delegate = self;
    CGFloat numberViewY = CGRectGetMaxY(self.showView.frame) ;
    CGFloat numberViewW = KSingleUIButtonW * 3;
    CGFloat numBerViewH = KsingleUIButtonH * 3;
    numberView.frame = CGRectMake(0, numberViewY, numberViewW, numBerViewH);
    [self.view addSubview:numberView];
    self.numberView = numberView;
}

- (void)setUpHandelView
{
    CNCNHandelView *handelView = [[CNCNHandelView alloc] init];
    handelView.delegate = self;
    CGFloat handelViewX = CGRectGetMaxX(self.numberView.frame);
    CGFloat handelViewY = CGRectGetMaxY(self.showView.frame) ;
    CGFloat handelViewW = KSingleUIButtonW;
    CGFloat handelViewH = KsingleUIButtonH * 4;
    handelView.frame = CGRectMake(handelViewX, handelViewY, handelViewW, handelViewH);
    [self.view addSubview:handelView];
    self.handelView = handelView;
}

-(void)setUpResultView
{
    CNCNResultVIew *resultVIew = [[CNCNResultVIew alloc] init];
    resultVIew.delegate = self;
    CGFloat resultVIewY = CGRectGetMaxY(self.numberView.frame) ;
    CGFloat resultVIewW = KSingleUIButtonW * 3;
    CGFloat resultVIewH = KsingleUIButtonH ;
    resultVIew.frame = CGRectMake(0, resultVIewY, resultVIewW, resultVIewH);
    [self.view addSubview:resultVIew];
    self.resultVIew = resultVIew;
}

-(void)setUpFunctionView
{
    CNCNFunctionView *functionView = [[CNCNFunctionView alloc] init];
    functionView.delegate = self;
    CGFloat functionViewY = CGRectGetMaxY(self.resultVIew.frame) ;
    CGFloat functionViewW = KSingleUIButtonW * 4;
    CGFloat functionViewH = KsingleUIButtonH ;
    functionView.frame = CGRectMake(0, functionViewY, functionViewW, functionViewH);
    [self.view addSubview:functionView];
    self.functionView = functionView;
}

- (void)setUpDataView
{
    CNCNDataView *dataView = [[CNCNDataView alloc] init];
    dataView.delegate = self;
    CGFloat dataViewY = CGRectGetMaxY(self.functionView.frame) ;
    CGFloat dataViewW = KSingleUIButtonW * 4;
    CGFloat dataViewH = KsingleUIButtonH ;
    dataView.frame = CGRectMake(0, dataViewY, dataViewW, dataViewH);
    [self.view addSubview:dataView];
    self.dataView = dataView;
}

- (void)setUpLastView
{
    CNCNLastView *lastView = [[CNCNLastView alloc] init];
    lastView.delegate = self;
    CGFloat lastViewY = CGRectGetMaxY(self.dataView.frame) ;
    CGFloat lastViewW = KSingleUIButtonW * 4;
    CGFloat lastViewH = KsingleUIButtonH ;
    lastView.frame = CGRectMake(0, lastViewY, lastViewW, lastViewH);
    [self.view addSubview:lastView];
    self.lastView = lastView;
}

///--------------------------------------
#pragma mark - customDelegate
///--------------------------------------
- (void)numberView:(CNCNnumberView *)numberView didClickNumberBtn:(UIButton *)btn
{
    [self handelNumberWithBtn:btn];
}

- (void)handelView:(CNCNHandelView *)handelView didClicHandelBtn:(UIButton *)btn
{
    char option;
    if ([btn.currentTitle isEqualToString:@"x"]) {
        option='*';
    }else{
        const char *options = [btn.titleLabel.text UTF8String];
        option = options[0];
    }
   self.opration = [CNCNHandelTool creatOprationTool:option];
    self.num2 = [self.result doubleValue];
    [self.result setString:@""];
}

- (void)resultView:(CNCNResultVIew *)resultView didClickBtn:(UIButton *)btn
{
    switch (btn.tag) {
        case CNCNResultVIewTypeEqual: // 等于
            [self handelEqual];
            break;
        case CNCNResultVIewTypePoint: // 点
            [self handelPoint];
            break;
        case CNCNResultVIewTypeZero: // "0"
            [self handelNumberWithBtn:btn];
            break;
    }
}

- (void)dataView:(CNCNDataView *)dataView btnDidClick:(UIButton *)btn
{
    switch (btn.tag) {
        case CNCNDataViewTypeAddMinus: // 调换
            [self handelAddMinus];
            break;
        case CNCNDataViewTypeStore: // 存
            [self handelStore];
            break;
        case CNCNDataViewTypeRecall: // 取
            [self handelRecall];
            break;
        case CNCNDataViewTypeMem: // M+
            [self handelMem];
            break;
    }
}

- (void)functionView:(CNCNFunctionView *)functionView btnDidClick:(UIButton *)btn
{
    switch (btn.tag) {
        case CNCNFunctionViewTypeSqrt:
            [self handelSqtr];
            break;
        case CNCNFunctionViewTypeSin:
            [self handelSin];
            break;
        case CNCNFunctionViewTypeCos:
            [self handelCos];
            break;
        case CNCNFunctionViewTypePai:
            [self handelPai];
            break;
    }
}

- (void)lastView:(CNCNLastView *)lastView btnDidClick:(UIButton *)btn
{
    switch (btn.tag) {
        case CNCNLastViewTypeA:
            
            break;
            
        case CNCNLastViewTypeB:
            
            break;
        case CNCNLastViewTypeC: // 清除
            [self handelClear];
            break;
        case CNCNLastViewTypeX: // 1/x
            [self handelInverts];
            break;
        }
}

///--------------------------------------
#pragma mark - pritive
///--------------------------------------
// 数字
- (void)handelNumberWithBtn:(UIButton *)btn
{
    if ([self.showView.text isEqualToString:@"0"]) {
        self.showView.text = @"";
        [self.result setString:@""];
    }
    [self.result appendString:btn.currentTitle];
    self.num1 = [self.result doubleValue];
    self.showView.text = self.result;
}

// 等于
- (void)handelEqual
{
    if (self.num != 0 && self.num2 == 0) {
        self.num2 = self.num;
    }
    self.opration.number1 = self.num2;
    self.opration.number2 = self.num1;
    [self.result setString:[self.opration getResult]];
    [self handelLastShow];
    
}

// 点
- (void)handelPoint
{
    // 这一句保证字符串只能有一个“.”
    if ([self.showView.text containsString:@"."]) return;
    if ([self.showView.text isEqualToString:@"0"]) {
        [self.result setString:@""];
        [self.result appendString:@"0."];
        self.showView.text = self.result;
    }else{
        self.result = [NSMutableString stringWithString:self.showView.text];
        [self.result appendString:@"."];
        self.showView.text = self.result;
    }
}

// sqtr(开方)
- (void)handelSqtr
{
    double d  = [self.showView.text doubleValue];
    if (d == 0)   return;
    double result = 0;
    result = sqrt(d);
    [self.result setString:@""];
    [self.result appendFormat:@"%lf",result];
    [self handelLastShow];
}

// sin
- (void)handelSin
{
    double degree  = [self.showView.text doubleValue];
    if (degree == 0)   return;
    double result = 0;
    result = sin(M_PI/(180/degree));
    [self.result setString:@""];
    [self.result appendFormat:@"%lf",result];
    [self handelLastShow];
}

// cos
- (void)handelCos
{
    double degree  = [self.showView.text doubleValue];
    if (degree == 0)   return;
    double result = 0;
    result = cos(M_PI/(180/degree));
    [self.result setString:@""];
    [self.result appendFormat:@"%lf",result];
    [self handelLastShow];
}

// pai
- (void)handelPai
{
    double result = 3.141591653589793;
    [self.result setString:@""];
    [self.result appendFormat:@"%lf",result];
    [self handelLastShow];
}

// 存
- (void)handelStore
{
    [[NSUserDefaults standardUserDefaults] setObject:self.showView.text forKey:KCalculatorData];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
// 取
- (void)handelRecall
{
  NSString *string = [[NSUserDefaults standardUserDefaults] objectForKey:KCalculatorData];
    if (string.length) {
        // 先把result清零，保证不会把0拼接上去
        [self.result setString:@""];
        [self.result appendString:string];
        self.showView.text = self.result;
        self.num = [self.result doubleValue];
        [self.result setString:@""];
        self.num2 = 0;
    }else{
    self.showView.text = @"0";
    }
}
// m+
- (void)handelMem
{
    double s1 = [self.showView.text doubleValue];
    NSString *string = [[NSUserDefaults standardUserDefaults] objectForKey:KCalculatorData];
    double s2 =  (string.length) ? [string doubleValue] : 0;
    double result = 0;
    result = s1 + s2;
    [self.result setString:@""];
    [self.result appendFormat:@"%lf",result];
    [self handelLastShow];
}

// 调换
- (void)handelAddMinus
{
    if (self.num!= 0&&[self.result isEqualToString:@""]) {
        self.num1 = self.num;
    }
    self.num1 = -self.num1;
    [self.result setString:[NSString stringWithFormat:@"%f",self.num1]];
    [self clearZero];
    self.showView.text = self.result;
}

// 1/x
- (void)handelInverts
{
    double number = [self.showView.text doubleValue];
    if (number == 0) { // 显示错误
        self.showView.text = @"错误";
        self.num = [self.result doubleValue];
        [self.result setString:@""];
        self.num2 = 0;
    }else {
    double result = 0;
    result = 1 / number;
    [self.result setString:@""];
    [self.result appendFormat:@"%lf",result];
    [self handelLastShow];
    }
}

// 清除
- (void)handelClear
{
    [self.result setString:@"0"];
    self.num1 = 0;
    self.num2 = 0;
    self.num = 0;
    self.showView.text = self.result;
}

///--------------------------------------
#pragma mark - public
///-------------------------------------

- (void)handelLastShow
{
    [self clearZero];
    self.showView.text = self.result;
    self.num = [self.result doubleValue];
    [self.result setString:@""];
    self.num2 = 0;
}
- (void)clearZero
{
    for (int i = (int)[self.result length]-1; i>=0; i--) {
        char c = [self.result characterAtIndex:i];
        switch (c) {
        case '0':
            [self.result deleteCharactersInRange:NSMakeRange(i, 1)];
            break;
        case '.':
            [self.result deleteCharactersInRange:NSMakeRange(i, 1)];
            goto end;
            break;
        default:
            goto end;
            break;
        }
    }
         end:;
}
@end
