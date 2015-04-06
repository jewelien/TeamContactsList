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
#import "CoachController.h"

@interface ViewController () <UITableViewDelegate>

@property (nonatomic, strong) ViewTableViewDatasource *datasource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.datasource = [ViewTableViewDatasource new];
    tableView.dataSource = self.datasource;
    [self.datasource registerTableView:tableView];
    tableView.delegate = self;
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
        UITextField *coachNameField = [[alert textFields]objectAtIndex:0];
        UITextField *coachPhoneField = [[alert textFields]objectAtIndex:1];
        UITextField *coachEmailField = [[alert textFields]objectAtIndex:2];
        [[CoachController sharedInstance]addTeamWithCoach:coachNameField.text phone:coachPhoneField.text email:coachEmailField.text];
    }];
    [alert addAction:action];
    
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}

-(void)pushDetailViewController {
    DetailViewController *detailVC = [DetailViewController new];
    [self.navigationController pushViewController:detailVC animated:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailViewController *detailVC = [DetailViewController new];
    [detailVC updateWithCoach:[CoachController sharedInstance].coaches[indexPath.row]];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
