//
//  CNCNDataView.m
//  calculator
//
//  Created by 卢大刚 on 15/12/2.
//  Copyright © 2015年 cncn. All rights reserved.
//
#define KShowViewH  [UIScreen mainScreen].bounds.size.height * 0.2
#define KSingleUIButtonW  [UIScreen mainScreen].bounds.size.width   / 4
#define KsingleUIButtonH  ([UIScreen mainScreen].bounds.size.height - KShowViewH - 20) / 7

#import "CNCNDataView.h"

@implementation CNCNDataView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setUpBtnWithTitle:@"Store" tag:CNCNDataViewTypeStore];
        [self setUpBtnWithTitle:@"Recall" tag:CNCNDataViewTypeRecall];
        [self setUpBtnWithTitle:@"Mem+" tag:CNCNDataViewTypeMem];
        [self setUpBtnWithTitle:@"+/-" tag:CNCNDataViewTypeAddMinus];
    }
    return self;
}

- (UIButton *)setUpBtnWithTitle:(NSString *)title tag:(CNCNDataViewType )tag
{
    UIButton *btn = [[UIButton alloc] init];
    [btn addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchDown];
    btn.backgroundColor = [UIColor lightGrayColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:25];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
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
        CGFloat numBtnX = KSingleUIButtonW * i ;
        numBtn.frame = CGRectMake(numBtnX, 0, numBtnW, numBtnH);
    }
}

- (void)btnDidClick:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(dataView:btnDidClick:)]) {
        [self.delegate dataView:self btnDidClick:btn];
    }
}
@end
