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
    if((self = [super initWithFirstPlayer:p1 secondPlayer:p2]) == nil)
        return nil;
    self.scores = [[NSMutableArray alloc] init];
    return self;
}

-(void) addScore: (Score *) score{
    [self.scores addObject: (SetScore *)score];
    score.getWinner == self.player1 ? self.player1Score++ : self.player2Score++;
    self.setNumber++;
}

-(BOOL) haveAWinner{
    return (self.player1Score == 3 || self.player2Score == 3);
}

-(NSString *) description {
    NSString * str = @"\nSet No.   Player A     Player B\n";
    for( int i = 0; i < _setNumber; i++ ){
        NSString * temp = [[NSString alloc] initWithFormat:@"%d         %@\n", i+1, [self.scores[i] description]];
        str = [str stringByAppendingString:temp];
        temp = nil;
    }

    if(self.player1Score > self.player2Score)
        str = [str stringByAppendingString: [[NSString alloc] initWithFormat: @"Player A wins the match %d sets to %d\n", self.player1Score, self.player2Score]];
    else
       str = [str stringByAppendingString: [[NSString alloc] initWithFormat: @"Player B wins the match %d sets to %d\n", self.player2Score, self.player1Score]];
    
    return str;
}

@end