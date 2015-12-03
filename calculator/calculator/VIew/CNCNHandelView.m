//
//  CNCNHandelView.m
//  calculator
//
//  Created by 卢大刚 on 15/12/2.
//  Copyright © 2015年 cncn. All rights reserved.
//

#define KShowViewH  [UIScreen mainScreen].bounds.size.height * 0.2
#define KSingleUIButtonW  [UIScreen mainScreen].bounds.size.width   / 4
#define KsingleUIButtonH  ([UIScreen mainScreen].bounds.size.height - KShowViewH - 20) / 7
#define KRowCount 1

#import "CNCNHandelView.h"

@implementation CNCNHandelView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setUpBtnWithTitle:@"+" tag:CNCNHandelViewButtonTypeAdd];
        [self setUpBtnWithTitle:@"-" tag:CNCNHandelViewButtonTypeMinus];
        [self setUpBtnWithTitle:@"x" tag:CNCNHandelViewButtonTypeMultiply];
        [self setUpBtnWithTitle:@"/" tag:CNCNHandelViewButtonTypeDivide];
        }
    return self;
}

- (UIButton *)setUpBtnWithTitle:(NSString *)title tag:(CNCNHandelViewButtonType )tag
{
    UIButton *btn = [[UIButton alloc] init];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    btn.backgroundColor = [UIColor orangeColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:30];
    if (tag == CNCNHandelViewButtonTypeDivide) {
        btn.titleLabel.font = [UIFont systemFontOfSize:20];
    }
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.tag = tag;
    [self addSubview:btn];
    return btn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat numBtnW = KSingleUIButtonW - 0.5;
    CGFloat numBtnH = KsingleUIButtonH - 0.5;
    NSUInteger count = self.subviews.count;
    for (int i = 0; i < count; i++) {
        UIButton *numBtn = self.subviews[i];
        CGFloat numBtnY = KsingleUIButtonH * i ;
        numBtn.frame = CGRectMake(0, numBtnY, numBtnW, numBtnH);
        
    }
}

- (void)btnClick:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(handelView:didClicHandelBtn:)]) {
        [self.delegate handelView:self didClicHandelBtn:btn];
    }
}

@end
