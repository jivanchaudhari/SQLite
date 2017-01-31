//
//  FirstViewController.m
//  JCSQLite
//
//  Created by Student 13 on 1/23/17.
//  Copyright © 2017 Jivan Chaudhari. All rights reserved.
//

#import "FirstViewController.h"
#import "JCDataBaseManager.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  // NSArray *Array = [[JCDataBaseManager sharedManager ]getAllTask];

}
-(void)viewDidAppear:(BOOL)animated {
    [self reloadTask];
    //NSArray *Array = [[JCDataBaseManager sharedManager ]getAllTask];

}
-(void)reloadTask {
    
    listArray = [[JCDataBaseManager sharedManager]getAllTask];
    [self.myTableView reloadData];
   // NSArray *Array = [[JCDataBaseManager sharedManager ]getAllTask];

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return listArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customCell"];
    
    NSDictionary *dictionary = [listArray objectAtIndex:indexPath.row];
    
    cell.labelName.text = [dictionary valueForKey:@"NAME"];
    cell.labelEmail.text = [dictionary valueForKey:@"EMAIL"];
    cell.labelAddress.text = [dictionary valueForKey:@"ADDRESS"];
    cell.labelMobile.text = [dictionary valueForKey:@"MOBILE"];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Delete");
    
    NSString *task = [listArray objectAtIndex:indexPath.row];
    
    NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM EMPINFO WHERE NAME = '%@'",[task valueForKey:@"NAME"]];
    if ([[JCDataBaseManager sharedManager]executeQuery:deleteQuery] == 1) {
        
        [self reloadTask];
        NSLog(@"Sucessfully Deleted");
        
    }
    else {
        NSLog(@"Faild To Delete Task");
        
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
