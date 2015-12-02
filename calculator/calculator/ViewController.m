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


#import "ViewController.h"
#import "UIView+Extension.h"
#import "CNCNnumberView.h"
#import "CNCNHandelView.h"
#import "CNCNResultVIew.h"
#import "CNCNFunctionView.h"
#import "CNCNDataView.h"
#import "CNCNLastView.h"

@interface ViewController ()
/**	上面显示的label */
@property (weak ,nonatomic) UILabel *showView;
@property (weak ,nonatomic) CNCNnumberView *numberView;
@property (weak ,nonatomic) CNCNHandelView *handelView;
@property (weak ,nonatomic) CNCNResultVIew *resultVIew;
@property (weak ,nonatomic) CNCNFunctionView *functionView;
@property (weak ,nonatomic) CNCNDataView *dataView;
@property (weak ,nonatomic)CNCNLastView *lastView;
@end

@implementation ViewController


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

@end
