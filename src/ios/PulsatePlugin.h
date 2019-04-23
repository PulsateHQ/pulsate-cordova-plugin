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


- (void)setAuthData:(CDVInvokedUrlCommand *)command;
- (void)startPulsateSession:(CDVInvokedUrlCommand *)command;
- (void)startPulsateSessionForAlias:(CDVInvokedUrlCommand *)command;
- (void)logout:(CDVInvokedUrlCommand *)command;
- (void)setNewThreadButtonEnabled:(CDVInvokedUrlCommand *)command;
- (void)sendLocationWithBeaconEvents:(CDVInvokedUrlCommand *)command;
- (void)setLocationUpdatesEnabled:(CDVInvokedUrlCommand *)command;
- (void)setInAppNotificationEnabled:(CDVInvokedUrlCommand *)command;
- (void)showLastInAppNotification:(CDVInvokedUrlCommand *)command;
- (void)setPushNotificationEnabled:(CDVInvokedUrlCommand *)command;
- (void)setUserAuthorized:(CDVInvokedUrlCommand *)command;
- (void)showLastUnauthorizedMessage:(CDVInvokedUrlCommand *)command;
- (void)updateFirstName:(CDVInvokedUrlCommand *)command;
- (void)updateLastName:(CDVInvokedUrlCommand *)command;
- (void)updateEmail:(CDVInvokedUrlCommand *)command;
- (void)updateGender:(CDVInvokedUrlCommand *)command;
- (void)updateAge:(CDVInvokedUrlCommand *)command;
- (void)setPrivacy:(CDVInvokedUrlCommand *)command;
- (void)createAttributeWithString:(CDVInvokedUrlCommand *)command;
- (void)createAttributeWithFloat:(CDVInvokedUrlCommand *)command;
- (void)createAttributeWithInt:(CDVInvokedUrlCommand *)command;
- (void)createAttributeWithBool:(CDVInvokedUrlCommand *)command;
- (void)createAttributeWithDate:(CDVInvokedUrlCommand *)command;
- (void)incrementCounter:(CDVInvokedUrlCommand *)command;
- (void)decrementCounter:(CDVInvokedUrlCommand *)command;
- (void)createEvent:(CDVInvokedUrlCommand *)command;
- (void)forceAttributeSync:(CDVInvokedUrlCommand *)command;
- (void)showFeed:(CDVInvokedUrlCommand *)command;
- (void)useInitialsForUserAvatar:(CDVInvokedUrlCommand *)command;
- (void)setSmallInAppNotificationDuration:(CDVInvokedUrlCommand *)command;

- (void)setAuthDataIOS:(CDVInvokedUrlCommand *)command;
- (void)getDeviceGuidIOS:(CDVInvokedUrlCommand *)command;
- (void)getBadgeCountIOS:(CDVInvokedUrlCommand *)command;
- (void)onUnauthorizedActionIOS:(CDVInvokedUrlCommand *)command;
- (void)onBadgeUpdatedIOS:(CDVInvokedUrlCommand *)command;
- (void)onBadgeDecrementByIOS:(CDVInvokedUrlCommand *)command;
- (void)onBadgeIncrementByIOS:(CDVInvokedUrlCommand *)command;

@end
