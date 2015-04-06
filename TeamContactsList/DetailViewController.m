//
//  DetailViewController.m
//  TeamContactsList
//
//  Created by Julien Guanzon on 4/4/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailTableviewDatasource.h"
#import "PlayerController.h"

@interface DetailViewController ()

@property (nonatomic, strong) DetailTableviewDatasource *datasource;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = self.coach.name;
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.datasource = [DetailTableviewDatasource new];
    self.tableView.dataSource = self.datasource;
    [self.datasource registerTableView:self.tableView];
    [self.view addSubview:self.tableView];
    
    UIBarButtonItem *addPlayerButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPlayerPressed)];
    self.navigationItem.rightBarButtonItem = addPlayerButton;
}

- (void)updateWithCoach:(Coach *)coach {
    self.coach = coach;
    [[PlayerController sharedInstance] fetchPlayersWithCoach:coach];
    
}

- (void)addPlayerPressed {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Player Information" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"player name";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"player phone number";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"player email";
    }];

    UIAlertAction *action = [UIAlertAction actionWithTitle:@"done" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UITextField *playerName = [[alert textFields]objectAtIndex:0];
        UITextField *playerPhone = [[alert textFields]objectAtIndex:1];
        UITextField *playerEmail = [[alert textFields]objectAtIndex:2];
        [[PlayerController sharedInstance]addPlayerForCoach:self.coach playerName:playerName.text playerPhone:playerPhone.text playerEmail:playerEmail.text];
    }];
    [alert addAction:action];
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
