//
//  ViewController.m
//  MyTableView
//
//  Created by macOS on 10/06/19.
//  Copyright © 2019 macOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *simpleArray;
    UserModel *_userModel;
    NSMutableArray *arrayPid;
    NSMutableArray *arrayName;
    NSMutableArray *arrayPrice;
    NSMutableArray *arrayDescription;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    simpleArray = [NSArray arrayWithObjects:@"username 01", @"username 02", @"username 03", @"username 04", @"username 05", @"username 06", @"username 07", @"username 08", @"username 09", @"username 10", nil];
    arrayPid = [[NSMutableArray alloc] init];
    arrayName = [[NSMutableArray alloc] init];
    arrayPrice = [[NSMutableArray alloc] init];
    arrayDescription = [[NSMutableArray alloc] init];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(updateTableView:)];
    
    _userModel = [[UserModel alloc] init];
    _userModel.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [simpleArray count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellIdentifier;
    UITableViewCell *cell;
    
    cellIdentifier = @"simpleTableCell";
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [simpleArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (IBAction)updateTableView:(id)sender {
    [_userModel downloadItems];
    /*
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"my app alert"                                                        message:@"ok works !"                                                     delegate:nil                                              cancelButtonTitle:@"close"                                              otherButtonTitles:nil];
    [alertView show];
     */
}

-(void)itemsDownloaded:(NSString *)items {
    // This delegate method will get called when the items are finished downloading when executed on press updateDatabase
    
    //NSString *firstString1 = [arrayName objectAtIndex:0];
    //NSString *secondString2 = [arrayName objectAtIndex:1];
    //NSString *str = [NSString stringWithFormat: @"%@ %@", firstString1, secondString2];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"my app alert"                                                        message: items                                                    delegate:nil                                              cancelButtonTitle:@"close"                                              otherButtonTitles:nil];
    [alertView show];
    
    
}

@end
