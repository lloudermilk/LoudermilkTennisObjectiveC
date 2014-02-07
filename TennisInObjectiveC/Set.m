//
//  Set.m
//  TennisInObjectiveC
//
//  Created by Lauryn Loudermilk on 2/2/14.
//  Copyright (c) 2014 Ali Kooshesh. All rights reserved.
//

#import "Set.h"
#import "SetScore.h"
#import "Game.h"
#import "GameScore.h"
#import "TieBreaker.h"
#import "TieBreakerScore.h"

@implementation Set

//Adapted from Game.m
-(instancetype) initWithFirstPlayer: (Player *) p1 secondPlayer:(Player *) p2
{
    if( (self = [super initWithFirstPlayer:p1 secondPlayer:p2] ) == nil )
        return nil;
    return self;
}

//Adapted from Play function in Set.cpp from Phase 1
-(Score *) play:(Player *)player
{
    //Create a new SetScore object to hold the result of the set and alloc/init it
    SetScore *setScore = [[SetScore alloc] initWithFirstPlayer:self.player1 secondPlayer:self.player2];
    
    //Play until a player wins the set
    while(![setScore haveAWinner]) {
        //Create a new Game object and alloc/init it
        Game *game = [[Game alloc] initWithFirstPlayer:self.player1 secondPlayer:self.player2];
        //And a Score object to hold the score of the set, then play the game
        Score *gameScore = [game play:player];
        //Add the score of the winner to the setScore object
        [setScore addScore: [gameScore getWinner]];
        //And switch servers
        player = [Player otherPlayer:player];
        //We use the shouldPlayATieBreaker function to determine if a tieBreaker is needed
        if ([setScore shouldPlayATieBreaker]){
            //If it is we create a new TieBreaker object and alloc/init it
            TieBreaker *tiebreaker = [[TieBreaker alloc] initWithFirstPlayer:self.player1 secondPlayer:self.player2];
            //Add the score of the winner to the setScore object after playing the game
            [setScore addTieBreakerScore: (TieBreakerScore *)[tiebreaker play:(player)]];
            //and break to ensure we return after we have finished the tie breaker
            break;
        }
    }
    //At the end return the final set score including the tiebreaker if it exists
    return setScore;
}

@end