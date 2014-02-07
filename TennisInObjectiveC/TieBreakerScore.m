//
//  TieBreakerScore.m
//  TennisInObjectiveC
//
//  Created by Lauryn Loudermilk on 2/2/14.
//  Copyright (c) 2014 Ali Kooshesh. All rights reserved.
//

#import "TieBreakerScore.h"
#import "Score.h"
#import "Player.h"

@implementation TieBreakerScore

//Adapted from Game init function
-(instancetype) initWithFirstPlayer: (Player *) p1 secondPlayer: (Player *) p2{
    if( (self = [super initWithFirstPlayer:p1 secondPlayer:p2   ]) == nil)
        return nil;
    return self;
}

//Adapted from tennis.cpp and TieBreakerScore.cpp from phase 1
-(BOOL) haveAWinner{
    return (self.player1Score >= 7 || self.player2Score >= 7) && abs( self.player1Score - self.player2Score) >= 2;
}

-(NSString *) description{
    //Start by creating a new string
    //Allocate the space and initialize it with format to display the scores of the
    //tiebreaker game for each player
    NSString * str = [[NSString alloc] initWithFormat: @"(tie breaker %d - %d)", self.player1Score, self.player2Score];
    //return the final string
    return str;
}

@end