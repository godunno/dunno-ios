//
//  DUNLocation.m
//  dunno
//
//  Created by fagner feitosa on 1/16/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//

#import "DUNLocation.h"

@implementation DUNLocation

+ (instancetype)newFromJsonDictionary:(NSDictionary*)jsonDict
{
  return [self instanceFromJsonDictionary:jsonDict];
}

+ (NSDictionary*)mappings
{
  return @{@"id" : @"entityId"};
}


@end
