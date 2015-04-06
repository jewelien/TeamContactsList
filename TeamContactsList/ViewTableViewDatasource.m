//
//  ViewTableViewDatasource.m
//  TeamContactsList
//
//  Created by Julien Guanzon on 4/4/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "ViewTableViewDatasource.h"
#import "CoachController.h"

@implementation ViewTableViewDatasource

- (void)registerTableView:(UITableView *)tableView {
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [CoachController sharedInstance].coaches.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    
    if (cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:NSStringFromClass([UITableViewCell class])];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    Coach *coach = [CoachController sharedInstance].coaches[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@: %@", coach.name, coach.phone];
    cell.detailTextLabel.text = coach.email;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[CoachController sharedInstance] removeCoach:[CoachController sharedInstance].coaches[indexPath.row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }

}

@end
