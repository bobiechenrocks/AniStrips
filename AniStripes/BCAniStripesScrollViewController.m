//
//  BCAniStripesScrollViewController.m
//  AniStripes
//
//  Created by Bobie Chen on 2014/3/18.
//  Copyright (c) 2014年 Bobie Chen. All rights reserved.
//

#import "BCAniStripesScrollViewController.h"

@interface BCAniStripesScrollViewController ()

@property (strong) UIImageView* imageAnimationBase;

@end

const CGFloat kfImageWidth = 357.0f;
const CGFloat kfImageHeight = 276.0f;

@implementation BCAniStripesScrollViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)prepareAnimationViewWithImagename:(NSString*)stringName
{
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    
    if (!self.imageAnimationBase) {
        self.imageAnimationBase = [[UIImageView alloc] initWithFrame:CGRectMake((screenSize.height - kfImageWidth)/2, 0.0f, kfImageWidth, kfImageHeight)];
        [self.view addSubview:self.imageAnimationBase];
    }
  
    self.imageAnimationBase.image = [UIImage imageNamed:stringName];
    
    UIScrollView* baseScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, screenSize.height, kfImageHeight)];
    [self.view addSubview:baseScroll];
    
    [baseScroll setContentSize:CGSizeMake(screenSize.height*2, kfImageHeight)];
    
    UIImageView* imageStripes = [[UIImageView alloc] initWithFrame:CGRectMake((screenSize.height - kfImageWidth)/2, 0.0f, kfImageWidth, kfImageHeight)];
    [baseScroll addSubview:imageStripes];
    imageStripes.image = [UIImage imageNamed:@"stripe.png"];
}

@end
