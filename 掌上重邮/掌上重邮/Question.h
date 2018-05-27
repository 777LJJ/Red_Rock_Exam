//
//  Question.h
//  掌上重邮
//
//  Created by J J on 2018/5/26.
//  Copyright © 2018年 J J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Question : UIViewController
<
UITableViewDelegate,
UITableViewDataSource>
{
    UISegmentedControl *_segmentedControl;
    UITableView *_tableView;
    NSMutableArray *_arrayData;
}
@end
