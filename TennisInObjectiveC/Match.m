//
//  Match.m
//  TennisInObjectiveC
//
//  Created by Lauryn Loudermilk on 2/2/14.
//  Copyright (c) 2014 Ali Kooshesh. All rights reserved.
//

#import "Match.h"
#import "MatchScore.h"
#import "Set.h"
#import "SetScore.h"
#import "Player.h"

@implementation Match

//Adapted from Game init function
-(instancetype) initWithFirstPlayer: (Player *) p1 secondPlayer:(Player *) p2{
    if((self = [super initWithFirstPlayer:p1 secondPlayer:p2]) == nil )
        return nil;
    return self;
}

//Adapted from Game play and Match.cpp from phase 1
-(Score *) play:(Player *)player{
    //Create a new MatchScore object and init it with both players
    MatchScore *matchScore = [[MatchScore alloc] initWithFirstPlayer:self.player1 secondPlayer:self.player2];
    
    //Play sets until we have a winner
    while(![matchScore haveAWinner]) {
        //In each set create a new Set object initialized with both players
        Set *set = [[Set alloc] initWithFirstPlayer:self.player1 secondPlayer:self.player2];
        //Create a SetScore object to hold the scores, and call the play method
        //to capture the result of the set
        SetScore *setScore = (SetScore *)[set play: player];
        //Add the newly created setScore to the matchScore array
        [matchScore addScore: setScore];
        //And switch servers
        player = [Player otherPlayer:player];
        
    }
    //After all sets have been played and there is a winner, return the final MatchScore
    return matchScore;
}
@end