//
//  JCDataBaseManager.h
//  JCSQLite
//
//  Created by Student 13 on 1/24/17.
//  Copyright © 2017 Jivan Chaudhari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface JCDataBaseManager : NSObject
{
    sqlite3 *myDB;
    
}
+(instancetype) sharedManager;
-(NSString *) getDataBasePath;
-(int) executeQuery: (NSString *) query;
-(NSMutableArray *) getAllTask;

@end
