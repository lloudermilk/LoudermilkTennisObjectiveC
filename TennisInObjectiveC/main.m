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
#import "Game.h"
#import "GameScore.h"
#import "Match.h"
#import "MatchScore.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        srandom(19);
        Player *player1 = [[Player alloc] initWithProbability: 50];
        Player *player2 = [[Player alloc] initWithProbability: 70];
        
        Match *match = [[Match alloc] initWithFirstPlayer:player1 secondPlayer:player2];
        MatchScore *matchScore = (MatchScore* )[match play: player1];
        NSLog(@"%@", matchScore);
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
