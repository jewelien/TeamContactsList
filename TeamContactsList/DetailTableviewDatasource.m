//
//  DetailTableviewDatasource.m
//  TeamContactsList
//
//  Created by Julien Guanzon on 4/4/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "DetailTableviewDatasource.h"
#import "Coach.h"
#import "CoachController.h"
#import "PlayerController.h"

@interface DetailTableviewDatasource ()

@end

@implementation DetailTableviewDatasource

-(void)registerTableView:(UITableView *)tableView {
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSLog(@"self.PLAYERS %@",[PlayerController sharedInstance].players);
    return [PlayerController sharedInstance].players.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass([UITableViewCell class])];
        cell.accessoryType = UITableViewCellAccessoryDetailButton;
    }
    Player *player = [PlayerController sharedInstance].players[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",player.name];
    cell.detailTextLabel.text = player.phone;
    return cell;

}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[PlayerController sharedInstance] removePlayer:[PlayerController sharedInstance].players[indexPath.row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }


}

@end
