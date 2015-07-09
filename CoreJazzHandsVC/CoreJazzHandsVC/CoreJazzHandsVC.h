//
//  CoreJazzHandsVC.h
//  CoreJazzHandsVC
//
//  Created by 成林 on 15/5/2.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHKeyFrameModel.h"
#import "IFTTTAnimation.h"
#import "IFTTTTransform3DAnimation.h"

#define JazzHandsKFV(time,val) [JHKeyFrameModel kfm:time value:val]
#define NSValueFromRect(rect) [NSValue valueWithCGRect:rect]


/*
 *  动画类型
 */
typedef enum {
    
    /** Alpha */
    JazzHandsAnimTypeAlpha=0,
    
    /** Angle */
    JazzHandsAnimTypeAngle,
    
    /** Color */
    JazzHandsAnimTypeColor,
    
    /** CornerRadius */
    JazzHandsAnimTypeCornerRadius,
    
    /** Frame */
    JazzHandsAnimTypeFrame,
    
    /** Hide */
    JazzHandsAnimTypeHide,
    
    /** Scale */
    JazzHandsAnimTypeScale,
    
    /** Transform3D */
    JazzHandsAnimTypeTransform3D,
    
    /** Constraints */
    JazzHandsAnimTypeConstraints,
    
}JazzHandsAnimType;





@interface CoreJazzHandsVC : UIViewController


- (void)animate:(NSInteger)time;






-(void)jazzHands_frameHand:(UIView *)animatedView animType:(JazzHandsAnimType)animType constraint:(NSLayoutConstraint *)constraint kfmArrayBlock:(NSArray *(^)(IFTTTAnimation *animatiom))kfmArrayBlock;

@end
