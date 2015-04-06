//
//  PlayerController.m
//  TeamContactsList
//
//  Created by Julien Guanzon on 4/4/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "PlayerController.h"
#import "Stack.h"
#import "CoachController.h"

@interface PlayerController ()

@property (nonatomic, strong) Coach *coach;

@end

@implementation PlayerController


+ (PlayerController *)sharedInstance {
    static PlayerController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [PlayerController new];
    });
    return sharedInstance;
}

-(void)addPlayerForCoach:(Coach *)coach playerName:(NSString *)name playerPhone:(NSString *)phone playerEmail:(NSString *)email{
    Player *player = [NSEntityDescription insertNewObjectForEntityForName:@"Player" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    player.name = name;
    player.phone = phone;
    player.email = email;
    player.coach = coach;
    [self saveToCoreData];
}


-(void)fetchPlayersWithCoach:coach {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"coach == %@", coach];
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Player"];
    [fetchRequest setPredicate:predicate];
    NSArray *array = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:nil];
    self.players = array;
    self.coach = coach;
}


-(void)removePlayer:(Player *)player{
    [player.managedObjectContext deleteObject:player];
    [self saveToCoreData];
    [self fetchPlayersWithCoach:self.coach];
}


-(void)saveToCoreData {
    [[Stack sharedInstance].managedObjectContext save:NULL];
}


@end
