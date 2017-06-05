//
//  ViewController.m
//  点击查看大图
//
//  Created by 苗建浩 on 2017/6/5.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "ViewController.h"
#import "ClickBigImageView.h"
@interface ViewController ()

@property (nonatomic, strong) ClickBigImageView *headImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"单张图片显示";
    
    
    ClickBigImageView *headImage = [ClickBigImageView initWithFrame:CGRectMake(100, 100, 100, 100) imageUrl:@"" imageStr:@"111"];
    [self.view addSubview:headImage];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
