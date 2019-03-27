//
//  SqlController.h
//  Englishdictionary
//
//  Created by 中村圭助 on 2019/03/26.
//  Copyright © 2019年 中村圭助. All rights reserved.
//

#ifndef SqlController_h
#define SqlController_h

#import <sqlite3.h>

@interface SqlController : NSObject

+ (void)handleDatabaseWithSql:(NSString *)sql;

@end



#endif /* SqlController_h */
