//
//  SecondViewController.m
//  JCSQLite
//
//  Created by Student 13 on 1/23/17.
//  Copyright © 2017 Jivan Chaudhari. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)saveText {
    NSString *taskName = _textName.text;
    NSString *taskEmail = _textEmail.text;
    NSString *taskAddress = _textAddress.text;
    NSString *taskMobile = _textMobile.text;
    
    if (taskName.length > 0) {
        if (taskEmail.length > 0) {
            if (taskAddress.length > 0) {
                
                if (taskMobile.length > 0) {
                    
                    NSString *insertQuery = [NSString stringWithFormat:@"INSERT INTO EMPINFO(NAME,EMAIL,ADDRESS,MOBILE) VALUES ('%@','%@','%@','%@')",taskName.uppercaseString,taskEmail,taskAddress,taskMobile];
                   
                   // NSLog(@"%@",insertQuery);
                    
                    int result = [[JCDataBaseManager sharedManager]executeQuery:insertQuery];
                    
                    //int result = [[JCDataBaseManager sharedManager ]executeQuery:insertQuery];
                    if (result == 1) {
                        
                        NSLog(@"Successfully inserted Details.");
                    }else {
                        NSLog(@"Unable to insert details in SQLite DataBase");
                    }
                    _textName.text = @" ";
                    _textEmail.text = @" ";
                    _textAddress.text = @" ";
                    _textMobile.text = @" ";
                    
                }else {
                    NSLog(@"Enter the Mobile Number");
                }
            } else {
                NSLog(@"Enter the Address");
            }
        } else{
            NSLog(@"Enter the Email");
        }
    }else {
        NSLog(@"Enter the Name");
    }
}

- (IBAction)saveButtonAction:(id)sender {
    [self saveText];
    
}

- (IBAction)updateButtonAction:(id)sender {
    NSString *Name = _textName.text;

    NSString *updateQuery= [NSString stringWithFormat:@"UPDATE EMPINFO SET NAME='%@',ADDRESS='%@',MOBILE='%@' WHERE EMAIL='%@'",Name,_textAddress.text,_textMobile.text,_textEmail.text];
    
    int result = [[JCDataBaseManager sharedManager]executeQuery:updateQuery];
    if (result == 1) {
        NSLog(@"Query Executed");

    }else {
        NSLog(@"Query  not Executed");

    }
}
@end
