//
//  NSString+Cool.h
//  sambanorio
//
//  Created by fagner feitosa on 11/6/13.
//  Copyright (c) 2013 mobo.fagner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Cool)

- (BOOL) isBlank;

- (BOOL) contains:(NSString*)other;

- (BOOL) endsWith:(NSString*)other;

- (NSString*) encodeURL;

@end
