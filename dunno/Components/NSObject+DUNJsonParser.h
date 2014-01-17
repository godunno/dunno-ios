//
//  NSObject+DUNJsonParser.h
//  dunno
//
//  Created by fagner feitosa on 1/17/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DCKeyValueObjectMapping.h"
#import "DCParserConfiguration.h"
#import "DCObjectMapping.h"
#import "DCArrayMapping.h"

#import "DUNJsonParseable.h"

@interface NSObject (DUNJsonParser)

+ (id) instanceFromJsonDictionary:(NSDictionary*)jsonDic;

+ (DCParserConfiguration*)defaultParserConfig;

+ (DCParserConfiguration*) addToConfig:(DCParserConfiguration**)config mappings:(Class<DUNJsonParseable>)parseableClass;

@end
