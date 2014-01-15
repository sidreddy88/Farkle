//
//  ViewController.m
//  Farkle
//
//  Created by Siddharth Sukumar on 1/15/14.
//  Copyright (c) 2014 Siddharth Sukumar. All rights reserved.
//

#import "ViewController.h"
#import "DieLabel.h"
#import "DieLabelDelegate.h"

@interface ViewController () <DieLabelDelegate>
{
    
    IBOutlet DieLabel *label6;
    IBOutlet DieLabel *label1;
    IBOutlet DieLabel *label2;
    IBOutlet DieLabel *label3;
    IBOutlet DieLabel *label4;
    IBOutlet DieLabel *label5;
    NSMutableArray *dice;
    
}
@property int turnCounter;

@end

@implementation ViewController
@synthesize turnCounter;


- (IBAction)onRollButtonPressed:(id)sender {

    if (turnCounter == 0) {
        [label1 roll];
        [label2 roll];
        [label3 roll];
        [label4 roll];
        [label5 roll];
        [label6 roll];
    } else {
        for (DieLabel *die in dice)
            [die roll];
    }
    turnCounter++;

}

- (void)didChooseDie:(DieLabel *)dieLabel {
    [dice addObject:dieLabel];
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    dice = [NSMutableArray array];

    label1.delegate = self;
    label2.delegate = self;
    label3.delegate = self;
    label4.delegate = self;
    label5.delegate = self;
    label6.delegate = self;
	
}

@end
