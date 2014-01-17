//
//  DUNSpeaker.h
//  dunno
//
//  Created by fagner feitosa on 1/17/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DUNSpeaker : NSObject

@property (nonatomic, copy) NSString *entityId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *bio;
@property (nonatomic, copy) NSString *pictureURLString;

+ (instancetype)newFromJsonDictionary:(NSDictionary*)jsonDict;

@end
