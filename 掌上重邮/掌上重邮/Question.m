//
//  Question.m
//  掌上重邮
//
//  Created by J J on 2018/5/26.
//  Copyright © 2018年 J J. All rights reserved.
//

#import "Question.h"
#import "AFNetworking.h"
#define width [UIScreen mainScreen].bounds.size.width//宽
#define height [UIScreen mainScreen].bounds.size.height//高

@interface Question ()

@end

@implementation Question

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"邮问";
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"邮问" image:[UIImage imageNamed:@"邮问.png"] tag:102];
    
    self.tabBarItem = tabBarItem;
    
    [self segMentedControl];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"邮问";
    label.frame = CGRectMake(width / 2 - 40, 25, 80, 40);
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:30];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 130, width, height - 40) style:UITableViewStylePlain];
    
    //自动调整子视图大小
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    //设置代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    //初始化数据源数组
    _arrayData = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 7; i ++)
    {
        NSString *str = [NSString stringWithFormat:@"第 %d   问",i+ 1];

        [_arrayData addObject:str];
    }
    
}

- (void)segMentedControl
{
    _segmentedControl = [[UISegmentedControl alloc] init];
    
    _segmentedControl.frame = CGRectMake(0, 65, width, 50);
    
    [_segmentedControl insertSegmentWithTitle:@"全部" atIndex:0 animated:YES];
    [_segmentedControl insertSegmentWithTitle:@"学习" atIndex:1 animated:YES];
    [_segmentedControl insertSegmentWithTitle:@"生活" atIndex:2 animated:YES];
    [_segmentedControl insertSegmentWithTitle:@"情感" atIndex:3 animated:YES];
    
    _segmentedControl.selectedSegmentIndex = 0;
    
    [_segmentedControl addTarget:self action:@selector(segChange) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_segmentedControl];
}

- (void)segChange
{
    if (_segmentedControl.selectedSegmentIndex == 0)
    {
        self.view.backgroundColor = [UIColor redColor];
    }
    else if (_segmentedControl.selectedSegmentIndex == 1)
    {
        self.view.backgroundColor = [UIColor orangeColor];
    }
    else if (_segmentedControl.selectedSegmentIndex == 2)
    {
        self.view.backgroundColor = [UIColor yellowColor];
    }
    else if (_segmentedControl.selectedSegmentIndex == 3)
    {
        self.view.backgroundColor = [UIColor greenColor];
    }
}


//单元格显示效果协议
- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //默认为删除
    //UITableViewCellEditingStyleDelete：删除
    //UITableViewCellEditingStyleInsert：添加
    //UITableViewCellEditingStyleNone：虚空状态
    //UITableViewCellEditingStyleInsert | UITableViewCellEditingStyleDelete选择状态
    return UITableViewCellEditingStyleDelete;
}

//当手指在单元格上滑动时
//可以显示编辑状态
- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //删除按钮
    //删除数据源对应的数据
    [_arrayData removeObjectAtIndex:indexPath.row];
    //数据源更新
    [_tableView reloadData];
    
}

//点击单元格时，调用函数
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    scrollView.pagingEnabled = YES;
    scrollView.scrollEnabled = YES;
    scrollView.contentSize = CGSizeMake(width, height * 4);
    scrollView.bounces = YES;
    
    
    for (int J = 0; J < 4; J ++)
    {
        NSString *strName = [NSString stringWithFormat:@"help0%d.jpg",J + 1];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:strName]];
        imageView.frame = CGRectMake(0, height * J, width, height);
        
        imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        [scrollView addSubview:imageView];
    }
    [self.view addSubview:scrollView];
}

//点击不同单元格时，调用函数
- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrayData.count;
}

//改变单元格的高度
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 77;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *strID = @"ID";

    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:strID];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:strID];
    }

    cell.textLabel.text = [_arrayData objectAtIndex:indexPath.row];

    cell.detailTextLabel.text = @"***邮问***";

    NSString *str = [NSString stringWithFormat:@"JJ.JPG"];
    UIImage *image = [UIImage imageNamed:str];

    cell.imageView.image = image;

    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//获取头部高度
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100;
}

//获取尾部高度
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20;
}

@end
