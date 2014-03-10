//
//  GameResultViewController.m
//  Farkle
//
//  Created by Siddharth Sukumar on 1/16/14.
//  Copyright (c) 2014 Siddharth Sukumar. All rights reserved.
//

#import "GameResultViewController.h"

@interface GameResultViewController ()
@property (strong, nonatomic) IBOutlet UITextField *textDisplayingScore;

@end

@implementation GameResultViewController

@synthesize textDisplayingScore, scoreOFPlayer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    textDisplayingScore.text = [NSString stringWithFormat:@"Score: %i", scoreOFPlayer];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
