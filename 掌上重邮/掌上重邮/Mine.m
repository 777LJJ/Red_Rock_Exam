//
//  Mine.m
//  掌上重邮
//
//  Created by J J on 2018/5/26.
//  Copyright © 2018年 J J. All rights reserved.
//

#import "Mine.h"
#define width [UIScreen mainScreen].bounds.size.width//宽
#define height [UIScreen mainScreen].bounds.size.height//高

@interface Mine ()

@end

@implementation Mine

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.title = @"我的";
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"我的.png"] tag:103];
    
    self.tabBarItem = tabBarItem;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Mine.png"]];
    imageView.frame = CGRectMake(0, 0, width, height / 4);
    [self.view addSubview:imageView];
    
    UIImageView *imageView02 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"head.png"]];
    imageView02.frame = CGRectMake(40, 70, 77, 77);
    [self.view addSubview:imageView02];
    
    for (int i = 1; i <= 7; i ++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *strName = [NSString stringWithFormat:@"我的 有信息页的副本 %d.png",i];
        [btn setImage:[UIImage imageNamed:strName] forState:UIControlStateNormal];
        
        btn.frame = CGRectMake(40, 100 + (height - 233) / 7 * i, width - 80, 60);
        
        btn.tag = i;
        
        [btn addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
    }
}

- (void)pressButton:(UIButton *)btn
{
    if (btn.tag == 1) {
        NSLog(@"1");
    }
    else if (btn.tag == 2)
    {
        NSLog(@"2");
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"积分商城敬请期待.jpg"]];
        imageView.frame = CGRectMake(0, 65, width, height - 130);
        [self.view addSubview:imageView];
        
        [NSTimer scheduledTimerWithTimeInterval:1.77 target:self selector:@selector(timerAction:) userInfo:imageView repeats:NO];
    }
    else if (btn.tag == 3)
    {
        NSLog(@"3");
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"问一问 空页面.jpg"]];
        imageView.frame = CGRectMake(0, 65, width, height - 130);
        [self.view addSubview:imageView];
        
        [NSTimer scheduledTimerWithTimeInterval:1.77 target:self selector:@selector(timerAction:) userInfo:imageView repeats:NO];
    }
    else if (btn.tag == 4)
    {
        NSLog(@"4");
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"帮一帮 空页面.jpg"]];
        imageView.frame = CGRectMake(0, 65, width, height - 130);
        [self.view addSubview:imageView];
        
        [NSTimer scheduledTimerWithTimeInterval:1.77 target:self selector:@selector(timerAction:) userInfo:imageView repeats:NO];
    }
    else if (btn.tag == 5)
    {
        NSLog(@"5");
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"草稿箱 空页面.jpg"]];
        imageView.frame = CGRectMake(0, 65, width, height - 130);
        [self.view addSubview:imageView];
        
        [NSTimer scheduledTimerWithTimeInterval:1.77 target:self selector:@selector(timerAction:) userInfo:imageView repeats:NO];
    }
    else if (btn.tag == 6)
    {
        NSLog(@"6");
    }
    else if (btn.tag == 7)
    {
        NSLog(@"7");
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"设置.jpg"]];
        imageView.frame = CGRectMake(0, 65, width, height - 130);
        [self.view addSubview:imageView];
        
        [NSTimer scheduledTimerWithTimeInterval:1.77 target:self selector:@selector(timerAction:) userInfo:imageView repeats:NO];
    }
}

- (void)timerAction:(NSTimer *)timer
{
    UIImageView *imageView = (UIImageView *)[timer userInfo];
    imageView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
