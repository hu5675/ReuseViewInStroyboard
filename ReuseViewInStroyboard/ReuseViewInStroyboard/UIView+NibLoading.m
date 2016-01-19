//
//  UIView+NibLoading.m
//  ReuseViewInStroyboard
//
//  Created by Mars on 16/1/19.
//  Copyright © 2016年 Mars. All rights reserved.
//

#import "UIView+NibLoading.h"

@implementation UIView (NibLoading)

+ (id)loadFromNib{
    NSString* nibName = NSStringFromClass([self class]);
    NSArray* elements = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
    for (NSObject* anObject in elements) {
        if ([anObject isKindOfClass:[self class]]) {
            return anObject;
        }
    }
    return nil;
}

@end
