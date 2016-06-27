//
//  BasicAnimationViewController.m
//  Animation
//
//  Created by LIUYONG on 16/6/27.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import "BasicAnimationViewController.h"
#import <POP.h>
@implementation BasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self base1];
    [self base2];
}

- (void)base1 {
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(15, 100, 100, 100)];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    POPBasicAnimation *anBasic = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anBasic.toValue = @(view1.center.x+200);
    anBasic.beginTime = CACurrentMediaTime() + 1.0f;
    [view1 pop_addAnimation:anBasic forKey:@"position"];
}

- (void)base2 {
    CALayer *layer0 = [CALayer layer];
    layer0.opacity = 1.0;
    layer0.transform = CATransform3DIdentity;
    [layer0 setMasksToBounds:YES];
    [layer0 setBackgroundColor:[UIColor colorWithRed:0.5448 green:0.6836 blue:0.9986 alpha:1.0].CGColor];
    [layer0 setCornerRadius:12.5];
    [layer0 setBounds:CGRectMake(0, 0, 25, 25)];
    [self.view.layer addSublayer:layer0];
    layer0.position = CGPointMake(self.view.center.x, 266);
    [self performAnimation:layer0];
}

- (void)performAnimation:(CALayer *)layer {
    [layer pop_removeAllAnimations];
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    anim.duration = 1.0;
    static BOOL ani = YES;
    if (ani) {
        anim.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
    }else{
        anim.toValue = [NSValue valueWithCGPoint:CGPointMake(1.5, 1.5)];
    }
    ani = !ani;
    anim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        if (finished) { [self performAnimation:layer]; }
    };
    [layer pop_addAnimation:anim forKey:@"Animation"];
}


@end
