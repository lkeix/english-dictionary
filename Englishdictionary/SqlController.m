//
//  SqlController.m
//  Englishdictionary
//
//  Created by 中村圭助 on 2019/03/26.
//  Copyright © 2019年 中村圭助. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SqlController.h"


@interface SqlController()



@end

@implementation SqlController
+ (void)handleDatabaseWithSql:(NSString *)sql
{
    NSString *databaseName = @"Dictionary.sqlite";
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *databasePath = [path stringByAppendingPathComponent:databaseName];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    NSError *error = nil;
    
    // 文章フォルダにデータベースファイルが存在しているかを確認する
    if (![manager fileExistsAtPath:databasePath]) {
        
        // 文章フォルダに存在しない場合は、データベースをコピーする
        NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];
        BOOL success = [manager copyItemAtPath:defaultDBPath toPath:databasePath error:&error];
        
        if (success) {
            NSLog(@"Database file copied.");
        } else {
            NSLog(@"%@", error);
            return ;
        }
    } else {
        
        NSLog(@"Database file exist.");
    }
    
    sqlite3 *database;
    sqlite3_stmt *statement;
    
    // 文章フォルダに用意されたデータベースファイルを開く
    if (sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
        
        int result = sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, NULL);
        
        // SQLite のコンパイルに失敗した場合
        if (result != SQLITE_OK) {
            NSLog(@"Failed to SQLite compile.");
            return ;
        }
        
        // SQL 文を実行し、結果が得られなくなるまで繰り返す
        while (sqlite3_step(statement) == SQLITE_ROW) {
            
            NSLog(@"%d, %@", sqlite3_column_int(statement, 0),[NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 1)]);
        }
        
        // データベースを閉じる
        sqlite3_close(database);
    } else {
        
        NSLog(@"Can't open database.");
    }
    
    return ;
}

@end
