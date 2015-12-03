//
//  CNCNHandelView.h
//  calculator
//
//  Created by 卢大刚 on 15/12/2.
//  Copyright © 2015年 cncn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    /**	+ */
    CNCNHandelViewButtonTypeAdd,
    /**	- */
    CNCNHandelViewButtonTypeMinus,
    /**	* */
    CNCNHandelViewButtonTypeMultiply,
    /**	/ */
    CNCNHandelViewButtonTypeDivide

} CNCNHandelViewButtonType;

@class CNCNHandelView;

@protocol CNCNHandelViewDelegate <NSObject>
@optional
- (void)handelView:(CNCNHandelView *)handelView didClicHandelBtn:(UIButton *)btn;
@end

@interface CNCNHandelView : UIView
@property (nonatomic,weak)id<CNCNHandelViewDelegate> delegate;

@end
