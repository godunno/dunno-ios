//
//  DUNJsonParseable.h
//  dunno
//
//  Created by fagner feitosa on 1/17/14.
//  Copyright (c) 2014 dunno. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DUNJsonParseable <NSObject>
@required
+ (NSDictionary*)mappings;
@end
