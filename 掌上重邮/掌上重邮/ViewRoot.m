//
//  ViewRoot.m
//  掌上重邮
//
//  Created by J J on 2018/5/26.
//  Copyright © 2018年 J J. All rights reserved.
//

#import "ViewRoot.h"
#import "discovery.h"
#import "Question.h"
#import "Table.h"
#import "Mine.h"
@interface ViewRoot ()

@end

@implementation ViewRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Blue.jpg"] forBarMetrics:UIBarMetricsDefault];
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [window makeKeyAndVisible];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.navigationItem.leftBarButtonItem = button;
    
    discovery *dis = [[discovery alloc] init];
    dis.view.backgroundColor = [UIColor whiteColor];
    Question *que = [[Question alloc] init];
    que.view.backgroundColor = [UIColor whiteColor];
    Table *tab = [[Table alloc] init];
    tab.view.backgroundColor = [UIColor whiteColor];
    Mine *mine = [[Mine alloc] init];
    mine.view.backgroundColor = [UIColor whiteColor];
    UITabBarController *tbController = [[UITabBarController alloc] init];
    
    NSArray *arrVC = [NSArray arrayWithObjects:tab, que, dis, mine, nil];
    tbController.viewControllers = arrVC;
    window.rootViewController = tbController;
    tbController.tabBar.translucent = NO;
    
    [self.view addSubview:window];
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
