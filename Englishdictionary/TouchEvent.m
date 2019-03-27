//
//  TouchEvent.m
//  Englishdictionary
//
//  Created by 中村圭助 on 2019/03/22.
//  Copyright © 2019年 中村圭助. All rights reserved.
//

#import "TouchEvent.h"

@implementation UIScrollView (TouchEvent)

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self nextResponder] touchesBegan:touches withEvent:event];
}

@end

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
