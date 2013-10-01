//
//  OCSSValue.m
//  AttributedImages
//
//  Created by Yusuke Kawasaki on 2013/09/30.
//  Copyright (c) 2013 Kawanet. All rights reserved.
//

#import "OCSSValue.h"

@implementation OCSSValue

- (instancetype) initWithString:(NSString *)value {
    self = self.init;
    self.value = value;
    return self;
}

@end
