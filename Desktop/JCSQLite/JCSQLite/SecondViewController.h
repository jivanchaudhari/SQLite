//
//  SecondViewController.h
//  JCSQLite
//
//  Created by Student 13 on 1/23/17.
//  Copyright © 2017 Jivan Chaudhari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCDataBaseManager.h"

@interface SecondViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *textName;
@property (strong, nonatomic) IBOutlet UITextField *textEmail;
@property (strong, nonatomic) IBOutlet UITextField *textAddress;
@property (strong, nonatomic) IBOutlet UITextField *textMobile;
- (IBAction)saveButtonAction:(id)sender;
- (IBAction)updateButtonAction:(id)sender;

@end

