//
//  MatchScore.m
//  TennisInObjectiveC
//
//  Created by Lauryn Loudermilk on 2/2/14.
//  Copyright (c) 2014 Ali Kooshesh. All rights reserved.
//

#import "MatchScore.h"
#import "SetScore.h"
#import "Score.h"

@implementation MatchScore

-(instancetype) initWithFirstPlayer: (Player *) p1 secondPlayer: (Player *) p2{
    if((self = [super initWithFirstPlayer:p2 secondPlayer:p2]) == nil)
        return nil;
    return self;
}

-(void) addScore: (Score *) score{
    self.scores[_setNumber] = (SetScore* ) score;
    score.getWinner == self.player1 ? self.player1Score++ : self.player2Score++;
    self.setNumber++;
}

-(BOOL) haveAWinner{
    return (self.player1Score == 3 || self.player2Score == 3);
}

-(NSString *) description{
    NSLog(@"   Set No.    Player A          Player B\n");
    
    for( int i = 0; i < _setNumber; i++ ) {
        NSLog(@"%d", i+1);
        [_scores[i] description];
    }
    
    if ( self.player1Score > self.player2Score ) {
        NSLog(@"\nPlayer A wins the match %d sets to %d \n", self.player1Score, self.player2Score);
    }
    
    else{
        NSLog(@"\nPlayer B wins the match %d sets to %d \n", self.player2Score, self.player1Score);
    }
    return 0;
}

@end
