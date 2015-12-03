//
//  CNCNDataView.h
//  calculator
//
//  Created by 卢大刚 on 15/12/2.
//  Copyright © 2015年 cncn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    CNCNDataViewTypeStore,
    CNCNDataViewTypeRecall,
    CNCNDataViewTypeMem,
    CNCNDataViewTypeAddMinus
} CNCNDataViewType;

@class CNCNDataView;

@protocol CNCNDataViewDelegate <NSObject>

- (void)dataView:(CNCNDataView *)dataView btnDidClick:(UIButton *)btn;

@end

@interface CNCNDataView : UIView
@property (weak ,nonatomic) id<CNCNDataViewDelegate> delegate;
@end
