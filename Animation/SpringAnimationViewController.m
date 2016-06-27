//
//  SpringAnimationViewController.m
//  Animation
//
//  Created by LIUYONG on 16/6/27.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import "SpringAnimationViewController.h"
#import <POP.h>
@interface SpringAnimationViewController ()
@property (nonatomic, strong) UITextField *textField;
@end

@implementation SpringAnimationViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self spring1];
    [self spring2];
    [self spring3];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tap];
}

- (void)tap:(UITapGestureRecognizer *)tap {
    [self.view endEditing:YES];
}

- (void)spring1 {
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(15, 100, 100, 100)];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    POPSpringAnimation *anSpring = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anSpring.toValue = @(view1.center.x+200);
    anSpring.beginTime = CACurrentMediaTime() + 1.0f;
    anSpring.springBounciness = 10.0f;
    [view1 pop_addAnimation:anSpring forKey:@"position"];
}

- (void)spring2 {
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 30, 30)];
    label2.backgroundColor = [UIColor blueColor];
    label2.text = @"2";
    label2.textAlignment = NSTextAlignmentCenter;
    label2.textColor = [UIColor whiteColor];
    [self.view addSubview:label2];
    
    POPSpringAnimation *anim1 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    anim1.beginTime = CACurrentMediaTime() + 1.0f;
    anim1.springBounciness = 20.0f;
    anim1.toValue = [NSValue valueWithCGRect:CGRectMake(100, 100, 99, 99)];
    [label2 pop_addAnimation:anim1 forKey:@"size"];
}

- (void)spring3 {
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(15, 450, 300, 30)];
    [button setTitle:@"Login" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 400, 300, 30)];
    self.textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.textField.layer.borderWidth = 0.5;
    [self.view addSubview:self.textField];
}

- (void)buttonClick {
    
    POPSpringAnimation *shake = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    shake.springBounciness = 10;
    shake.velocity = @(3000);
    [self.textField.layer pop_addAnimation:shake forKey:@"shakePassword"];
}



@end
