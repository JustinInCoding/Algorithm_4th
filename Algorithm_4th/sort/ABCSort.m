//
//  ABCSort.m
//  Algorithm_4th
//
//  Created by 王晟骏 on 2019/12/21.
//  Copyright © 2019 justin. All rights reserved.
//

#import "ABCSort.h"

@interface ABCSort ()

@property (nonatomic, strong) NSMutableArray *tempArray;

@end

@implementation ABCSort

#pragma mark - selection sort

- (void)selectionSort:(NSMutableArray *)array {
	if (!array || array.count <= 1) return;
	NSUInteger n = array.count;
	for (int i = 0; i < n; ++i) {
		int min = i;
		for (int j = i + 1; j < n; ++j)
			if ([self less:[array[j] intValue] andB:[array[min] intValue]]) min = j;
		[self exchangeInArray:array ofIndex:i toIndex:min];
	}
}

#pragma mark - insertion sort

// replace value
- (void)insertionSort:(NSMutableArray *)array {
	if (!array || array.count <= 1) return;
	int n = (int)array.count;
	for (int i = 1; i < n; ++i) {
		for (int j = i; j > 0 && [self less:[array[j] intValue] andB:[array[j - 1] intValue]]; --j) {
			[self exchangeInArray:array ofIndex:j toIndex:j - 1];
		}
	}
}

// shift right the large value
- (void)insertionSort2:(NSMutableArray *)array {
	if (!array || array.count <= 1) return;
	int n = (int)array.count;
	for (int i = 1; i < n; ++i) {
		int temp = [array[i] intValue];
		int j = 0;
		for (j = i - 1; j >= 0 && [self less:temp andB:[array[j] intValue]]; --j) {
			array[j + 1] = array[j];
		}
		array[j + 1] = @(temp);
	}
}

#pragma mark - shell sort

// optimaized insertion sort by increasing sequence
- (void)shellSort:(NSMutableArray *)array {
	if (!array || array.count <= 1) return;
	int n = (int)array.count;
	int h = 1;
	while (h < n/ 3) h = 3 * h + 1; // 1, 4, 13, 40, 121
	while (h >= 1) {
		for (int i = h; i < n; ++i) {
			for (int j = i; j >= h && [self less:[array[j] intValue] andB:[array[j - h] intValue]]; j -= h) {
				[self exchangeInArray:array ofIndex:j toIndex:j - h];
			}
		}
		h /= 3;
	}
}



#pragma mark - merge

- (void)mergeSort:(NSMutableArray *)array {
	self.tempArray = [NSMutableArray arrayWithCapacity:array.count];
	[self mergeSort:array low:0 high:(int)(array.count - 1)];
}

- (void)mergeSort:(NSMutableArray *)array
			  low:(int)low
			 high:(int)high {

	if (high <= low) return;
	int mid = low + (high - low) / 2;
	[self mergeSort:array low:low high:mid];
	[self mergeSort:array low:mid + 1 high:high];
	[self merge:array low:low mid:mid high:high];

}

- (void)mergeSortBU:(NSMutableArray *)array {

	self.tempArray = [NSMutableArray arrayWithCapacity:array.count];

	int n = (int)array.count;
	for (int size = 1; size < n; size = size << 1) {
		for (int lo = 0; lo < n - size; lo += size << 1) {
			[self merge:array low:lo mid:lo + size - 1 high:MIN(lo + (size << 1) - 1, n - 1)];
		}
	}

}

- (void)merge:(NSMutableArray *)array
		  low:(int)low
		  mid:(int)mid
		 high:(int)high {

	if (!array || array.count <= 1) return;

	int i = low;
	int j = mid + 1;

	for (int k = 0; k < array.count; ++k) {
		self.tempArray[k] = array[k];
	}

	for (int k = low; k <= high; ++k) {
		if (i > mid) {
			array[k] = self.tempArray[j++];
		} else if (j > high) {
			array[k] = self.tempArray[i++];
		} else if ([self less:[self.tempArray[i] intValue] andB:[self.tempArray[j] intValue]]) {
			array[k] = self.tempArray[i++];
		} else {
			array[k] = self.tempArray[j++];
		}
	}

}

#pragma mark - quick sort

- (int)partition:(NSMutableArray *)array
			  low:(int)low
			 high:(int)high {

	int v = [array[low] intValue];
	int i = low, j = high + 1;
	while (true) {
		while ([self less:[array[++i] intValue] andB:v]) {
			if (i == high)  break; 
		}
		while ([self less:v andB:[array[--j] intValue]]) {
			if (j == low)  break;
		}
		if (i >= j) break;
		[self exchangeInArray:array ofIndex:i toIndex:j];
	}
	[self exchangeInArray:array ofIndex:low toIndex:j];
	return j;

}

- (void)partitionSort:(NSMutableArray *)array {

	if (!array || array.count <= 0) return;
	[self partitionSort:array low:0 high:(int)(array.count - 1)];

}

- (void)partitionSort:(NSMutableArray *)array low:(int)low high:(int)high {

	if (high <= low) return;
	int j = [self partition:array low:low high:high];
	[self partitionSort:array low:low high:j - 1];
	[self partitionSort:array low:j + 1 high:high];


}


#pragma mark - general methods

- (BOOL)less:(int)a andB:(int)b {
	return a < b;
}

- (void)exchangeInArray:(NSMutableArray *)arr ofIndex:(int)i toIndex:(int)j {
	int tmp = [arr[i] intValue];
	arr[i] = arr[j];
	arr[j] = @(tmp);
}

- (void)show:(NSArray *)array {
	NSMutableString *log = [NSMutableString stringWithString:@""];
	for (int i = 0; i < array.count; ++i)
		[log appendFormat:@"%@ ", [array[i] stringValue]];
	NSLog(@"%@", log);
}

- (BOOL)isSorted:(NSArray *)arr {
	for (int i = 1; i < arr.count; ++i)
		if ([self less:[arr[i] intValue] andB:[arr[i - 1] intValue]]) return NO;
	return YES;
}

@end
