//
//  UICollectionView+CollectionDataDelegateAdditions.m
//  MVVMFramework
//
//  Created by zzZ on 16/1/8.
//  Copyright © 2016年 momo. All rights reserved.
//

#import "UICollectionView+CollectionDataDelegateAdditions.h"
#import "MVVMCollectionDataDelegate.H"
#import <objc/runtime.h>

@implementation UICollectionView (CollectionDataDelegateAdditions)


- (MVVMCollectionDataDelegate *)collectionHander
{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setCollectionHander:(MVVMCollectionDataDelegate *)collectionHander
{
    if (collectionHander) {
        [collectionHander handleCollectionViewDatasourceAndDelegate:self];
    }
    objc_setAssociatedObject(self, @selector(collectionHander), collectionHander, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end

