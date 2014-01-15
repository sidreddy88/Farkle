//
//  DieLabelDelegate.h
//  Farkle
//
//  Created by Siddharth Sukumar on 1/15/14.
//  Copyright (c) 2014 Siddharth Sukumar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DieLabel.h"

@protocol DieLabelDelegate

-(void)didChooseDie:(id)dieLabel;

@end
