//
//  DecayAnimationViewController.m
//  Animation
//
//  Created by LIUYONG on 16/6/27.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import "DecayAnimationViewController.h"
#import <POP.h>
@implementation DecayAnimationViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self decay1];
}

- (void)decay1 {
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(15, 100, 100, 100)];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    POPDecayAnimation *anDecay = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anDecay.velocity = @(600);
    anDecay.beginTime = CACurrentMediaTime() + 1.0f;
    [view1 pop_addAnimation:anDecay forKey:@"position"];
}

@end
