//
//  DUNOrganization.h
//  dunno
//
//  Created by fagner feitosa on 1/16/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+DUNJsonParser.h"

@interface DUNOrganization : NSObject<DUNJsonParseable>

@property (nonatomic, copy) NSString *entityId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *pictureURLString;

+ (instancetype)newFromJsonDictionary:(NSDictionary*)jsonDict;

@end
