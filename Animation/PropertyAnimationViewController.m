//
//  PropertyAnimationViewController.m
//  Animation
//
//  Created by LIUYONG on 16/6/27.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import "PropertyAnimationViewController.h"
#import <POP.h>
@implementation PropertyAnimationViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self property1];
}

- (void)property1 {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 250, 30)];
    [self.view addSubview:label];
    POPAnimatableProperty *prop = [POPAnimatableProperty propertyWithName:@"countdown" initializer:^(POPMutableAnimatableProperty *prop) {
        
        prop.writeBlock = ^(id obj, const CGFloat values[]) {
//            label = (UILabel*)obj;
            label.text = [NSString stringWithFormat:@"%02d:%02d:%02d",(int)values[0]/60,(int)values[0]%60,(int)(values[0]*100)%100];
        };
        
        //        prop.threshold = 0.01f;
    }];
    
    POPBasicAnimation *anBasic = [POPBasicAnimation linearAnimation];   //秒表当然必须是线性的时间函数
    anBasic.property = prop;    //自定义属性
    anBasic.fromValue = @(0);   //从0开始
    anBasic.toValue = @(30);  //30秒
    anBasic.duration = 30;    //持续30秒
    anBasic.beginTime = CACurrentMediaTime() + 1.0f;    //延迟1秒开始
    [label pop_addAnimation:anBasic forKey:@"countdown"];}
@end
