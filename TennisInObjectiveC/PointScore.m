//
//  PointScore.m
//  TennisInObjectiveC
//
//  Created by Ali Kooshesh on 1/22/14.
//  Copyright (c) 2014 Ali Kooshesh. All rights reserved.
//

#import "PointScore.h"

@implementation PointScore

-(BOOL) haveAWinner
{
    return self.player1Score == 1 || self.player2Score == 1;
}

-(NSString *) description{
    NSString * str = [[NSString alloc] init];
    return str;
}


@end