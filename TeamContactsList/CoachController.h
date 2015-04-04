//
//  CoachController.h
//  TeamContactsList
//
//  Created by Julien Guanzon on 4/4/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coach.h"

@interface CoachController : NSObject

@property (nonatomic, strong) NSArray *coaches;

-(void)addTeamWithCoach:(NSString *)coachName phone:(NSString *)coachPhone email:(NSString *)coachEmail;

-(void)removeCoach:(Coach *)coach;

-(void)saveToCoreData;

@end
