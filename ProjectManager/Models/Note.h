//
//  Note.h
//  ProjectManager
//
//  Created by conner on 8/18/20.
//  Copyright © 2020 LambdaStudents. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Note : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *contents;
-(instancetype)initWithTitle:(NSString*)title contents:(NSString*)contents;

@end

NS_ASSUME_NONNULL_END
