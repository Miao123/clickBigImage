//
//  ClickBigImageView.h
//  点击查看大图
//
//  Created by 苗建浩 on 2017/6/5.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClickBigImageView : UIView

+ (instancetype)initWithFrame:(CGRect)frame imageUrl:(NSString *)url imageStr:(NSString *)str;

- (void)frame:(CGRect)frame imageUrl:(NSString *)url imageStr:(NSString *)str;

@end
