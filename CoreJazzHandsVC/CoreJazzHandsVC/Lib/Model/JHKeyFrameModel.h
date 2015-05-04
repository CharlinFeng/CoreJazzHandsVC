//
//  JHKeyFrameModel.h
//  CoreJazzHands
//
//  Created by 成林 on 15/5/2.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface JHKeyFrameModel : NSObject


/** 时间点 */
@property (nonatomic,assign) NSUInteger time;


/** 时间点对应的值 */
@property (nonatomic,strong) id value;


/**
 *  快速创建帧模型
 *
 *  @param time  时间点
 *  @param value 时间点对应的值
 *
 *  @return 对象实例
 */
+(instancetype)kfm:(NSUInteger)time value:(id)value;

@end
