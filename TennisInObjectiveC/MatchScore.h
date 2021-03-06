//
//  MatchScore.h
//  TennisInObjectiveC
//
//  Created by Lauryn Loudermilk on 2/2/14.
//  Copyright (c) 2014 Ali Kooshesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Score.h"

@interface MatchScore : Score

-(instancetype) initWithFirstPlayer: (Player *) p1 secondPlayer: (Player *) p2;
-(void) addScore: (Score *) score;
-(BOOL) haveAWinner;
-(NSString *) description;

//Array for the scores of each scores
@property (nonatomic) NSMutableArray* scores;
//holds the number of sets played, used to print
@property (nonatomic) int setNumber;

@end
