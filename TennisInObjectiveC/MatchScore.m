//
//  MatchScore.m
//  TennisInObjectiveC
//
//  Created by Lauryn Loudermilk on 2/2/14.
//  Copyright (c) 2014 Ali Kooshesh. All rights reserved.
//

#import "MatchScore.h"
#import "SetScore.h"
#import "Score.h"

@implementation MatchScore

//Adapted from init function in GameScore
-(instancetype) initWithFirstPlayer: (Player *) p1 secondPlayer: (Player *) p2{
    if((self = [super initWithFirstPlayer:p1 secondPlayer:p2]) == nil)
        return nil;
    //The only difference is the allocation of our score array
    //which must be done when initializing the MatchScore
    self.scores = [[NSMutableArray alloc] init];
    return self;
}

-(void) addScore: (Score *) score{
    //Similar to the c++ version
    //We are adding the score object typecasted as a SetScore
    //to the array of scores using the addObject method
    [self.scores addObject: (SetScore *)score];
    //Here we increment the score of the player who won the set
    score.getWinner == self.player1 ? self.player1Score++ : self.player2Score++;
    //And then we increment the set number to keep
    //track of how many sets were played
    self.setNumber++;
}

//Same as from tennis.cpp and phase 1
-(BOOL) haveAWinner{
    return (self.player1Score == 3 || self.player2Score == 3);
}

-(NSString *) description {
    //Init the string to the first line we must print; the header.
    NSString * str = @"\nSet No.   Player A     Player B\n";
    //Then we loop through the scores array as many times
    //as needed to get the results of each set. This is
    //simply _setNumber of times.
    for( int i = 0; i < _setNumber; i++ ){
        //I create a temp string that contains the set number and score results.
        //Tiebreaker scores are taken care of in the SetScore description.
        NSString * temp = [[NSString alloc] initWithFormat:@"%d         %@\n", i+1, [self.scores[i] description]];
        //I add this temp string with the line break to the initial string
        str = [str stringByAppendingString:temp];
        //And clear temp, just for good measure.
        temp = nil;
    } //This is repeated for every set.

    //At the end I determine the winner and add the final row of the output.
    //It's a simple if/else for both possible outcomes.
    if(self.player1Score > self.player2Score)
        str = [str stringByAppendingString: [[NSString alloc] initWithFormat: @"Player A wins the match %d sets to %d\n", self.player1Score, self.player2Score]];
    else
       str = [str stringByAppendingString: [[NSString alloc] initWithFormat: @"Player B wins the match %d sets to %d\n", self.player2Score, self.player1Score]];
    
    //Then I return the final string
    return str;
}

@end