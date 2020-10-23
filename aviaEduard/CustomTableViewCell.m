//
//  CustomTableViewCell.m
//  aviaEduard
//
//  Created by Эдуард Фархшатов on 19.10.2020.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    UILabel *left = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width / 2.0, 44.0)];
    left.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:left];
    self.leftLabel = left;
    
    UILabel *right = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2.0, 0.0, [UIScreen mainScreen].bounds.size.width / 2.0, 44.0)];
    right.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:right];
    self.rightLabel = right;
    
    return self;
    
}
-(void)prepareForReuse{
    [super prepareForReuse];
    self.leftLabel.text = nil;
    self.rightLabel.text = nil;
    self.backgroundColor = nil; //[UIColor blackColor];
    self.tintColor = nil;
    self.imageView.image = nil;
}
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

//-(void)prepareForReuse {
//    [super prepareForReuse];
//    self.leftLabel.text = nil;
//    self.rightLabel.text = nil;
//}

@end
