//
//  GameScore.m
//  TennisInObjectiveC
//
//  Created by Ali Kooshesh on 1/22/14.
//  Copyright (c) 2014 Ali Kooshesh. All rights reserved.
//

#import "GameScore.h"

@implementation GameScore

-(instancetype) initWithFirstPlayer: (Player *) p1 secondPlayer: (Player *) p2{
    if((self = [super initWithFirstPlayer:p1 secondPlayer:p2]) == nil)
        return nil;
    return self;
}

-(BOOL) haveAWinner{
    return (self.player1Score >= 4 || self.player2Score >= 4) && abs( self.player1Score - self.player2Score) >= 2;
}

@end