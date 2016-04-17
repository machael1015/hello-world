//
//  ViewController.m
//  TBview
//
//  Created by 佟小波 on 16/4/7.
//  Copyright © 2016年 runhe. All rights reserved.
//

#import "ViewController.h"

#define kScrollViewWidth self.view.frame.size.width;
#define kScrollViewHeight self.view.frame.size.height;

@interface ViewController ()

@property(nonatomic,strong) UIScrollView *scrollView;

@end

@implementation ViewController



- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 20, 300, 130)];
        _scrollView.backgroundColor = [UIColor redColor];
        
        [self.view addSubview:_scrollView];
        
        // 取消弹簧效果
        _scrollView.bounces = NO;
        
        // 取消水平滚动条
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        
        // 要分页
        _scrollView.pagingEnabled = YES;
        
        // contentSize
        _scrollView.contentSize = CGSizeMake(5 * _scrollView.bounds.size.width, 0);
        
        // 设置代理
//        _scrollView.delegate = self;
    }
    return _scrollView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    for (int i = 0; i < 5; i++) {
        NSString *imageName = [NSString stringWithFormat:@"img_%02d", i + 1];
        UIImage *image = [UIImage imageNamed:imageName];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.scrollView.bounds];
        imageView.image = image;
        
        [self.scrollView addSubview:imageView];
    }
    
//    //确定每个image的位置
//    [self.scrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIImageView * _Nonnull imageView, NSUInteger idx, BOOL * _Nonnull stop) {
//        CGRect frame = imageView.frame;
//        frame.origin.x=idx*frame.size.width;
//        imageView.frame=frame;
//    }];
    // 计算imageView的位置
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx, BOOL *stop) {
        
        // 调整x => origin => frame
        CGRect frame = imageView.frame;
        frame.origin.x = idx * frame.size.width;
        
        imageView.frame = frame;
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
