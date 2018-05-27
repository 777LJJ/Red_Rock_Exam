//
//  Table.m
//  掌上重邮
//
//  Created by J J on 2018/5/26.
//  Copyright © 2018年 J J. All rights reserved.
//

#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height

#import "Table.h"

@interface Table ()

@end

@implementation Table

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"课表" image:[UIImage imageNamed:@"课表.png"] tag:101];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Table.jpg"]];
    
    imageView.frame = CGRectMake(0, 65, width, height - 110);
    
    [self.view addSubview:imageView];
    
    self.tabBarItem = tabBarItem;
    
    
    [self setButton];
}

- (void)setButton
{
    for (int j = 0; j < 6; j ++)
    {
        for (int k = 0; k < 7; k ++)
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            [btn setImage:[UIImage imageNamed:@"button.jpg"] forState:UIControlStateNormal];
            
            btn.frame = CGRectMake(33 + (width - 35) / 7 * k, 100 + (height - 140) / 6 * j, 80, 120);
            
            [btn addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
            
            [self.view addSubview:btn];
        }
    }
}

- (void)pressBtn
{
    //创建显示对话框
    UIAlertController *alertController1 = [UIAlertController alertControllerWithTitle:@"Yeah!" message:@"没课的日子真好!" preferredStyle:UIAlertControllerStyleAlert];
    
    //将对话框添加到主视图
    [self presentViewController:alertController1 animated:YES completion:nil];
    
    [NSTimer scheduledTimerWithTimeInterval:0.77 target:self selector:@selector(timerAction:) userInfo:alertController1 repeats:NO];
}

- (void)timerAction:(NSTimer *)timer
{
    UIAlertController *alert = (UIAlertController *)[timer userInfo];
    [alert dismissViewControllerAnimated:YES completion:nil];
    alert = nil;
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
