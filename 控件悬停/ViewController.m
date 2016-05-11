//
//  ViewController.m
//  控件悬停
//
//  Created by QHC on 16/3/27.
//  Copyright © 2016年 秦海川. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property(nonatomic, weak) UIView *hoverView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
}

/**
 *   添加控件
 */



// 悬停view离顶部的高度
static CGFloat const height = 100;
-(void)setupView
{
    //添加scrollview
    UIScrollView *scroView = [[UIScrollView alloc] init];
    scroView.backgroundColor = [UIColor purpleColor];
    scroView.frame = CGRectMake(0, 0, self.view.frame.size.width, 500);
    scroView.contentSize = CGSizeMake(0, 700);
    scroView.delegate = self;
    [self.view addSubview:scroView];
    
    //添加imageView
    UIImageView *imagView = [[UIImageView alloc] init];
    imagView.backgroundColor = [UIColor yellowColor];
    imagView.frame = CGRectMake(0, 0, self.view.frame.size.width, height);
    [scroView addSubview:imagView];
   
    //添加悬停view
    UIView *hoverView = [[UIView alloc] init];
    hoverView.backgroundColor = [UIColor magentaColor];
    hoverView.frame = CGRectMake(0, height, self.view.frame.size.width, height);
    self.hoverView = hoverView;
    [scroView addSubview:hoverView];
    
    //添加其它view
    UIView *otherView = [[UIView alloc] init];
    otherView.backgroundColor = [UIColor greenColor];
    otherView.frame = CGRectMake(0, 200, self.view.frame.size.width, 200);
    [scroView addSubview:otherView];
    
}

/**
 *  实现代理方法
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 判断什么时候悬停
    if (scrollView.contentOffset.y >= height) {
        
        //设置hoverView的起始点为0
        CGRect hoverRect = self.hoverView.frame;
        hoverRect.origin = CGPointZero;
        self.hoverView.frame = hoverRect;
        [self.view addSubview:self.hoverView];
        
        self.hoverView.alpha = 1 - (scrollView.contentOffset.y - height)/height;
        
    }else{
        
        CGRect hoverRect = self.hoverView.frame;
        hoverRect.origin.y = height;
        self.hoverView.frame = hoverRect;
        [scrollView addSubview:self.hoverView];
    
    }


}





@end
