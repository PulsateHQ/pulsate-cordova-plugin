//
//  PULAuthorizationKeys.h
//  PULPulsate
//
//  Created by Michal on 04/12/2014.
//  Copyright (c) 2014 Pulsatehq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PULAuthorizationData : NSObject

@property (nonatomic, readonly) NSString* appId;
@property (nonatomic, readonly) NSString* appKey;

/**
 *  Creates and validates the authorization data.
 *
 *  @param pAppId - APP ID from the Pulsate CMS
 *  @param pAppKey - APP KEY from the Pulsate CMS
 *  @param error - returns an error if PULAuthorizationData init fails. Nil if no error ocurred.
 *
 *  @return instancetype
 */
-(instancetype)initWithAppId:(NSString*)pAppId andAppKey:(NSString*)pAppKey validationError:(NSError**)error;

@end
