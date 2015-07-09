//
//  ViewController.m
//  CoreJazzHands
//
//  Created by 冯成林 on 15/4/29.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "ViewController.h"
#import "RedView.h"
#import "BlueView.h"


@interface ViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;


@property (nonatomic,strong) RedView *redView;
@property (nonatomic,strong) BlueView *blueView;


@end

@implementation ViewController

- (void)viewDidLoad {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.scrollView];
    
    UIView *handView = nil;
    if(_type==0){
        [self.scrollView addSubview:self.redView];
        handView = self.redView;
    }else{
        [self.scrollView addSubview:self.blueView];
        handView = self.blueView;
    }

    [self jazzHands_frameHand:handView animType:JazzHandsAnimTypeFrame constraint:nil kfmArrayBlock:^NSArray *(IFTTTAnimation *animatiom) {
        return @[
              JazzHandsKFV(0, [NSValue valueWithCGRect:handView.frame]),
              JazzHandsKFV(320, NSValueFromRect(CGRectMake(520, 300, 100, 100))),
              JazzHandsKFV(640, NSValueFromRect(CGRectMake(840, 300, 100, 200))),
              ];
    }];
//
//    
//    [self jazzHands_frameHand:handView animType:JazzHandsAnimTypeAlpha kfmArrayBlock:^NSArray *(IFTTTAnimation *animatiom) {
//        return @[
//                 JazzHandsKFV(0, @(1)),
//                 JazzHandsKFV(320, @(.5f))
//                 ];
//    }];
//    
//    [self jazzHands_frameHand:handView animType:JazzHandsAnimTypeColor kfmArrayBlock:^NSArray *(IFTTTAnimation *animatiom) {
//        
//        return @[
//                 JazzHandsKFV(0, [UIColor redColor]),
//                 JazzHandsKFV(320, [UIColor brownColor])
//                 ];
//    }];
    

    
    [self jazzHands_frameHand:handView animType:JazzHandsAnimTypeCornerRadius constraint:nil kfmArrayBlock:^NSArray *(IFTTTAnimation *animatiom) {
        return @[
                                  JazzHandsKFV(0, @(0)),
                                  JazzHandsKFV(320, @(50))
                                  ];
    }];
    
//    [self jazzHands_frameHand:handView animType:JazzHandsAnimTypeAlpha kfmArrayBlock:^NSArray *(IFTTTAnimation *animatiom) {
//        return @[
//                 JazzHandsKFV(310, @(1.0)),
//                 JazzHandsKFV(320, @(.0))
//                 ];
//    }];
    
//    [self jazzHands_frameHand:handView animType:JazzHandsAnimTypeScale kfmArrayBlock:^NSArray *(IFTTTAnimation *animatiom) {
//                return @[
//                         JazzHandsKFV(0, @(1.0)),
//                         JazzHandsKFV(320, @(2.0))
//                         ];
//    }];
//    
//    [self jazzHands_frameHand:handView animType:JazzHandsAnimTypeTransform3D kfmArrayBlock:^NSArray *(IFTTTAnimation *animatiom) {
//        
//        IFTTTTransform3D *tt1 = [IFTTTTransform3D transformWithM34:0.03f];
//        IFTTTTransform3D *tt2 = [IFTTTTransform3D transformWithM34:0.3f];
//        
//        tt2.rotate = (IFTTTTransform3DRotate){ -(CGFloat)(M_PI), 1, 0, 0 };
//        tt2.translate = (IFTTTTransform3DTranslate){ 0, 0, 10 };
//        tt2.scale = (IFTTTTransform3DScale){ 0.5f, .5f, .5f };
//        
//        return @[
//                 JazzHandsKFV(0, tt1),
//                 JazzHandsKFV(320, tt2)
//                 ];
//    }];
//    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    self.scrollView.contentSize =CGSizeMake(self.view.bounds.size.width *3, 0);
    
    self.scrollView.pagingEnabled = YES;
    
}


-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
}


-(RedView *)redView{
    
    if(_redView==nil){
        _redView = [[RedView alloc] init];
        _redView.frame =CGRectMake(200, 100, 100, 100);
        _redView.backgroundColor = [UIColor redColor];
    }
    
    return _redView;
}

-(BlueView *)blueView{
    
    if(_blueView==nil){
        _blueView = [[BlueView alloc] initWithFrame:CGRectMake(0, 100, 40,40)];
        _blueView.backgroundColor = [UIColor blueColor];
    }
    
    return _blueView;
}


-(UIScrollView *)scrollView{
    
    if(_scrollView == nil){
        
        _scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _scrollView.delegate=self;
    }
    
    return _scrollView;
}




-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat x = scrollView.contentOffset.x;
    
    //监听
    [self animate:x];
}

- (IBAction)nextAction:(id)sender {
    
    ViewController *vc = [[ViewController alloc] init];
    
    vc.type = 1;
    
    [self.navigationController pushViewController:vc animated:YES];
}



@end
