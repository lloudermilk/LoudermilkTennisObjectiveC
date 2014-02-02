//
//  SetScore.h
//  TennisInObjectiveC
//
//  Created by Lauryn Loudermilk on 2/2/14.
//  Copyright (c) 2014 Ali Kooshesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Score.h"
#import "Player.h"
#import "TieBreakerScore.h"

@interface SetScore : Score

-(instancetype) initWithFirstPlayer: (Player *) p1 secondPlayer: (Player *) p2;
// SET TO ZERO SOMEWHERE???
@property (nonatomic) TieBreakerScore *tieScore;
-(void) addTieScore: (TieBreakerScore *) score;
-(BOOL) shouldPlayATieBreaker;



@end