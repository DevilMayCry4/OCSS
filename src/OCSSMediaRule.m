//
//  AIMedia.m
//  AttributedImages
//
//  Created by Yusuke Kawasaki on 2013/09/29.
//  Copyright (c) 2013 Kawanet. All rights reserved.
//

#import "OCSSMediaRule.h"
#import "OCSS.h"

@implementation OCSSMediaRule

- (NSString *)cssText {
    NSString *text = [NSString stringWithFormat:@"@media %@ {\n%@}\n", self.media, self.cssRules.cssText];
    return text;
}

@end
