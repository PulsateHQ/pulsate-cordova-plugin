#import <Cordova/CDVPlugin.h>
#import <PULPulsate/PULPulsate.h>


@interface PulsatePlugin : CDVPlugin <PULPulsateBadgeDelegate, PULPulsateUnauthorizedManagerDelegate>

@property (nonatomic, strong) NSString* sessionStartCallbackId;
@property (nonatomic, strong) NSString* logoutCallbackId;
@property (nonatomic, strong) NSString* guidCallbackId;
@property (nonatomic, strong) NSString* unauthorizedCallbackId;
@property (nonatomic, strong) NSString* badgeUpdatedCallbackId;
@property (nonatomic, strong) NSString* badgeDecrementByCallbackId;
@property (nonatomic, strong) NSString* badgeIncrementByCallbackId;


- (void)setAuthorizationData:(CDVInvokedUrlCommand *)command;
- (void)setAuthorizationDataCustom:(CDVInvokedUrlCommand *)command;
- (void)startPulsateSession:(CDVInvokedUrlCommand *)command;
- (void)startPulsateSessionForAlias:(CDVInvokedUrlCommand *)command;
- (void)logout:(CDVInvokedUrlCommand *)command;
- (void)getDeviceGuid:(CDVInvokedUrlCommand *)command;
- (void)updateFirstName:(CDVInvokedUrlCommand *)command;
- (void)updateLastName:(CDVInvokedUrlCommand *)command;
- (void)updateEmail:(CDVInvokedUrlCommand *)command;
- (void)updateAge:(CDVInvokedUrlCommand *)command;
- (void)updateGender:(CDVInvokedUrlCommand *)command;
- (void)setPushNotificationEnabled:(CDVInvokedUrlCommand *)command;
- (void)setPrivacy:(CDVInvokedUrlCommand *)command;
- (void)createAttributeString:(CDVInvokedUrlCommand *)command;
- (void)createAttributeInt:(CDVInvokedUrlCommand *)command;
- (void)createAttributeFloat:(CDVInvokedUrlCommand *)command;
- (void)createAttributeBool:(CDVInvokedUrlCommand *)command;
- (void)createAttributeDate:(CDVInvokedUrlCommand *)command;
- (void)incrementCounter:(CDVInvokedUrlCommand *)command;
- (void)decrementCounter:(CDVInvokedUrlCommand *)command;
- (void)showFeed:(CDVInvokedUrlCommand *)command;
- (void)createEvent:(CDVInvokedUrlCommand *)command;
- (void)createEvents:(CDVInvokedUrlCommand *)command;
- (void)forceAttributeSync:(CDVInvokedUrlCommand *)command;
- (void)setNewThreadButtonEnabled:(CDVInvokedUrlCommand *)command;
- (void)sendLocationWithBeaconEvents:(CDVInvokedUrlCommand *)command;
- (void)setLocationUpdatesEnabled:(CDVInvokedUrlCommand *)command;
- (void)enableInAppNotification:(CDVInvokedUrlCommand *)command;
- (void)setUserAuthorized:(CDVInvokedUrlCommand *)command;
- (void)showLastInAppNotification:(CDVInvokedUrlCommand *)command;
- (void)showLastUnauthorizedMessage:(CDVInvokedUrlCommand *)command;

- (void)getBadgeCount:(CDVInvokedUrlCommand *)command;
- (void)onUnauthorizedAction:(CDVInvokedUrlCommand *)command;
- (void)onBadgeUpdated:(CDVInvokedUrlCommand *)command;
- (void)onBadgeDecrementBy:(CDVInvokedUrlCommand *)command;
- (void)onBadgeIncrementBy:(CDVInvokedUrlCommand *)command;



@end
