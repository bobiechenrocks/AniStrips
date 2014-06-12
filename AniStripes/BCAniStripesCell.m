//
//  BCAniStripesCell.m
//  AniStripes
//
//  Created by Bobie Chen on 2014/3/18.
//  Copyright (c) 2014年 Bobie Chen. All rights reserved.
//

#import "BCAniStripesCell.h"

@interface BCAniStripesCell ()

@property (strong) UIImageView* imageThumbnail;

@end

@implementation BCAniStripesCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)prepareAniStripesCellWithImagename:(NSString*)stringName
{
    if (!stringName || [stringName isEqualToString:@""]) {
        return;
    }
    
    if (!self.imageThumbnail) {
        self.imageThumbnail = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height)];
        [self addSubview:self.imageThumbnail];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.imageThumbnail.image = [UIImage imageNamed:stringName];
    });
}

@end
