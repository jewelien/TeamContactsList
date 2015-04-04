//
//  ViewController.m
//  TeamContactsList
//
//  Created by Julien Guanzon on 4/4/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "ViewTableViewDatasource.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:tableView];
    
    UIBarButtonItem *addButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCoachDetails)];
    self.navigationItem.rightBarButtonItem = addButtonItem;
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)addCoachDetails{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Coach Information" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"coach name";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"coach phone number";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"coach email";
    }];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"next" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self pushDetailViewController];
    }];
    [alert addAction:action];
    
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}

-(void)pushDetailViewController {
    DetailViewController *detailVC = [DetailViewController new];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
