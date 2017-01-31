//
//  FirstViewController.h
//  JCSQLite
//
//  Created by Student 13 on 1/23/17.
//  Copyright © 2017 Jivan Chaudhari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableViewCell.h"

@interface FirstViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *listArray;
    
}
@property (strong, nonatomic) IBOutlet UITableView *myTableView;


@end

