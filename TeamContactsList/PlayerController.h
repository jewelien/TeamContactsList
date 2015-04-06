//
//  PlayerController.h
//  TeamContactsList
//
//  Created by Julien Guanzon on 4/4/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Coach.h"

@interface PlayerController : NSObject

@property (nonatomic, strong) NSArray *players;

+ (PlayerController *)sharedInstance;

-(void)addPlayerForCoach:(Coach *)coach playerName:(NSString *)name playerPhone:(NSString *)phone playerEmail:(NSString *)email;

-(void)removePlayer:(Player *)player;

-(void)saveToCoreData;

-(void)fetchPlayersWithCoach:coach;


@end
