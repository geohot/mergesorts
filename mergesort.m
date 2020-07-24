#import <Foundation/Foundation.h>

@interface MergeSort: NSObject

- (NSArray *) mergeSortArray:(NSArray *)unsortedArray;
@end

@implementation MergeSort

- (NSArray *) mergeArray:(NSArray *)leftArray rightArray:(NSArray *)rightArray {
    
    NSMutableArray *returnArray = [NSMutableArray array];
    int i = 0, e = 0;
    
    while (i < [leftArray count] && e < [rightArray count]) {
        int leftValue = [[leftArray objectAtIndex:i] intValue];
        int rightValue = [[rightArray objectAtIndex:e] intValue];
        if (leftValue < rightValue) {
            [returnArray addObject: [leftArray objectAtIndex:i++]];
        } else {
            [returnArray addObject: [rightArray objectAtIndex:e++]];
        }
    }
    
    while (i < [leftArray count]) {
        [returnArray addObject: [leftArray objectAtIndex:i++]];
    }
    
    while (e < [rightArray count]) {
        [returnArray addObject: [rightArray objectAtIndex:e++]];
    }
    
    return returnArray;
}


- (NSArray *) mergeSortArray:(NSArray *)unsortedArray {
    
    // Time complexity: Worst case is: O(n * log(n)).
    // Space complexity: O(3 * n) or O(n) due to the 3 NSArrays that are used.

    
    int count = (int)[unsortedArray count];
    if (count < 2) {
        return unsortedArray;
    }
    int middle = count / 2;
    NSArray *leftArray = [unsortedArray subarrayWithRange: NSMakeRange(0, middle)];
    NSArray *rightArray = [unsortedArray subarrayWithRange: NSMakeRange(middle, (count - middle))];
    
    NSArray *returnArray = [self mergeArray: [self mergeSortArray: leftArray] rightArray: [self mergeSortArray: rightArray]];
    return returnArray;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *mergeSorttData = @[@4, @3, @10, @44, @6, @4, @1, @7, @15];
        
        MergeSort *ms = [[MergeSort alloc] init];
        // ms.cycles = 0;
        NSArray *mergeSortedArray = [ms mergeSortArray: mergeSorttData];
        NSLog(@"mergeSortedArray: %@", mergeSortedArray);
    }
    return 0;
}