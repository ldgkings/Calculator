//
//  CNCNFunctionView.m
//  calculator
//
//  Created by 卢大刚 on 15/12/2.
//  Copyright © 2015年 cncn. All rights reserved.
//

#define KShowViewH  [UIScreen mainScreen].bounds.size.height * 0.2
#define KSingleUIButtonW  [UIScreen mainScreen].bounds.size.width   / 4
#define KsingleUIButtonH  ([UIScreen mainScreen].bounds.size.height - KShowViewH - 20) / 7

#import "CNCNFunctionView.h"

@implementation CNCNFunctionView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setUpBtnWithTitle:@"sqrt" tag:CNCNResultVIewTypeSqrt];
        [self setUpBtnWithTitle:@"sin" tag:CNCNResultVIewTypeSin];
        [self setUpBtnWithTitle:@"cos" tag:CNCNResultVIewTypeCos];
        [self setUpBtnWithTitle:@"π" tag:CNCNResultVIewTypePai];
    }
    return self;
}

- (UIButton *)setUpBtnWithTitle:(NSString *)title tag:(CNCNFunctionViewType )tag
{
    UIButton *btn = [[UIButton alloc] init];
    btn.backgroundColor = [UIColor lightGrayColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:30];
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


@end
