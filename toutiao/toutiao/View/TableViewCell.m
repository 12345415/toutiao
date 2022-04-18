//
//  TableViewCell.m
//  toutiao
//
//  Created by ZYN on 2022/4/13.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:({
                    self.label = [[UILabel alloc] init];
                    self.label.backgroundColor = [UIColor clearColor];
                    self.label.frame = CGRectMake(5, 5, 190, 40);
                    self.label;
                    
        })];
    }
    return self;
}
@end
