//
//  SetScore.m
//  TennisInObjectiveC
//
//  Created by Lauryn Loudermilk on 2/2/14.
//  Copyright (c) 2014 Ali Kooshesh. All rights reserved.
//

#import "SetScore.h"
#import "TieBreakerScore.h"

@implementation SetScore

//Adapted from init function in Game
-(instancetype) initWithFirstPlayer: (Player *) p1 secondPlayer: (Player *) p2{
    if((self = [super initWithFirstPlayer:p1 secondPlayer:p2]) == nil)
        return nil;
    return self;
}

//Adapted from tennis.cpp and SetScore.cpp from phase 1
-(BOOL) haveAWinner{
    return (self.player1Score >= 6 || self.player2Score >= 6) && abs( self.player1Score - self.player2Score) >= 2;
}

//Adapted from tennis.cpp and SetScore.cpp from phase 1
-(BOOL) shouldPlayATieBreaker{
    return (self.player1Score == 6 && self.player2Score == 6);
}

//Adapted from tennis.cpp and SetScore.cpp from phase 1
-(void) addTieBreakerScore: (TieBreakerScore *) score{;
    //This adds the score of the tiebreaker's winner to the SetScore
    //using the self object
    [self addScore: [score getWinner]];
    //and then it changes the tieBreakerScore to the score handed to it
    self.tieBreakerScore = score;
}

-(NSString *) description{
    //Start by creating a new string object and have it contian the scores of both
    //players, seperated by whitespace for readability
    NSString * str = [[NSString alloc] initWithFormat:@"%d           %d  ",self.player1Score, self.player2Score];
    //This determines if a tie breaker was played. If it was the tieBreakerScore
    //is concatenated to the end of the line and returned at the end using it's own description method
    if(self.tieBreakerScore != nil)
        str = [str stringByAppendingString:[[NSString alloc] initWithFormat:@"%@",[self.tieBreakerScore description]]];
    //return the final string
    return str;
}

@end
