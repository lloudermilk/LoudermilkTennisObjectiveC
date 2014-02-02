//
//  TieBreaker.m
//  TennisInObjectiveC
//
//  Created by Lauryn Loudermilk on 2/2/14.
//  Copyright (c) 2014 Ali Kooshesh. All rights reserved.
//


#import "TieBreaker.h"
#import "TieBreakerScore.h"
#import "PointScore.h"
#import "Player.h"

@implementation TieBreaker


-(instancetype) initWithFirstPlayer: (Player *) p1 secondPlayer:(Player *) p2
{
    if( (self = [super initWithFirstPlayer:p1 secondPlayer:p2] ) == nil )
        return nil;
    return self;
}

-(Score *) play:(Player *)player
{
    TieBreakerScore *tieScore = [[TieBreakerScore alloc] initWithFirstPlayer:self.player1 secondPlayer:self.player2];
    
    // might be wrong, placement of (PointScore *)
    // tieScore->addScore(reinterpret_cast<PointScore *>(p->serveAPoint())->getWinner());
    [tieScore addScore: [(PointScore *)[player serveAPoint] getWinner]];
    
    player = [Player otherPlayer:player];
    
    
    while(![tieScore haveAWinner]) {
        
        [tieScore addScore: [(PointScore *)[player serveAPoint] getWinner]];
        int val = 1;
        if (val % 2 == 0)
            player = [Player otherPlayer:player];
        val++;
        
    }
    return tieScore;
}
@end
