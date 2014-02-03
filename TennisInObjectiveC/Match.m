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

-(instancetype) initWithFirstPlayer: (Player *) p1 secondPlayer:(Player *) p2{
    if((self = [super initWithFirstPlayer:p1 secondPlayer:p2]) == nil )
        return nil;
    return self;
}

-(Score *) play:(Player *)player{
    MatchScore *matchScore = [[MatchScore alloc] initWithFirstPlayer:self.player1 secondPlayer:self.player2];
    
    while(![matchScore haveAWinner]) {
        Set *set = [[Set alloc] initWithFirstPlayer:self.player1 secondPlayer:self.player2];
        Score *setScore = [set play:(player)];
        [matchScore addScore: setScore];
        player = [Player otherPlayer:player];
        
    }
    return matchScore;
}
@end