//
//  CSSSelectorList.h
//  AttributedImages
//
//  Created by Yusuke Kawasaki on 2013/09/30.
//  Copyright (c) 2013 Kawanet. All rights reserved.
//

#import "OCList.h"
#import "OCXSelector.h"

@interface OCXSelectorList : OCListCSS

- (void) addSelector:(OCXSelector *)selector;

@end