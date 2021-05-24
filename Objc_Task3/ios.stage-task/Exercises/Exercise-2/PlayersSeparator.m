#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    
    int count =0;
    int size = (int)ratingArray.count;
    
    if (ratingArray.count <= 2) {
        return 0;
    }
    
    for (int i=0; i<size-2; i++) {
        
        for (int j =i+1; j<size-1; j++) {
            
            for (int k=j+1; k<size; k++) {
                
                if ([ratingArray[i] intValue] < [ratingArray[j] intValue] &&
                    [ratingArray[j] intValue] < [ratingArray[k] intValue]) {
                    count++;
                }
                
                    
                if ([ratingArray[i] intValue] > [ratingArray[j] intValue] &&
                    [ratingArray[j] intValue] > [ratingArray[k] intValue]) {
                    count++;
                }
            }
        }
    }
    
    
    
    return count;
}

@end
