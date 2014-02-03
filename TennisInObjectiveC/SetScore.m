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



-(instancetype) initWithFirstPlayer: (Player *) p1 secondPlayer: (Player *) p2{
    if((self = [super initWithFirstPlayer:p1 secondPlayer:p2]) == nil)
        return nil;
    return self;
}

-(BOOL) haveAWinner{
    return (self.player1Score >= 6 || self.player2Score >= 6) && abs( self.player1Score - self.player2Score) >= 2;
}

-(BOOL) shouldPlayATieBreaker{
    return (self.player1Score == 6 && self.player2Score == 6);
}

-(void) addTieScore: (TieBreakerScore *) score{
    addScore: [score getWinner];
    self.tieScore = score;
}

-(NSString *) description{
    NSLog(@"SetScore... printing begins.");
    NSLog(@"p1 score = %d", self.player1Score);
    NSLog(@"p2 score = %d", self.player2Score);
    NSLog(@"SetScore... printing ends.");
    
    return [NSString stringWithFormat:@"\n\nplayer1 score = %d\nplayer2 score = %d\n\n", self.player1Score, self.player2Score ];
    
    if (_tieScore != nil)
        [_tieScore description];
}

@end
