//
//  SetScore.h
//  TennisInObjectiveC
//
//  Created by Lauryn Loudermilk on 2/2/14.
//  Copyright (c) 2014 Ali Kooshesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Score.h"
#import "TieBreakerScore.h"

@interface SetScore : Score

-(instancetype) initWithFirstPlayer: (Player *) p1 secondPlayer: (Player *) p2;
@property (nonatomic) TieBreakerScore *tieScore;
-(BOOL) haveAWinner;
-(void) addTieBreakerScore: (TieBreakerScore *) score;
-(BOOL) shouldPlayATieBreaker;
-(NSString *) description;

@end