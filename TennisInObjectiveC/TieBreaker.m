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


-(instancetype) initWithFirstPlayer: (Player *) p1 secondPlayer:(Player *) p2{
    if((self =[super initWithFirstPlayer:p1 secondPlayer:p2]) == nil)
        return nil;
    return self;
}

-(Score *) play:(Player *)player{
    bool shouldSwitch = false;
    PointScore *score =(PointScore *) [player serveAPoint];
    [score addScore: [score getWinner]];
    player = [Player otherPlayer:player];
    while(![score haveAWinner]) {
        [score addScore: [score getWinner]];
        if (shouldSwitch)
            player = [Player otherPlayer:player];
        shouldSwitch = !shouldSwitch;
        
    }
    return score;
}
@end
