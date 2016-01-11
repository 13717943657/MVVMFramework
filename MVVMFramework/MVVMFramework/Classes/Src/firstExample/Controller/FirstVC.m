//
//  FirstVC.m
//  DevelopFramework
//
//  Created by momo on 15/12/5.
//  Copyright © 2015年 teason. All rights reserved.
//

#import "FirstVC.h"
#import "XTableDataDelegate.h"
#import "BQCell.h"
#import "FirstModel.h"
#import "UITableViewCell+Extension.h"
#import "SecondVC.h"
#import "BQViewModel.h"


static NSString *const MyCellIdentifier = @"BQCell" ;  // `cellIdentifier` AND `NibName` HAS TO BE SAME !
static NSString *const MyCellIdentifier2 = @"BQCell2" ;

@interface FirstVC ()

@end

@implementation FirstVC

- (void)viewDidLoad
{
    [super viewDidLoad] ;
    [self setupTableView] ;

}

/**
 *  tableView的一些初始化工作
 */
- (void)setupTableView
{
    __weak typeof(self) weakSelf = self;
    self.table.separatorStyle = UITableViewCellSelectionStyleNone;
    
    self.table.tableHander = [[XTableDataDelegate alloc]initWithViewModel:[[BQViewModel alloc]init]
                                                     cellIdentifiersArray:@[MyCellIdentifier,MyCellIdentifier2]
                                                           didSelectBlock:^(NSIndexPath *indexPath, id item) {
                                                               
                                                               SecondVC *vc = (SecondVC *)[UIViewController viewControllerWithStoryBoardName:@"Main" identifier:@"SecondVCID"];
                                                               [weakSelf.navigationController pushViewController:vc animated:YES];
                                                               NSLog(@"click row : %@",@(indexPath.row)) ;
                                                           }];
}

@end
