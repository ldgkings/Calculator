//
//  CNCNResultVIew.h
//  calculator
//
//  Created by 卢大刚 on 15/12/2.
//  Copyright © 2015年 cncn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    /**	. */
    CNCNResultVIewTypePoint,
    /**	0 */
    CNCNResultVIewTypeZero,
    /**	= */
    CNCNResultVIewTypeEqual
  
} CNCNResultVIewType;

@interface CNCNResultVIew : UIView

@end
