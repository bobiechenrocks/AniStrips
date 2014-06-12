//
//  BCAniStripesMainViewController.m
//  AniStripes
//
//  Created by Bobie Chen on 2014/3/18.
//  Copyright (c) 2014年 Bobie Chen. All rights reserved.
//

#import "BCAniStripesMainViewController.h"
#import "BCAniStripesCell.h"
#import "BCAniStripesScrollViewController.h"

@interface BCAniStripesMainViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong) UICollectionView* mainCollectionView;

@end

const CGFloat kfiOSStatusBarHeight = 20.0f;
const CGFloat kfiOSNavBarHeight = 44.0f;
const NSInteger knAnimationCount = 6;

@implementation BCAniStripesMainViewController

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
    
    self.title = @"AniStripes";
    
    [self prepareMainView];
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

- (void)prepareMainView
{
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    
    if (!self.mainCollectionView) {
        CGFloat fCollectionViewHeight = screenSize.width - kfiOSNavBarHeight;
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
        self.mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, screenSize.height, fCollectionViewHeight) collectionViewLayout:layout];
        [self.view addSubview:self.mainCollectionView];
        
        [self.mainCollectionView registerClass:[BCAniStripesCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
        [self.mainCollectionView setDataSource:self];
        [self.mainCollectionView setDelegate:self];
        
        [self.mainCollectionView setBackgroundColor:[UIColor clearColor]];
    }
}

#pragma mark - delegate & data-source for collection-view

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return knAnimationCount;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BCAniStripesCell* cell = (BCAniStripesCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    if (!cell)
    {
        cell = [[BCAniStripesCell alloc] init];
    }
    
    [cell prepareAniStripesCellWithImagename:[NSString stringWithFormat:@"%02d.jpg", indexPath.row+1]];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    /* 828x640 */
    return CGSizeMake(100.0f, 77.3f);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    BCAniStripesScrollViewController* scrollViewController = [[BCAniStripesScrollViewController alloc] init];
    [scrollViewController prepareAnimationViewWithImagename:[NSString stringWithFormat:@"%02d.jpg", indexPath.row+1]];
    
    [self.navigationController pushViewController:scrollViewController animated:YES];
}

@end
