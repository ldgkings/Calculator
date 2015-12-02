//
//  CNCNFunctionView.h
//  calculator
//
//  Created by 卢大刚 on 15/12/2.
//  Copyright © 2015年 cncn. All rights reserved.
//



#import <UIKit/UIKit.h>

typedef enum {
    /**	sqrt */
    CNCNResultVIewTypeSqrt,
    /**	sin */
    CNCNResultVIewTypeSin,
    /**	cos */
    CNCNResultVIewTypeCos,
    /**	π */
    CNCNResultVIewTypePai
    
} CNCNFunctionViewType;


@interface CNCNFunctionView : UIView

@end
