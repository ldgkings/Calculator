//
//  CNCNnumberView.m
//  calculator
//
//  Created by 卢大刚 on 15/12/2.
//  Copyright © 2015年 cncn. All rights reserved.
//
#define KShowViewH  [UIScreen mainScreen].bounds.size.height * 0.2
#define KSingleUIButtonW  [UIScreen mainScreen].bounds.size.width   / 4
#define KsingleUIButtonH  ([UIScreen mainScreen].bounds.size.height - KShowViewH - 20) / 7
#define KRowCount 3

#import "CNCNnumberView.h"
#import "UIView+Extension.h"

@implementation CNCNnumberView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpChildView];
    }
    return self;
}

- (void)setUpChildView
{
    for (int i = 1; i < 10; i++) {
        UIButton *numBtn = [[UIButton alloc] init];
        NSString *string = [NSString stringWithFormat:@"%d",i];
        [numBtn setTitle:string forState:UIControlStateNormal];
        [numBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        numBtn.titleLabel.font = [UIFont systemFontOfSize:30];
        numBtn.backgroundColor = [UIColor whiteColor];
        numBtn.tag = i;
        [self addSubview:numBtn];
    }
}

- (void)layoutSubviews
{
    CGFloat numBtnW = KSingleUIButtonW - 0.5;
    CGFloat numBtnH = KsingleUIButtonH - 0.5;
    [super layoutSubviews];
    NSUInteger count = self.subviews.count;
    for (int i = 0; i < count; i++) {
        int row = i / KRowCount;
        int line = i % KRowCount;
        UIButton *numBtn = self.subviews[i];
        CGFloat numBtnX = KSingleUIButtonW * line ;
        CGFloat numBtnY = KsingleUIButtonH * row;
        numBtn.frame = CGRectMake(numBtnX, numBtnY, numBtnW, numBtnH);
        
    }
}

@end
