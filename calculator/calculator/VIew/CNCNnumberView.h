//
//  CNCNnumberView.h
//  calculator
//
//  Created by 卢大刚 on 15/12/2.
//  Copyright © 2015年 cncn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CNCNnumberView;

@protocol CNCNnumberViewDelegate <NSObject>
@optional
- (void)numberView:(CNCNnumberView *)numberView didClickNumberBtn:(UIButton *)btn;

@end
@interface CNCNnumberView : UIView

@property (nonatomic,weak)id<CNCNnumberViewDelegate> delegate;
@end
