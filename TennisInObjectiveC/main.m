//
//  main.m
//  TennisInObjectiveC
//
//  Created by Ali Kooshesh on 1/22/14.
//  Copyright (c) 2014 Ali Kooshesh. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "Player.h"
#import "Match.h"
#import "MatchScore.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        srandom(99);
        Player *player1 = [[Player alloc] initWithProbability: 70];
        Player *player2 = [[Player alloc] initWithProbability: 70];
        
        //The following three lines are the only thing altered.
        //A match is played instead of a game and a matchscore is
        //used instead of a gamescore
        Match *match = [[Match alloc] initWithFirstPlayer:player1 secondPlayer:player2];
        MatchScore *matchScore = (MatchScore* )[match play: player1];
        NSLog(@"%@", matchScore);
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
