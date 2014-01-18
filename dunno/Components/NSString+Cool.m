//
//  NSString+Cool.m
//  dunno
//
//  Created by fagner feitosa on 1/17/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//
#import "NSString+Cool.h"

@implementation NSString (Cool)

- (BOOL) isBlank
{
  return (self == nil || [self isEqualToString:@""]);
}

- (BOOL) contains:(NSString*)other
{
  return ([self rangeOfString:other].location != NSNotFound);
}

- (BOOL) endsWith:(NSString*)other
{
  return [self hasSuffix:other];
}

- (NSString*) encodeURL
{
  return [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
  
}
@end
