//
//  TwoCollectionViewCell.m
//  toutiao
//
//  Created by ZYN on 2022/4/12.
//

#import "TwoCollectionViewCell.h"
#import "ListData.h"

@implementation TwoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:({
                    self.label = [[UILabel alloc] init];
                    self.label.frame = CGRectMake(0, 0, 30, 30);
                    self.label.font = [UIFont systemFontOfSize:12];
                    self.label.textAlignment = NSTextAlignmentCenter;
                    self.label;
        })];
    }
    return self;
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    self.label.textColor = selected ? [UIColor redColor] : [UIColor blackColor];
}

- (void)layoutTitleCollectionView:(ListData *)list {
    self.label.text = list.title;
}

@end

