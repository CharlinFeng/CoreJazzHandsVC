//
//  JHKeyFrameModel.m
//  CoreJazzHands
//
//  Created by 成林 on 15/5/2.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "JHKeyFrameModel.h"

@implementation JHKeyFrameModel


/**
 *  快速创建帧模型
 *
 *  @param time  时间点
 *  @param value 时间点对应的值
 *
 *  @return 对象实例
 */
+(instancetype)kfm:(NSUInteger)time value:(id)value{
    
    JHKeyFrameModel *kfm = [[JHKeyFrameModel alloc] init];
     
    kfm.time = time;
    
    kfm.value = value;
    
    return kfm;
}




@end
