//
//  CoachController.m
//  TeamContactsList
//
//  Created by Julien Guanzon on 4/4/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "CoachController.h"
#import "Stack.h"

@implementation CoachController

-(void)addTeamWithCoach:(NSString *)coachName phone:(NSString *)coachPhone email:(NSString *)coachEmail {
    Coach *coach = [NSEntityDescription insertNewObjectForEntityForName:@"Coach" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    coach.name = coachName;
    coach.phone = coachPhone;
    coach.email = coachEmail;
    [self saveToCoreData];
}

-(void)removeCoach:(Coach *)coach {
    [coach.managedObjectContext deleteObject:coach];
    [self saveToCoreData];
}

- (NSArray *)coaches {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Coach"];
    return [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:NULL];
}

-(void)saveToCoreData {
    [[Stack sharedInstance].managedObjectContext save:NULL];
}

@end
