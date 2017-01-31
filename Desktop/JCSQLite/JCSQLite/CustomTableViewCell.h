//
//  CustomTableViewCell.h
//  JCSQLite
//
//  Created by Student 13 on 1/24/17.
//  Copyright © 2017 Jivan Chaudhari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *labelName;
@property (strong, nonatomic) IBOutlet UILabel *labelEmail;
@property (strong, nonatomic) IBOutlet UILabel *labelAddress;
@property (strong, nonatomic) IBOutlet UILabel *labelMobile;

@end
