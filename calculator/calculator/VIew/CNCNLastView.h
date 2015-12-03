//
//  CNCNLastView.h
//  calculator
//
//  Created by 卢大刚 on 15/12/2.
//  Copyright © 2015年 cncn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    CNCNLastViewTypeX,
    CNCNLastViewTypeA,
    CNCNLastViewTypeB,
    CNCNLastViewTypeC
} CNCNLastViewType;

@class CNCNLastView;

@protocol CNCNLastViewDelegate <NSObject>

@optional
- (void)lastView:(CNCNLastView *)lastView btnDidClick:(UIButton *)btn;

@end

@interface CNCNLastView : UIView

@property (weak ,nonatomic) id<CNCNLastViewDelegate> delegate;

@end
