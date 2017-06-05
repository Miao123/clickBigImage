//
//  ClickBigImageView.m
//  点击查看大图
//
//  Created by 苗建浩 on 2017/6/5.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "ClickBigImageView.h"
#define screenWidth  [UIScreen mainScreen].bounds.size.width
#define screenHight  [UIScreen mainScreen].bounds.size.height

@interface ClickBigImageView ()

@property (nonatomic, strong) ClickBigImageView *imageView;
@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) UIView *bigBottomView;


@end


@implementation ClickBigImageView


+ (instancetype)initWithFrame:(CGRect)frame imageUrl:(NSString *)url imageStr:(NSString *)str{
    ClickBigImageView *imageView = [[ClickBigImageView alloc] initWithFrame:frame];
    [imageView frame:frame imageUrl:url imageStr:str];
    imageView.imageView = imageView;
    return imageView;
}


- (void)frame:(CGRect)frame imageUrl:(NSString *)url imageStr:(NSString *)str{
    UIImageView *headImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    headImage.image = [UIImage imageNamed:str];
    headImage.userInteractionEnabled = YES;
    [self addSubview:headImage];
    
    
    //创建手势对象
    UITapGestureRecognizer *smallTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(smallTapAction:)];
    smallTap.numberOfTapsRequired = 1;
    smallTap.numberOfTouchesRequired = 1;
    [headImage addGestureRecognizer:smallTap];
    
    
    UIView *bigBottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHight)];
    bigBottomView.backgroundColor = [UIColor blackColor];
    bigBottomView.alpha = 0;
    bigBottomView.userInteractionEnabled = YES;
    self.bigBottomView = bigBottomView;
    [[UIApplication sharedApplication].keyWindow addSubview:bigBottomView];
    
    
    UIImageView *bigImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenWidth)];
    bigImage.image = [UIImage imageNamed:str];
    bigImage.center = bigBottomView.center;
    [bigBottomView addSubview:bigImage];
    
    
    UITapGestureRecognizer *bigTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bigTapClick:)];
    bigTap.numberOfTapsRequired = 1;
    bigTap.numberOfTouchesRequired = 1;
    [bigBottomView addGestureRecognizer:bigTap];
    
    
    UISwipeGestureRecognizer *upSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(bigTapClick:)];
    upSwipe.direction = UISwipeGestureRecognizerDirectionUp;
    [bigBottomView addGestureRecognizer:upSwipe];
    
    
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(bigTapClick:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [bigBottomView addGestureRecognizer:leftSwipe];
    
    
    UISwipeGestureRecognizer *downSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(bigTapClick:)];
    downSwipe.direction = UISwipeGestureRecognizerDirectionDown;
    [bigBottomView addGestureRecognizer:downSwipe];
    
    
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(bigTapClick:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [bigBottomView addGestureRecognizer:rightSwipe];
}


- (void)smallTapAction:(UITapGestureRecognizer *)tap{
    [UIView animateWithDuration:0.3 animations:^{
        self.bigBottomView.alpha = 1;
    }];
}


- (void)bigTapClick:(UITapGestureRecognizer *)tap{
    [UIView animateWithDuration:0.3 animations:^{
        _bigBottomView.alpha = 0;
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
