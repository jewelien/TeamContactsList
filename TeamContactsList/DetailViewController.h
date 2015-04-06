//
//  DetailViewController.h
//  TeamContactsList
//
//  Created by Julien Guanzon on 4/4/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Coach.h"

@interface DetailViewController : UIViewController
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) Coach *coach;

- (void)updateWithCoach:(Coach *)coach;

@end
