//
//  PushViewController.m
//  toutiao
//
//  Created by ZYN on 2022/4/14.
//

#import "PushViewController.h"
#import "DeleteTableViewCell.h"
#import "ViewController.h"
#import "TableViewCell.h"
@interface PushViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   // [self initTableView];
    //self.view.backgroundColor = [UIColor redColor];
    //[[UIApplication alloc].windows.firstObject addSubview:self.view];
    
    self.del.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:self.del];
    
}


- (DeleteTableViewCell *)del {
    if (!_del) {
        _del = [[DeleteTableViewCell alloc] init];
    }
    return _del;
}


//- (NSMutableArray *)array {
//    if (!_array) {
//        _array = [NSMutableArray arrayWithObjects:@"不感兴趣", @"举报", @"拉黑此作者", @"屏蔽", nil];
//    }
//    return _array;
//}
//
//- (TableViewCell *)cell {
//    if (!_cell) {
//        _cell = [[TableViewCell alloc] init];
//    }
//    return _cell;
//}
//
//- (UITableView *)tableView{
//    if (!_tableview) {
//        _tableview = [[UITableView alloc] init];
//    }
//    return _tableview;
//}
//
//- (void)initTableView {
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
//    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"DeleteTableViewCell"];
//    self.tableView.frame  = CGRectMake(100,100, 200, 200);
//    [self.view addSubview:self.tableview];
//}
//
//- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
//    self.cell = [self.tableView dequeueReusableCellWithIdentifier:@"DeleteTableViewCell"];
//
//    self.cell.label.text = [self.array objectAtIndex:indexPath.row];
//    self.cell.selectionStyle = UITableViewCellAccessoryNone;
//    return self.cell;
//}
//
//- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 4;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 50;
//}
//
//- (void)showDeleteView:(dispatch_block_t)block {
//
//    _block = [block copy];
//
//    //self.tableView.frame  = CGRectMake(100,100, 200, 200);
//    [[UIApplication sharedApplication].windows.firstObject addSubview:self.view];
//    //self.backView.frame = CGRectMake(0, 60, self.bounds.size.width, self.bounds.size.height);
//    //self.button.frame = CGRectMake((self.bounds.size.width - 100) / 2 , (self.bounds.size.height - 50) / 2, 100, 50);
//    //self.tableView.frame  = CGRectMake(100,100, 200, 200);
//}
//
//- (void)dismissDeleteView {
//    [self.view removeFromSuperview];
//}
//
//- (void)clickButton {
//
//    if (_block) {
//        _block();
//    }
//
//    [self.view removeFromSuperview];
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    NSLog(@"000000000000000000");
//
//    //ViewController *vc;
//    switch (indexPath.row) {
//        case 0:
//            [self clickButton];
//            break;
//        case 1:
//            NSLog(@"1111111");
//
//            break;
//        case 2:
//
//            break;
//        case 3:
//
//            break;
//        default:
//            break;
//    }
//
//}

@end
