//
//  ABCSort.h
//  Algorithm_4th
//
//  Created by 王晟骏 on 2019/12/21.
//  Copyright © 2019 justin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ABCSort : NSObject

// Selection Sort
- (void)selectionSort:(NSMutableArray *)array;
// insertion sort
- (void)insertionSort:(NSMutableArray *)array;
- (void)insertionSort2:(NSMutableArray *)array;
// shell sort
- (void)shellSort:(NSMutableArray *)array;

// merge
- (void)mergeSort:(NSMutableArray *)array;
- (void)mergeSortBU:(NSMutableArray *)array;

// partition
- (void)partitionSort:(NSMutableArray *)array;

// Test function
- (void)show:(NSArray *)array;
- (BOOL)isSorted:(NSArray *)arr;

@end

NS_ASSUME_NONNULL_END
