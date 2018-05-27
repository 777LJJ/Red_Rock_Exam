//
//  discovery.m
//  掌上重邮
//
//  Created by J J on 2018/5/25.
//  Copyright © 2018年 J J. All rights reserved.
//

#import "discovery.h"
#define width [UIScreen mainScreen].bounds.size.width//宽
#define height [UIScreen mainScreen].bounds.size.height//高
@interface discovery ()

@end

@implementation discovery

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"发现";
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:[UIImage imageNamed:@"发现.png"] tag:104];
    
    self.tabBarItem = tabBarItem;
    //设置导航栏标题文字大小和颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor blueColor]}];
    
    //透明度
    self.navigationController.navigationBar.translucent = YES;
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.leftBarButtonItem = button;
    
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Blue.jpg"]];
    _imageView.frame = CGRectMake(0, 0, width, height);
    [self.view addSubview:_imageView];
    
    [self setView];
    [self imageShow];
}

- (void)imageShow
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height / 4)];
    _scrollView.pagingEnabled = YES;
    _scrollView.scrollEnabled = YES;
    _scrollView.contentSize = CGSizeMake(width * 3, height / 4);
    _scrollView.bounces = YES;
    
    for (int i = 0; i <= 2; i ++) {
        NSString *strName = [NSString stringWithFormat:@"0%d.jpg",i + 1];
        UIImage *image = [UIImage imageNamed:strName];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(width * i, 50, width, height / 4);
        [_scrollView addSubview:imageView];
    }
    [self.view addSubview:_scrollView];
}

- (void)setView
{
    UIView *view = [[UIView alloc] init];
    
    view.frame = CGRectMake(30, height / 3, width - 60, width - 60);
    
    view.backgroundColor = [UIColor whiteColor];
    
    for (int k = 0; k < 9; k ++)
    {
        NSString *strName = [NSString stringWithFormat:@"%d.png",k + 1];
        UIImage *image = [UIImage imageNamed:strName];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        imageView.frame = CGRectMake(40 + (k % 3) * 100, (k / 3) * 100 + 40, 77, 77);
        [view addSubview:imageView];
        
        imageView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressTap)];
        
        //单次点击
        tap.numberOfTapsRequired = 1;
        
        [imageView addGestureRecognizer:tap];
    }
    
    [self.view addSubview:view];
    
}

- (void)pressTap
{
    //创建显示对话框
    UIAlertController *alertController1 = [UIAlertController alertControllerWithTitle:@"被你发现了" message:@"这页是假的" preferredStyle:UIAlertControllerStyleAlert];
    
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
