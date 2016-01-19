//
//  CustomView.m
//  ReuseViewInStroyboard
//
//  Created by Mars on 16/1/19.
//  Copyright © 2016年 Mars. All rights reserved.
//

#import "CustomView.h"
#import "UIView+NibLoading.h"

@implementation CustomView

- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder{
    BOOL theThingThatGotLoadedWasJustAPlaceholder = ([[self subviews] count] == 0);
    if (theThingThatGotLoadedWasJustAPlaceholder){
//        NSBundle *mainBundle = [NSBundle mainBundle];
//        NSArray *loadedViews = [mainBundle loadNibNamed:@"CustomView" owner:nil options:nil];
//        CustomView * loadedView =   [loadedViews firstObject];

        CustomView * loadedView = [CustomView loadFromNib];
        
        loadedView.frame = self.frame;
        loadedView.autoresizingMask = self.autoresizingMask;
        loadedView.hidden = self.hidden;
        loadedView.alpha = self.alpha;
        loadedView.translatesAutoresizingMaskIntoConstraints =  self.translatesAutoresizingMaskIntoConstraints;
        
        for (NSLayoutConstraint *constraint in self.constraints){
            id firstItem = constraint.firstItem;
            if (firstItem == self){
                firstItem = loadedView;
            }
            id secondItem = constraint.secondItem;
            if (secondItem == self){
                secondItem = loadedView;
            }
            [loadedView addConstraint:[NSLayoutConstraint constraintWithItem:firstItem
                                          attribute:constraint.firstAttribute
                                          relatedBy:constraint.relation
                                             toItem:secondItem
                                          attribute:constraint.secondAttribute
                                         multiplier:constraint.multiplier
                                           constant:constraint.constant]];
        }
        
        return loadedView;
    }
    return self;
}

- (IBAction)btnClicked:(id)sender{
    NSLog(@"按钮被点击了。。。。。。");
}

@end
