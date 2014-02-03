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

-(instancetype) initWithFirstPlayer: (Player *) p1 secondPlayer: (Player *) p2{
    if( (self = [super initWithFirstPlayer:p1 secondPlayer:p2   ]) == nil)
        return nil;
    return self;
}

-(BOOL) haveAWinner{
    return (self.player1Score >= 7 || self.player2Score >= 7) && abs( self.player1Score - self.player2Score) >= 2;
}

-(NSString *) description{
    return [NSString stringWithFormat:@"\n\n(tie breaker %d - %d)\n\n", self.player1Score, self.player2Score ];
}

@end
