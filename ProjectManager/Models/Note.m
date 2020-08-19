//
//  Note.m
//  ProjectManager
//
//  Created by conner on 8/18/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

#import "Note.h"

@implementation Note

-(instancetype)initWithTitle:(NSString*)title contents:(NSString*)contents {
    if(self = [super init]) {
        _title = title;
        _contents = contents;
    }
    return self;
}

@end
