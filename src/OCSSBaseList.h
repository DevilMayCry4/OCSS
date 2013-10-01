//
//  CSSBaseList.h
//  AttributedImages
//
//  Created by Yusuke Kawasaki on 2013/09/30.
//  Copyright (c) 2013 Kawanet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OCSSBaseList : NSObject <NSFastEnumeration>

@property (readonly) NSMutableArray *list;
@property (readonly) NSString *cssText;
@property (readonly) NSUInteger length;

- (id)objectAtIndexedSubscript: (NSUInteger)index;

@end
