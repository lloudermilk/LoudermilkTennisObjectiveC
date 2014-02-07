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

//Adapted from init function from Game
-(instancetype) initWithFirstPlayer: (Player *) p1 secondPlayer:(Player *) p2{
    if((self =[super initWithFirstPlayer:p1 secondPlayer:p2]) == nil)
        return nil;
    return self;
}

//Adapted from Game play function and TieBreaker.cpp play function from phase 1
-(Score *) play:(Player *)player{
    //Create a simple bool to determine server, init to false
    bool shouldSwitch = false;
    //Create, allocate space for, and initiaize a new TieBreakerScore object
    TieBreakerScore * score = [[TieBreakerScore alloc] initWithFirstPlayer: self.player1 secondPlayer: self.player2];
    //Have the server serve a point and get the winner.
    //Add the winner's score to the TieBreaker score object.
    [score addScore: [[player serveAPoint] getWinner]];
    //Switch the player, since the initial server only serves once.
    player = [Player otherPlayer:player];
    //Now they play until there is a winner
    while(![score haveAWinner]) {
        //Have the new server play a game and add this to the score
        [score addScore:[[player serveAPoint] getWinner]];
        //determine if they should switch - for the first traversal of the
        //loop they do not switch, since the (what is now second) player must
        //serve twice then switch.
        if (shouldSwitch)
            player = [Player otherPlayer:player];
        //The negation of the bool serves to change servers every two
        //turns, since it is being negated after it is being determined/acted upon.
        shouldSwitch = !shouldSwitch;
        
    }
    //Once there is a winner and the TieBreaker is over, return the score.
    return score;
}
@end
