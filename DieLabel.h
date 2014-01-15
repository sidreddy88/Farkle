//
//  DieLabel.h
//  Farkle
//
//  Created by Siddharth Sukumar on 1/15/14.
//  Copyright (c) 2014 Siddharth Sukumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DieLabelDelegate.h"


@interface DieLabel : UILabel
- (void) roll;
@property id<DieLabelDelegate> delegate;

@end
