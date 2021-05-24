#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    NSMutableString *result = [[NSMutableString alloc] init];
    NSMutableString *str1 = [[NSMutableString alloc] initWithString:string1];
    NSMutableString *str2 = [[NSMutableString alloc] initWithString:string2];
    
    //NSRange range = [text rangeOfString:@"", options:0 range: searchRange];
    NSRange range = NSMakeRange(0, 1);
    int cas=0;
    
    while ((int)[str1 length] > 0 && (int)[str2 length] > 0) {
    
        unichar chr1 = [str1 characterAtIndex:0];
        unichar chr2 = [str2 characterAtIndex:0];
    
        if (chr1<=chr2) {
            [result appendString: [str1 substringWithRange:range]];
            [str1 deleteCharactersInRange: range];
            cas=1;
        }
        else{
            [result appendString: [str2 substringWithRange:range]];
            [str2 deleteCharactersInRange: range];
            cas =2;
        }
    }
    if (cas == 2) {
        while ((int)[str1 length] > 0){
            [result appendString: [str1 substringWithRange:range]];
            [str1 deleteCharactersInRange: range];
        }
    }
    if (cas == 1) {
        while ((int)[str2 length] > 0){
            [result appendString: [str2 substringWithRange:range]];
            [str2 deleteCharactersInRange: range];
        }
    }
    return result;
}

@end
