//
//  Set.m
//  TennisInObjectiveC
//
//  Created by Lauryn Loudermilk on 2/2/14.
//  Copyright (c) 2014 Ali Kooshesh. All rights reserved.
//

#import "Set.h"
#import "SetScore.h"
#import "PointScore.h"
#import "Game.h"
#import "GameScore.h"
#import "TieBreaker.h"
#import "TieBreakerScore.h"
#import "Player.h"

@implementation Set

-(instancetype) initWithFirstPlayer: (Player *) p1 secondPlayer:(Player *) p2
{
    if( (self = [super initWithFirstPlayer:p1 secondPlayer:p2] ) == nil )
        return nil;
    return self;
}

-(Score *) play:(Player *)player
{
    SetScore *setScore = [[SetScore alloc] initWithFirstPlayer:self.player1 secondPlayer:self.player2];
    
    while(![setScore haveAWinner]) {
        
        Game *game = [[Game alloc] initWithFirstPlayer:self.player1 secondPlayer:self.player2];
        
        Score *gameScore = [game play:(player)];
        
        [setScore addScore: [gameScore getWinner]];
        
        game = nil;
        
        player = [Player otherPlayer:player];
        
        if ([setScore shouldPlayATieBreaker]){
            
            TieBreaker *tie = [[TieBreaker alloc] initWithFirstPlayer:self.player1 secondPlayer:self.player2];
            
            [setScore addTieScore: (TieBreakerScore *)[tie play:(player)]];
            
            break;
        }
        
    }
    return setScore;
}

@end