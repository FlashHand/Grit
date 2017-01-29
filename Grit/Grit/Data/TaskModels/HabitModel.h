//
//  HabitModel.h
//  Grit
//
//  Created by BoWang on 2017/1/28.
//  Copyright © 2017年 BoWang. All rights reserved.
//

#import <Realm/Realm.h>
@interface FullfillLog : RLMObject
PS NSDate *fullfillDate;//完成日期，大于上一次完成日期，且不为同一天
PS NSDate *breakDate;//打断日期，大于上一次打断日期，且不为同一天

@end
RLM_ARRAY_TYPE(FullfillLog)
@interface HabitModel : RLMObject
PA NSInteger id;
PS NSString *habitName;
PS NSString *habitDesc;
PS NSDate *createDate;
PA float targetLevel;//目标天数完成百分比
PA NSInteger targetDuration;//目标持续时间
PS RLMArray<FullfillLog *><FullfillLog> *logs;

/**
 create and init a new habit model

 @return HabitModel
 */
+(HabitModel *)createNew;
+(HabitModel *)createMock;
@end
