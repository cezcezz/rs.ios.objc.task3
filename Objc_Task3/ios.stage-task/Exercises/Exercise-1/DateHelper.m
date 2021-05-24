#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
    if (monthNumber>=1 && monthNumber<=12 ) {        
        NSDateFormatter *month = [[NSDateFormatter alloc] init];
        return [month monthSymbols][--monthNumber];
    }
    else{
        return nil;
    }
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSDateFormatter *temp = [[NSDateFormatter alloc] init];
    [temp setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];

     NSDate *date1 = [temp dateFromString:date];
    
    [temp setDateFormat:@"dd"];
    NSString *convertedString = [temp stringFromDate:date1];
    
    long res;
   
    
    return (res =[convertedString longLongValue]);

}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
 
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    [dateFormatter setDateFormat:@"EE"];
    
    NSString *convertedString = [dateFormatter stringFromDate:date];
   
    return convertedString;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
     
    NSDate *current = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *cmp = [calendar components:NSCalendarUnitDay fromDate:date toDate:current options:0];
   // NSLog(@"%@", cmp);
    int day = (int)[cmp day];
    
    if ( day > 7 || day< -7) {
        return NO;
    }else
        return YES;
}

@end
