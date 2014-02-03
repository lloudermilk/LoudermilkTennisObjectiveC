//
//  TieBreakerScore.h
//  TennisInObjectiveC
//
//  Created by Lauryn Loudermilk on 2/2/14.
//  Copyright (c) 2014 Ali Kooshesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Score.h"

@interface TieBreakerScore : Score

-(instancetype) initWithFirstPlayer: (Player *) p1 secondPlayer: (Player *) p2;
-(BOOL) haveAWinner;
-(NSString *) description;


@end