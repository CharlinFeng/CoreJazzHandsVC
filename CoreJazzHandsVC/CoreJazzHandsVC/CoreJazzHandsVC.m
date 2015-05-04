//
//  CoreJazzHandsVC.m
//  CoreJazzHandsVC
//
//  Created by 成林 on 15/5/2.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "CoreJazzHandsVC.h"
#import "IFTTTJazzHands.h"



@interface CoreJazzHandsVC ()

/** 动画管理器 */
@property (nonatomic,strong) IFTTTAnimator *animator;

/** 动画对象字典 */
@property (nonatomic,strong) NSDictionary *jazzAnimationDict;

/** 动画对象方向字典 */
@property (nonatomic,strong) NSDictionary *jazzAnimationSELDict;



@end

@implementation CoreJazzHandsVC


- (void)animate:(NSInteger)time{
    
    [self.animator animate:time];
}



-(void)jazzHands_frameHand:(UIView *)animatedView animType:(JazzHandsAnimType)animType kfmArrayBlock:(NSArray *(^)(IFTTTAnimation *animatiom))kfmArrayBlock{
    
    //创建动画对象
    IFTTTAnimation *animation = [self animationWithAnimType:animType animatedView:animatedView];
    
    if(kfmArrayBlock == nil){
        
        NSLog(@"错误：请传入关键帧数组。");
        return;
    }
    
    //获取数组
    NSArray *kfmArray = kfmArrayBlock(animation);
    
    //添加帧
    [kfmArray enumerateObjectsUsingBlock:^(JHKeyFrameModel *kfModel, NSUInteger idx, BOOL *stop) {
        
        if(![kfModel isKindOfClass:[JHKeyFrameModel class]]){
            
            NSLog(@"错误：关键帧数组内只能装JHKeyFrameModel模型。");
            
            *stop = YES;
            
            return;
        }
        
        IFTTTAnimationKeyFrame *keyFrame = [self animationKeyFrameWithAnimType:animType time:kfModel.time value:kfModel.value];
        
        [animation addKeyFrame:keyFrame];
    }];
    
    //注册动画
    [self.animator addAnimation:animation];
}




-(IFTTTAnimation *)animationWithAnimType:(JazzHandsAnimType)animType animatedView:(UIView *)animatedView{
    
    Class IFTTTAnimationClass = [self.jazzAnimationDict objectForKey:@(animType)];
    
    IFTTTAnimation *animation = [IFTTTAnimationClass animationWithView:animatedView];
    
    return animation;
}


-(IFTTTAnimationKeyFrame *)animationKeyFrameWithAnimType:(JazzHandsAnimType)animType time:(NSInteger)time value:(id)value{
    
    IFTTTAnimationKeyFrame *keyFrame = nil;
    
    switch (animType) {
        case JazzHandsAnimTypeAlpha:
            keyFrame = [IFTTTAnimationKeyFrame keyFrameWithTime:time andAlpha:[value floatValue]];
            break;
        case JazzHandsAnimTypeAngle:
            keyFrame = [IFTTTAnimationKeyFrame keyFrameWithTime:time andAngle:[value floatValue]];
            break;
        case JazzHandsAnimTypeColor:
            keyFrame = [IFTTTAnimationKeyFrame keyFrameWithTime:time andColor:value];
            break;
        case JazzHandsAnimTypeCornerRadius:
            keyFrame = [IFTTTAnimationKeyFrame keyFrameWithTime:time andCornerRadius:[value floatValue]];
            break;
        case JazzHandsAnimTypeFrame:
            keyFrame = [IFTTTAnimationKeyFrame keyFrameWithTime:time andFrame:[value CGRectValue]];
            break;
        case JazzHandsAnimTypeHide:
            keyFrame = [IFTTTAnimationKeyFrame keyFrameWithTime:time andHidden:[value boolValue]];
            break;
        case JazzHandsAnimTypeScale:
            keyFrame = [IFTTTAnimationKeyFrame keyFrameWithTime:time andScale:[value floatValue]];
            break;
        case JazzHandsAnimTypeTransform3D:
            keyFrame = [IFTTTAnimationKeyFrame keyFrameWithTime:time andTransform3D:value];
            break;
        case JazzHandsAnimTypeConstraints:
            keyFrame = [IFTTTAnimationKeyFrame keyFrameWithTime:time andConstraint:[value floatValue]];
            break;
        default:
            break;
    }
    
    return keyFrame;
}















-(IFTTTAnimator *)animator{
    
    if(_animator == nil){
        
        _animator = [[IFTTTAnimator alloc] init];
    }
    
    return _animator;
}



/*
 *  动画对象字典
 */
-(NSDictionary *)jazzAnimationDict{
    
    if(_jazzAnimationDict == nil){
        
        _jazzAnimationDict = @{
                                   @(JazzHandsAnimTypeAlpha):[IFTTTAlphaAnimation class],
                                   @(JazzHandsAnimTypeAngle):[IFTTTAngleAnimation class],
                                   @(JazzHandsAnimTypeColor):[IFTTTColorAnimation class],
                                   @(JazzHandsAnimTypeCornerRadius):[IFTTTCornerRadiusAnimation class],
                                   @(JazzHandsAnimTypeFrame):[IFTTTFrameAnimation class],
                                   @(JazzHandsAnimTypeHide):[IFTTTHideAnimation class],
                                   @(JazzHandsAnimTypeScale):[IFTTTScaleAnimation class],
                                   @(JazzHandsAnimTypeTransform3D):[IFTTTTransform3DAnimation class],
                                   @(JazzHandsAnimTypeConstraints):[IFTTTConstraintsAnimation class],
                               };
    }
    
    return _jazzAnimationDict;
}





@end
