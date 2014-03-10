//
//  DieLabel.m
//  Farkle
//
//  Created by Siddharth Sukumar on 1/15/14.
//  Copyright (c) 2014 Siddharth Sukumar. All rights reserved.
//

#import "DieLabel.h"


@implementation DieLabel
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(IBAction) labelWaTapped:(id) sender {
    [delegate didChooseDie:self];
    
   
    
}
- (void) roll {
    int number = arc4random() % 6 + 1;
    
    self.text = [NSString stringWithFormat:@"%i", number];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
