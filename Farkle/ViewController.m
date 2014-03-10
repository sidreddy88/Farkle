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
#import "GameResultViewController.h"

@interface ViewController () <DieLabelDelegate>
{
    
    IBOutlet DieLabel *label6;
    IBOutlet DieLabel *label1;
    IBOutlet DieLabel *label2;
    IBOutlet DieLabel *label3;
    IBOutlet DieLabel *label4;
    IBOutlet DieLabel *label5;
    NSMutableArray *dice;
    
    int theNumberofRepeatsOfTheNumberOne;
    int theNumberofRepeatsOfTheNumberTwo;
    int theNumberofRepeatsOfTheNumberThree;
    int theNumberofRepeatsOfTheNumberFour;
    int theNumberofRepeatsOfTheNumberFive;
    int theNumberofRepeatsOfTheNumberSix;
    NSMutableArray *scoresOfTheFirstPlayer;
    NSMutableArray *diceThatThePersonWantsToScore;
    int combinedScore;
    
    // I use this array to keep track of which labels the user cannot click on again in the same turn because he has already banked them
    NSMutableArray *diceThatThePersonCannotRollAgain;
    
    

    
    
}

@property (strong, nonatomic) IBOutlet UITextField *totalScore;
@property int turnCounter;
@property (strong, nonatomic) IBOutlet UILabel *userScore;

@property int keepingTrackOfHowManyTimesThePlayerClicksOnTheHelpButton;
@property int score;


@end

@implementation ViewController
@synthesize turnCounter, score, keepingTrackOfHowManyTimesThePlayerClicksOnTheHelpButton, totalScore;


- (IBAction)onFinishButtonPressed:(id)sender {
    
    [self resetGame];
}

- (IBAction)onBankBUttonPressed:(id)sender {
 
    
    
    NSNumber *currentScore = [NSNumber numberWithInt:[self.userScore.text intValue]];
    
    [scoresOfTheFirstPlayer addObject: currentScore];
    
   
    
    
}

- (void) resetGame {
    self.userScore.text = @"Current Score:";
    self.score = 0;
    turnCounter = 0;
    [diceThatThePersonWantsToScore removeAllObjects];
    [dice removeAllObjects];
    [diceThatThePersonCannotRollAgain removeAllObjects];
    label1.backgroundColor = [UIColor orangeColor];
    label2.backgroundColor = [UIColor orangeColor];
    label3.backgroundColor = [UIColor orangeColor];
    label4.backgroundColor = [UIColor orangeColor];
    label5.backgroundColor = [UIColor orangeColor];
    label6.backgroundColor = [UIColor orangeColor];
    

}

- (IBAction)onRollButtonPressed:(id)sender {

    if (turnCounter == 0) {
        [label1 roll];
        [label2 roll];
        [label3 roll];
        [label4 roll];
        [label5 roll];
        [label6 roll];
    } else {
        for (DieLabel *die in self.view.subviews){
            if ([die isKindOfClass:[DieLabel class]]){
                if ([dice containsObject:die]){
                    [diceThatThePersonCannotRollAgain addObject:die];
                    die.backgroundColor = [UIColor blueColor];
                    combinedScore += score;
                    totalScore.text = [NSString stringWithFormat:@" Total Score :%i", combinedScore];
                    score = 0;
                    self.userScore.text = [NSString stringWithFormat:@"Current Score: %i",score];
                } else {
                    [die roll];
                }
            }
        }
    }
    turnCounter++;

}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if ([segue.identifier isEqualToString:@"ResutsOfGame"]) {
        
        if ([segue.destinationViewController isKindOfClass:[GameResultViewController class]]) {
            
            GameResultViewController *tvsc = (GameResultViewController *)segue.destinationViewController;
            
            tvsc.scoreOFPlayer= combinedScore;
            
        }
    }
    
}


- (IBAction)finishedTheTurn:(id)sender {
    
    
}


- (void)didChooseDie:(DieLabel *)dieLabel {
    if ([dice containsObject:dieLabel]){
        if (![diceThatThePersonCannotRollAgain containsObject:dieLabel]){
        dieLabel.backgroundColor = [UIColor orangeColor];
        [dice removeObject:dieLabel];
        [diceThatThePersonWantsToScore removeObject:dieLabel];
        [self playGame: diceThatThePersonWantsToScore];
        self.userScore.text = [NSString stringWithFormat:@"Current Score: %i",score];
        }
        
    } else {
        [dice addObject:dieLabel];
        dieLabel.backgroundColor = [UIColor greenColor];
        [diceThatThePersonWantsToScore addObject:dieLabel];
        [self playGame: diceThatThePersonWantsToScore];
        self.userScore.text = [NSString stringWithFormat:@"Current Score: %i",score];

    }
  
}

-(void) playGame : (NSArray *) array{
    
    DieLabel *die;
    score = 0;
    theNumberofRepeatsOfTheNumberOne = 0;
    theNumberofRepeatsOfTheNumberTwo = 0;
    theNumberofRepeatsOfTheNumberThree = 0;
    theNumberofRepeatsOfTheNumberFour = 0;
    theNumberofRepeatsOfTheNumberFive = 0;
    theNumberofRepeatsOfTheNumberSix = 0;
    
    for (int i = 0; i < array.count; i++){
        die = array[i];
        if ([die.text intValue] == 1) {
            theNumberofRepeatsOfTheNumberOne++;
        } else if ([die.text intValue] == 2){
            theNumberofRepeatsOfTheNumberTwo++;
        } else if ([die.text intValue] == 3){
            theNumberofRepeatsOfTheNumberThree++;
        } else if ([die.text intValue] == 4){
            theNumberofRepeatsOfTheNumberFour++;
        } else if ([die.text intValue] == 5){
            theNumberofRepeatsOfTheNumberFive++;
        } else if ([die.text intValue] == 6){
            theNumberofRepeatsOfTheNumberSix++;
        }
    }
    
    
    
    if (theNumberofRepeatsOfTheNumberOne == 3){
        score += 300;
    } else if (theNumberofRepeatsOfTheNumberOne == 1){
        score += 100;
    }
    if (theNumberofRepeatsOfTheNumberFive == 3){
        score += 500;
    } else if (theNumberofRepeatsOfTheNumberFive == 1){
        score += 50;
    }
    if (theNumberofRepeatsOfTheNumberTwo == 3){
        score += 200;
    }
    if (theNumberofRepeatsOfTheNumberThree == 3){
        score += 300;
    }
    if (theNumberofRepeatsOfTheNumberFour == 3){
        score += 400;
    }
    if (theNumberofRepeatsOfTheNumberSix == 3){
        score += 600;
    }
    
    
}



/*
- (void) playGame {
 
     Scoring Combinations
     1 - If any one dice has the number 1 on it - 100 points
     2 - If any one dice has the number 5 on it - 50 points
     3 - if three of the doe have the number 1 on it - 300 points
     4 - if three of the doe have the number 2 on it - 200 points
     5 - if three of the doe have the number 3 on it - 300 points
     6 - if three of the doe have the number 4 on it - 400 points
     7 - if three of the doe have the number 5 on it - 500 points
     8 - if three of the doe have the number 6 on it - 600 points
 
    
    if ([label1.text intValue] == 1 || [label2.text intValue] == 1 || [label3.text intValue] == 1 || [label4.text intValue] == 1 || [label5.text intValue] == 1||
        [label6.text intValue] == 1 ) {
        score += 100;
    }
    
    else if  ([label1.text intValue] == 5 || [label2.text intValue] == 5 || [label3.text intValue] == 5 || [label4.text intValue] == 5 || [label5.text intValue] == 5|| [label6.text intValue] == 5 ) {
        score += 50;
    }
    
   
    else if ([self doesANumberRepeatACertainNumberOfTimes: 1]){
        score += 300;
        
    }
    
    else if ([self doesANumberRepeatACertainNumberOfTimes: 2]){
        score += 200;
        
    }
    
    else if ([self doesANumberRepeatACertainNumberOfTimes: 3]){
        score += 300;
        
    }
    
    else if ([self doesANumberRepeatACertainNumberOfTimes: 4]){
        score += 400;
        
    }
    
    else if ([self doesANumberRepeatACertainNumberOfTimes: 5]){
        score += 500;
        
    }
    
    else if ([self doesANumberRepeatACertainNumberOfTimes: 6]){
        score += 600;
        
    }
    
    
    
}

    
            
             
             
- (BOOL) doesANumberRepeatACertainNumberOfTimes : (int) number {
    
    NSMutableArray *allLabels = [[NSMutableArray alloc]initWithObjects:label1, label2, label3, label4, label5, label6, nil];
    int numberOftimesANumberOccurs = 0;
    for (UILabel* label in allLabels){
        if ([label.text intValue] == number){
            numberOftimesANumberOccurs++;
        }
        
    }
    if (numberOftimesANumberOccurs >=3){
        return true;
    } else {
        return false;
    }
    
}
*/
- (void)viewDidLoad
{
    [super viewDidLoad];
    dice = [NSMutableArray array];
    diceThatThePersonWantsToScore = [[NSMutableArray alloc]init];
    diceThatThePersonCannotRollAgain = [[NSMutableArray alloc]init];
    

    label1.delegate = self;
    label2.delegate = self;
    label3.delegate = self;
    label4.delegate = self;
    label5.delegate = self;
    label6.delegate = self;
	
}


@end
