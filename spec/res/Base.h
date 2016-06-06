//
//  Base.h
//
//  Created on <%= Time.now.strftime("%Y-%m-%d") %>
//  Copyright (c) <%= Time.now.strftime("%Y") %>. All rights reserved.
//  Generated by Kilza https://github.com/Jaspion/Kilza
//

#import <Foundation/Foundation.h>

@class Spa_ce;
@class Special;
@class Obj;

@interface Base : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString * _myid;
@property (nonatomic, strong) NSString * str;
@property (nonatomic, strong) NSNumber * num;
@property (nonatomic, strong) NSNumber * flo;
@property (nonatomic, strong) NSNumber * boo;
@property (nonatomic, strong) Spa_ce * spa_ce;
@property (nonatomic, strong) Special * special;
@property (nonatomic, strong) NSMutableArray * arrdouble;
@property (nonatomic, strong) NSMutableArray * arrnum;
@property (nonatomic, strong) NSMutableArray * arrstr;
@property (nonatomic, strong) NSMutableArray * arrboo;
@property (nonatomic, strong) NSMutableArray * arrnull;
@property (nonatomic, strong) Obj * obj;
@property (nonatomic, strong) NSMutableArray * arrobj;

+ (Base *)modelWithDictionary:(NSDictionary *)dict;
+ (Base *)modelWithString:(NSString *)json;

- (instancetype)initWithString:(NSString *)json;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
