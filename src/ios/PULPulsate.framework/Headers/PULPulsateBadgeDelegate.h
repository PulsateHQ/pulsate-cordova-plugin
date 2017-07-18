//
//  PULPulsateBadgeDelegate.h
//  PULPulsate
//
//  Created by Rafael Skubisz on 11/3/16.
//  Copyright © 2016 Pulsatehq. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PULPulsateBadgeDelegate
@required
-(void)badgeUpdated:(NSInteger)badgeNumber;
-(void)badgeDecrementBy:(NSInteger)badgeDecrement totalCount:(NSInteger)badgeNumber;
-(void)badgeIncrementBy:(NSInteger)badgeIncrement totalCount:(NSInteger)badgeNumber;
@end
