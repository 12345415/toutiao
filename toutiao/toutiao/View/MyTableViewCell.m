//
//  MyTableViewCell.m
//  toutiao
//
//  Created by ZYN on 2022/4/12.
//

#import "MyTableViewCell.h"
#import "SDWebImage.h"
@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:({
                    self.message = [[UILabel alloc] init];
                    self.message.frame = CGRectMake(10, 5, 270, 50);
                    self.message.backgroundColor = [UIColor whiteColor];
                    self.message.numberOfLines = 0;
                    self.message.lineBreakMode = NSLineBreakByWordWrapping;
                    self.message.font = [UIFont systemFontOfSize:15];
                    self.message;
        })];
        
        [self.contentView addSubview:({
                    self.source = [[UILabel alloc] init];
                    self.source.frame = CGRectMake( self.message.frame.origin.x , self.message.frame.size.height + self.message.frame.origin.y + 5, 90, 20);
                    self.source.backgroundColor = [UIColor clearColor];
                    self.source.font = [UIFont systemFontOfSize:13];
        
                    self.source;
        })];
        
        [self.contentView addSubview:({
                    self.command = [[UILabel alloc] init];
                    self.command.frame = CGRectMake(self.source.frame.origin.x + self.source.frame.size.width, self.source.frame.origin.y , 100, 20);
                    self.command.backgroundColor = [UIColor clearColor];
                    self.command.textAlignment = NSTextAlignmentLeft;
                    self.command.font = [UIFont systemFontOfSize:13];
                    self.command;
        })];
        
        [self.contentView addSubview:({
                    self.imageview = [[UIImageView alloc] init];
                    self.imageview.image = [UIImage imageNamed:@"123"];
                    self.imageview.frame = CGRectMake(self.message.frame.size.width + self.message.frame.origin.x + 10, 5, 70, 70);
                    self.imageview;
        })];
        
        [self.contentView addSubview:({
                    self.button = [[UIButton alloc] init];
                    //button位于tablecell右下角
                    self.button.frame = CGRectMake(360, 60, 15, 15);
                    [self.button setTitle:@"X" forState:UIControlStateNormal];
                    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self.button addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
                    self.button;
        })];
    }
    return self;
}

- (void)layoutTableViewCell:(NSDictionary *)dict {
    self.message.text = [dict objectForKey:@"title"];
    self.source.text = [dict objectForKey:@"author_name"];
    [self.source sizeToFit];
    
    self.command.text = [dict objectForKey:@"comments"];
    self.command.frame = CGRectMake(self.source.frame.origin.x + self.source.frame.size.width + 10, self.source.frame.origin.y, self.command.frame.size.width, self.command.frame.size.height);
    [self.command sizeToFit];
    
    [self.imageview sd_setImageWithURL:[NSURL URLWithString:[dict objectForKey:@"url"]]];
}

//删除按钮的点击事件
- (void)deleteButtonClick {
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]) {
        [self.delegate tableViewCell:self clickDeleteButton:self.button];
    }
    
    
}

@end
