//
//  MyCollectionViewCell.m
//  toutiao
//
//  Created by ZYN on 2022/4/12.
//

#import "MyCollectionViewCell.h"
#import "MyTableViewCell.h"
#import "ListData.h"
#import "DeleteTableViewCell.h"
#import "PushViewController.h"
#import "ViewController.h"


@interface MyCollectionViewCell ()<UITableViewDelegate,UITableViewDataSource,deleteCell>

@end

@implementation MyCollectionViewCell

- (NSMutableArray *)array {
    if (!_array) {
        _array = [[NSMutableArray alloc] init];
    }
    return _array;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:({
                    self.tableView = [[UITableView alloc] init];
                    self.tableView.delegate = self;
                    self.tableView.dataSource = self;
                    self.tableView.frame = CGRectMake(0, 30+10+20, 390, 632);
                    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"MyTableViewCellIdentifier"];
                    
                    self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
                    self.tableView;
        })];
    }
    
    return self;
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MyTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"MyTableViewCellIdentifier"];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell layoutTableViewCell:[self.array objectAtIndex:indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    NSLog(@"");
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)config:(ListData *)list {
    
    self.array = list.data;
    [self.tableView reloadData];
    NSLog(@"");
}



//删除
- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)button {
    
    DeleteTableViewCell *deleteView = [[DeleteTableViewCell alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 844)];
    
   
    
    __weak typeof(self) wself = self;
    [deleteView showDeleteView:^{
        __strong typeof(wself) strongSelf = wself;
            NSIndexPath *delIndexPath = [wself.tableView indexPathForCell:tableViewCell];
            if(strongSelf.array.count > delIndexPath.row) {
                //删除数据源
                NSMutableArray *data = [wself.array mutableCopy];
                [data removeObjectAtIndex:delIndexPath.row];
                strongSelf.array = [data copy];
               //刷新
                [strongSelf.tableView reloadData];
            }
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kNotifictionNewsContent" object:nil];
    
}

@end

