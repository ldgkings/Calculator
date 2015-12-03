//
//  CNCNFunctionView.h
//  calculator
//
//  Created by 卢大刚 on 15/12/2.
//  Copyright © 2015年 cncn. All rights reserved.
//



#import <UIKit/UIKit.h>

typedef enum {
    CNCNFunctionViewTypeSqrt,
  
    CNCNFunctionViewTypeSin,
   
    CNCNFunctionViewTypeCos,
  
    CNCNFunctionViewTypePai
    
} CNCNFunctionViewType;

@class CNCNFunctionView;
@protocol CNCNFunctionViewDelegate <NSObject>

- (void)functionView:(CNCNFunctionView *)functionView btnDidClick:(UIButton *)btn;
@end

@interface CNCNFunctionView : UIView
@property (weak ,nonatomic) id<CNCNFunctionViewDelegate> delegate;
@end
