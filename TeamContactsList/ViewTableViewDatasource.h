//
//  ViewTableViewDatasource.h
//  TeamContactsList
//
//  Created by Julien Guanzon on 4/4/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ViewTableViewDatasource : NSObject <UITableViewDataSource>

- (void)registerTableView:(UITableView *)tableView;

@end
