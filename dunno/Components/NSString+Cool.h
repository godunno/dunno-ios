//
//  NSString+Cool.h
//  dunno
//
//  Created by fagner feitosa on 1/17/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface NSString (Cool)

- (BOOL) isBlank;

- (BOOL) contains:(NSString*)other;

- (BOOL) endsWith:(NSString*)other;

- (NSString*) encodeURL;

@end
