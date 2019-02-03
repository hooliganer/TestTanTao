//
//  TestOCManager.h
//  TestTanTao
//
//  Created by tantao on 2018/11/29.
//  Copyright © 2018 tantao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension/MJExtension.h>


NS_ASSUME_NONNULL_BEGIN


@interface VV : NSObject

@property (nonatomic,copy)NSArray * ss;

@end

@interface SS : NSObject

@property (nonatomic,strong)VV * vv;

@end

@interface TestOCManager : NSObject

@property (nonatomic,strong)NSArray * asd;

+ (void)loggg;
+ (void)testBlock:(void(^)(void))block;



@end




NS_ASSUME_NONNULL_END
