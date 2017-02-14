//
//  HabitModel.h
//  Grit
//
//  Created by BoWang on 2017/1/28.
//  Copyright © 2017年 BoWang. All rights reserved.
//

#import <Realm/Realm.h>
@interface FullfillLog : RLMObject
//存GMT
PS NSDate *m_fullfillDate;//完成日期，大于上一次完成日期，且不为同一天
PS NSString *m_fullfillTimeZone;
PS NSDate *m_breakDate;//打断日期，大于上一次打断日期，且不为同一天
PS NSString *m_breakTimeZone;
@end
RLM_ARRAY_TYPE(FullfillLog)

@interface HabitModel : RLMObject

PS NSString *m_id;
PA NSInteger m_type;//0-Nonlinear 1-Linear
PS NSString *m_habitName;
PS NSString *m_habitDesc;
PS NSDate *m_createDate;//数据库写入时设置
PA float m_targetLevel;//目标天数完成百分比
PA NSInteger m_targetDuration;//目标持续时间
PS RLMArray<FullfillLog *><FullfillLog> *m_logs;

/**
 create and init a new habit model

 @return HabitModel
 */
+(HabitModel *)createNew;

/**
 create and init a mock habit model

 @return mock model
 */
+(HabitModel *)createMock;

/**
 create and init a CheckIn type habit model m_type=0

 @return model
 */
+(HabitModel *)createCheckIn;

/**
 create and init a Persist type habit model m_type=1
 
 @return model
 */
+(HabitModel *)createPersist;

@end
