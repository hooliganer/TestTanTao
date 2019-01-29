//
//  TestOCManager.m
//  TestTanTao
//
//  Created by tantao on 2018/11/29.
//  Copyright © 2018 tantao. All rights reserved.
//

#import "TestOCManager.h"

@implementation TestOCManager

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"asd" : [VV class]};
}

+ (void)loggg{
    NSString * coin = @"2323.2352123";
    double value = [coin doubleValue];
    NSLog(@"%.2ff",value);
}

+ (void)testBlock:(void(^)(void))block{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        block();
    });
    
}


@end


@implementation VV
+ (NSDictionary *)mj_objectClassInArray{
    return @{@"vv" : [SS class]};
}
@end


@implementation SS

@end
