//
//  JCDataBaseManager.m
//  JCSQLite
//
//  Created by Student 13 on 1/24/17.
//  Copyright © 2017 Jivan Chaudhari. All rights reserved.
//

#import "JCDataBaseManager.h"

@implementation JCDataBaseManager


+(instancetype) sharedManager {
    static JCDataBaseManager *sharedInstance;
    if (sharedInstance == nil) {
        
        sharedInstance = [[JCDataBaseManager alloc]init];
    }
    return sharedInstance;
}
-(NSString *)getDataBasePath {
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/G1DataBase.sqlite"];
    
}
-(int)executeQuery:(NSString *)query {
    int success = 0;
    const char *UTFDataBasePath = [[self getDataBasePath]UTF8String];
    const char *UTFquery = [query UTF8String];
   
    NSLog(@"%s",UTFDataBasePath);
    sqlite3_stmt *statement;
    
    if (sqlite3_open(UTFDataBasePath, &myDB) == SQLITE_OK) {
        

        if (sqlite3_prepare(myDB, UTFquery, -1, &statement, NULL) == SQLITE_OK) {
            
            if (sqlite3_step(statement) == SQLITE_DONE) {
                success = 1;
            }
            else
            {
                NSLog(@"%s",sqlite3_errmsg(myDB));
            }
            
        }
        else
        {
            NSLog(@"%s",sqlite3_errmsg(myDB));
        }

    } else {
        NSLog(@"%s",sqlite3_errmsg(myDB));

    }
    sqlite3_close(myDB);
    return success;
}
-(NSMutableArray *) getAllTask {
    
    NSMutableArray * array = [[NSMutableArray alloc]init];
    NSString *query = @"SELECT *FROM DETAILS";
    
    const char *UTFquery = [query UTF8String];
    const char *UTFDataBasePath = [[self getDataBasePath]UTF8String];
    sqlite3_stmt *statement;
    
    if (sqlite3_open(UTFDataBasePath, &myDB) == SQLITE_OK) {
        
        if (sqlite3_prepare(myDB, UTFquery, -1, &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement)== SQLITE_ROW) {
                
                const char *taskName = (const char *)sqlite3_column_text(statement, 0);
                
                const char *taskEmail = (const char *)sqlite3_column_text(statement, 1);

                const char *taskAddress = (const char *)sqlite3_column_text(statement, 2);
                
                const char *taskMobile = (const char *)sqlite3_column_text(statement, 3);

                NSString *name = [NSString stringWithUTF8String:taskName];
                NSString *email = [NSString stringWithUTF8String:taskEmail];
                NSString *address = [NSString stringWithUTF8String:taskAddress];
                NSString *mobile = [NSString stringWithUTF8String:taskMobile];
                
                NSDictionary *dictionary = [[NSDictionary alloc]initWithObjects:@[name,email,address,mobile] forKeys:@[@"Name",@"Email",@"Address",@"Mobile"]];
                

                [array addObject:dictionary];
            }
        }
    sqlite3_close(myDB);
    }
    return array;
}

@end
