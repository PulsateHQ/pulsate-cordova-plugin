#import "PulsatePlugin.h"
#import <PULPulsate/PULPulsate.h>



@implementation PulsatePlugin

static PULPulsateManager *pulsateManager;
static NSDictionary *launchOptions;

- (void)pluginInitialize{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finishLaunching:) name:UIApplicationDidFinishLaunchingNotification object:nil];
}

- (void)finishLaunching:(NSNotification *)notification{
    launchOptions = notification.userInfo;
}

- (void)setAuthData:(CDVInvokedUrlCommand *)command{
    NSError *error;
    PULAuthorizationData *data = [[PULAuthorizationData alloc] initWithAppId:[command argumentAtIndex:0] andAppKey:[command argumentAtIndex:1]  validationError:&error];
    if(!error)
        pulsateManager = [PULPulsateFactory getInstanceWithAuthorizationData:data withLocationEnabled:YES withPushEnabled:YES withLaunchOptions:launchOptions withPulsateAppDelegate:YES andPulsateNotificationDelegate:YES error:&error];
    
    pulsateManager.unauthorizedDelegate = self;
    pulsateManager.badgeDelegate = self;
    
    launchOptions = nil;
}

- (void)startPulsateSession:(CDVInvokedUrlCommand *)command {
    self.sessionStartCallbackId = command.callbackId;
    [pulsateManager startPulsateSession:^(BOOL success, NSError* error) {
        if (success)
        {
            CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"sessionStarted"];
            [result setKeepCallbackAsBool:YES];
            [self.commandDelegate sendPluginResult:result callbackId:self.sessionStartCallbackId];
        }
        else
        {
            CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"sessionFailed"];
            [result setKeepCallbackAsBool:YES];
            [self.commandDelegate sendPluginResult:result callbackId:self.sessionStartCallbackId];
        }
    }];
}

- (void)startPulsateSessionForAlias:(CDVInvokedUrlCommand *)command {
    self.sessionStartCallbackId = command.callbackId;
    NSString *alias = [command argumentAtIndex:0];
    if(alias) {
        [pulsateManager startPulsateSessionForAlias:alias withListener:^(BOOL success, NSError* error) {
            if (success)
            {
                CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"sessionStarted"];
                [result setKeepCallbackAsBool:YES];
                [self.commandDelegate sendPluginResult:result callbackId:self.sessionStartCallbackId];
            }
            else
            {
                CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"sessionFailed"];
                [result setKeepCallbackAsBool:YES];
                [self.commandDelegate sendPluginResult:result callbackId:self.sessionStartCallbackId];
            }
        }];
    }
}

- (void)logout:(CDVInvokedUrlCommand *)command{
    self.logoutCallbackId = command.callbackId;
    [pulsateManager logout:^(BOOL success, NSError* error) {
        if (success)
        {
            CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"logoutSucess"];
            [result setKeepCallbackAsBool:YES];
            [self.commandDelegate sendPluginResult:result callbackId:self.logoutCallbackId];
        }
        else
        {
            CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"logoutFailed"];
            [result setKeepCallbackAsBool:YES];
            [self.commandDelegate sendPluginResult:result callbackId:self.logoutCallbackId];
        }
    }];
}

- (void)setNewThreadButtonEnabled:(CDVInvokedUrlCommand *)command{
    NSNumber *enabled = [command argumentAtIndex:0];
    if(enabled)
        [pulsateManager setNewThreadButtonEnabled:[enabled boolValue]];
}

- (void)sendLocationWithBeaconEvents:(CDVInvokedUrlCommand *)command{
    NSNumber *enabled = [command argumentAtIndex:0];
    if(enabled)
        [pulsateManager sendLocationWithBeaconEvents:[enabled boolValue]];
}

- (void)setLocationUpdatesEnabled:(CDVInvokedUrlCommand *)command{
    NSNumber *enabled = [command argumentAtIndex:0];
    if(enabled)
        [pulsateManager setLocationUpdatesEnabled:[enabled boolValue]];
}


- (void)setInAppNotificationEnabled:(CDVInvokedUrlCommand *)command{
    NSNumber *enabled = [command argumentAtIndex:0];
    if(enabled)
        [pulsateManager enableInAppNotification:[enabled boolValue]];
}

- (void)showLastInAppNotification:(CDVInvokedUrlCommand *)command{
    [pulsateManager showLastInAppNotification];
}

- (void)setPushNotificationEnabled:(CDVInvokedUrlCommand *)command{
    NSNumber *enabled = [command argumentAtIndex:0];
    if(enabled)
        [pulsateManager setPushNotificationEnabled:[enabled boolValue]];
}

- (void)setUserAuthorized:(CDVInvokedUrlCommand *)command{
    NSNumber *authorized = [command argumentAtIndex:0];
    if(authorized)
        [pulsateManager setUserAuthorized:[authorized boolValue]];
}

- (void)showLastUnauthorizedMessage:(CDVInvokedUrlCommand *)command{
    [pulsateManager showLastUnauthorizedMessage];
}

- (void)updateFirstName:(CDVInvokedUrlCommand *)command{
    NSString *firstName = [command argumentAtIndex:0];
    if(firstName)
        [pulsateManager updateFirstName:firstName];
}

- (void)updateLastName:(CDVInvokedUrlCommand *)command{
    NSString *lastName = [command argumentAtIndex:0];
    if(lastName)
        [pulsateManager updateLastName:lastName];
}

- (void)updateEmail:(CDVInvokedUrlCommand *)command{
    NSString *email = [command argumentAtIndex:0];
    if(email)
        [pulsateManager updateEmail:email];
}

- (void)updateGender:(CDVInvokedUrlCommand *)command{
    NSNumber *gender = [command argumentAtIndex:0];
    if(gender)
        [pulsateManager updateGender:[gender intValue]];
}

- (void)updateAge:(CDVInvokedUrlCommand *)command{
    NSNumber *age = [command argumentAtIndex:0];
    if(age)
        [pulsateManager updateAge:[age intValue]];
}

- (void)setPrivacy:(CDVInvokedUrlCommand *)command{
    NSNumber *privacy = [command argumentAtIndex:0];
    if(privacy)
        [pulsateManager setPrivacy:[privacy intValue]];
}

- (void)createAttributeWithString:(CDVInvokedUrlCommand *)command{
    NSString *attributeName = [command argumentAtIndex:0];
    NSString *attributeValue = [command argumentAtIndex:1];
    if(attributeName && attributeValue)
        [pulsateManager createAttribute:attributeName withString:attributeValue];
}

- (void)createAttributeWithFloat:(CDVInvokedUrlCommand *)command{
    NSString *attributeName = [command argumentAtIndex:0];
    NSNumber *attributeValue = [command argumentAtIndex:1];
    if(attributeName && attributeValue)
        [pulsateManager createAttribute:attributeName withFloat:[attributeValue floatValue]];
}

- (void)createAttributeWithInt:(CDVInvokedUrlCommand *)command{
    NSString *attributeName = [command argumentAtIndex:0];
    NSNumber *attributeValue = [command argumentAtIndex:1];
    if(attributeName && attributeValue)
        [pulsateManager createAttribute:attributeName withInteger:[attributeValue intValue]];
}

- (void)createAttributeWithBool:(CDVInvokedUrlCommand *)command{
    NSString *attributeName = [command argumentAtIndex:0];
    NSNumber *attributeValue = [command argumentAtIndex:1];
    if(attributeName && attributeValue)
        [pulsateManager createAttribute:attributeName withBoolean:[attributeValue boolValue]];
}

- (void)createAttributeWithDate:(CDVInvokedUrlCommand *)command{
    NSString *attributeName = [command argumentAtIndex:0];
    NSNumber *attributeValue = [command argumentAtIndex:1];
    
    if(attributeName && attributeValue){
        NSDate *formattedDate = [NSDate dateWithTimeIntervalSince1970:[attributeValue doubleValue] / 1000];
        [pulsateManager createAttribute:attributeName withDate:formattedDate];
    }
}

- (void)incrementCounter:(CDVInvokedUrlCommand *)command{
    NSString *counterName = [command argumentAtIndex:0];
    NSNumber *value = [command argumentAtIndex:1];
    
    if (strcmp([value objCType], @encode(float)) == 0 || strcmp([value objCType], @encode(double)) == 0) {
        [pulsateManager incrementFloatAttribute:counterName withFloat:[value floatValue]];
    } else if (strcmp([value objCType], @encode(int)) == 0 || strcmp([value objCType], @encode(long)) == 0) {
        [pulsateManager incrementIntegerAttribute:counterName withInteger:[value intValue]];
    }
}

- (void)decrementCounter:(CDVInvokedUrlCommand *)command{
    NSString *counterName = [command argumentAtIndex:0];
    NSNumber *value = [command argumentAtIndex:1];
    
    if (strcmp([value objCType], @encode(float)) == 0 || strcmp([value objCType], @encode(double)) == 0) {
        [pulsateManager decrementFloatAttribute:counterName withFloat:[value floatValue]];
    } else if (strcmp([value objCType], @encode(int)) == 0 || strcmp([value objCType], @encode(long)) == 0) {
        [pulsateManager decrementIntegerAttribute:counterName withInteger:[value intValue]];
    }
}

- (void)createEvent:(CDVInvokedUrlCommand *)command{
    NSString *event = [command argumentAtIndex:0];
    if(event)
        [pulsateManager createEvent:event];
}

- (void)forceAttributeSync:(CDVInvokedUrlCommand *)command{
    [pulsateManager forceAttributeSync];
}

- (void)showFeed:(CDVInvokedUrlCommand *)command{
    UINavigationController* pulsateFeedNavController = [pulsateManager getFeedNavigationController];
    [self.viewController presentViewController:pulsateFeedNavController animated:YES completion:nil];
}

- (void)useInitialsForUserAvatar:(CDVInvokedUrlCommand *)command{
    NSNumber *useInitials = [command argumentAtIndex:0];
    if(useInitials)
        [pulsateManager useInitialsForUserAvatar:[useInitials boolValue]];
}

- (void)setSmallInAppNotificationDuration:(CDVInvokedUrlCommand *)command{
    NSNumber *duration = [command argumentAtIndex:0];
    if(duration)
        [pulsateManager useInitialsForUserAvatar:[duration intValue]];
}

- (void)setAuthDataIOS:(CDVInvokedUrlCommand *)command{
    NSError *error;
    PULAuthorizationData *data = [[PULAuthorizationData alloc] initWithAppId:[command argumentAtIndex:0] andAppKey:[command argumentAtIndex:1]  validationError:&error];
    
    NSNumber *location = [command argumentAtIndex:2];
    NSNumber *push = [command argumentAtIndex:3];
    NSNumber *app_delegate = [command argumentAtIndex:4];
    NSNumber *notification_delegate = [command argumentAtIndex:5];
    
    if(!error)
        pulsateManager = [PULPulsateFactory getInstanceWithAuthorizationData:data withLocationEnabled:[location boolValue] withPushEnabled:[push boolValue] withLaunchOptions:launchOptions withPulsateAppDelegate:[app_delegate boolValue] andPulsateNotificationDelegate:[notification_delegate boolValue] error:&error];
    
    pulsateManager.unauthorizedDelegate = self;
    pulsateManager.badgeDelegate = self;
    
    launchOptions = nil;
}

- (void)getDeviceGuidIOS:(CDVInvokedUrlCommand *)command{
    self.guidCallbackId = command.callbackId;
    NSString *guid = [pulsateManager getDeviceGuid];
    
    CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:guid];
    [result setKeepCallbackAsBool:YES];
    [self.commandDelegate sendPluginResult:result callbackId:self.guidCallbackId];
}

- (void)getBadgeCountIOS:(CDVInvokedUrlCommand *)command{
    [pulsateManager getBadgeCount];
}

- (void)onUnauthorizedActionIOS:(CDVInvokedUrlCommand *)command{
    self.unauthorizedCallbackId = command.callbackId;
}

- (void)onBadgeUpdatedIOS:(CDVInvokedUrlCommand *)command{
    self.badgeUpdatedCallbackId = command.callbackId;
}

- (void)onBadgeDecrementByIOS:(CDVInvokedUrlCommand *)command{
    self.badgeDecrementByCallbackId = command.callbackId;
}

- (void)onBadgeIncrementByIOS:(CDVInvokedUrlCommand *)command{
    self.badgeIncrementByCallbackId = command.callbackId;
}

- (void)unauthorizedAction:(NSString *)action {
    if(self.unauthorizedCallbackId){
        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:action];
        [result setKeepCallbackAsBool:YES];
        [self.commandDelegate sendPluginResult:result callbackId:self.unauthorizedCallbackId];
    }
}

- (void)badgeUpdated:(NSInteger)badgeNumber {
    if(self.badgeUpdatedCallbackId){
        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsNSInteger:badgeNumber];
        [result setKeepCallbackAsBool:YES];
        [self.commandDelegate sendPluginResult:result callbackId:self.badgeUpdatedCallbackId];
    }
}

- (void)badgeDecrementBy:(NSInteger)badgeDecrement totalCount:(NSInteger)badgeNumber {
    if(self.badgeDecrementByCallbackId){
        NSDictionary *response = @{@"totalCount" : @(badgeNumber), @"badgeDecrement": @(badgeDecrement)};
        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:response];
        [result setKeepCallbackAsBool:YES];
        [self.commandDelegate sendPluginResult:result callbackId:self.badgeDecrementByCallbackId];
    }
}

- (void)badgeIncrementBy:(NSInteger)badgeIncrement totalCount:(NSInteger)badgeNumber {
    if(self.badgeIncrementByCallbackId){
        NSDictionary *response = @{@"totalCount" : @(badgeNumber), @"badgeIncrement": @(badgeIncrement)};
        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:response];
        [result setKeepCallbackAsBool:YES];
        [self.commandDelegate sendPluginResult:result callbackId:self.badgeIncrementByCallbackId];
    }
}
@end
