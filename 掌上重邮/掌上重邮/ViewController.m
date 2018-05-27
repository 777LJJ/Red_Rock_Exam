//
//  ViewController.m
//  掌上重邮
//
//  Created by J J on 2018/5/25.
//  Copyright © 2018年 J J. All rights reserved.
//

#import "ViewController.h"
#import "Login.h"
#define width [UIScreen mainScreen].bounds.size.width//宽
#define height [UIScreen mainScreen].bounds.size.height//高
@interface ViewController ()<UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //视图对象
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"掌上重邮.png"]];
    _imageView.frame = CGRectMake(0, 0, width, height);
    
    [self.view addSubview:_imageView];
    
    self.navigationController.delegate = self;
}

//隐藏导航栏
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    bool showImage = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:showImage animated:YES];
}

//点击屏幕
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CATransition *anim = [CATransition animation];
    anim.duration = 3.7;
    anim.type = @"rippleEffect";
    anim.subtype = kCATransitionFromTop;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.navigationController.view.layer addAnimation:anim forKey:nil];
    
    //登陆界面
    Login *login = [[Login alloc] init];
    
    [self.navigationController pushViewController:login animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
