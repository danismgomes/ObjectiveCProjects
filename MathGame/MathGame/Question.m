//
//  AdditionQuestion.m
//  MathGame
//
//  Created by Danielle Gomes on 2019-08-06.
//  Copyright © 2019 Danielle Gomes. All rights reserved.
//

#import "Question.h"
#import "InputHandler.h"

@implementation Question

- (instancetype)initWithController: (NSString *) operationType
{
    if ((self = [super init])) {
        _number1 = arc4random_uniform(91) + 10;
        _number2 = arc4random_uniform(91) + 10;
        
        if ([operationType isEqualToString:@"+"]) {
            _answer = _number1 + _number2;
        } else if ([operationType isEqualToString:@"-"]) {
            _answer = _number1 - _number2;
        } else if ([operationType isEqualToString:@"*"]) {
            _answer = _number1 * _number2;
        } else {// ([operationType isEqualToString:@"/"])
            _answer = _number1 / _number2;
        }
        
        _question = [NSString stringWithFormat:@"%ld %@ %ld ?", self.number1, operationType, self.number2];
        _startTime = [NSDate date];
        _userInput = getUserInput(_question);
    }
    
    return self;
}

+ (NSInteger) transformStringIntoInteger: (NSString*) aString
{
    NSInteger ld;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *num = [formatter numberFromString:aString];
    
    if (num == NULL) {
        NSLog(@"It is not a number.");
        ld = 0;
    } else {
        ld = num.integerValue;
    }
    
    return ld;
}

- (BOOL) isAnswer
{
    if (_answer == [Question transformStringIntoInteger:_userInput]) {
        NSLog(@"Right!");
        return YES;
    } else {
        NSLog(@"Wrong!");
        return NO;
    }
}

// overriding getter
- (NSString *) userInput {
    _endTime = [NSDate date];
    return _userInput;
}

- (NSTimeInterval) answerTime
{
    return [_endTime timeIntervalSinceDate:_startTime];
}

@end
