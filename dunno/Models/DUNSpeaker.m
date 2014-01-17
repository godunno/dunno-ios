//
//  DUNSpeaker.m
//  dunno
//
//  Created by fagner feitosa on 1/17/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//

#import "DUNSpeaker.h"

@implementation DUNSpeaker

+ (instancetype)newFromJsonDictionary:(NSDictionary*)jsonDict
{
  return [self instanceFromJsonDictionary:jsonDict];
}

+ (NSDictionary*)mappings
{
  return @{@"uid" : @"entityId",
           @"picture" : @"pictureURLString",};
}

@end
