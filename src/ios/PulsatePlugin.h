#import <Cordova/CDVPlugin.h>

@interface PulsatePlugin : CDVPlugin


- (void)startPulsateSession:(CDVInvokedUrlCommand *)command;
- (void)startPulsateSessionForAlias:(CDVInvokedUrlCommand *)command;
- (void)logout:(CDVInvokedUrlCommand *)command;
- (void)setUserAuthorized:(CDVInvokedUrlCommand *)command;
- (void)showLastUnauthorizedMessage:(CDVInvokedUrlCommand *)command;
- (void)setNewThreadButtonEnabled:(CDVInvokedUrlCommand *)command;
- (void)sendLocationWithBeaconEvents:(CDVInvokedUrlCommand *)command;
- (void)setPrivacy:(CDVInvokedUrlCommand *)command;
- (void)createEvent:(CDVInvokedUrlCommand *)command;
- (void)createEvents:(CDVInvokedUrlCommand *)command;
- (void)incrementCounter:(CDVInvokedUrlCommand *)command;
- (void)decrementCounter:(CDVInvokedUrlCommand *)command;
- (void)forceAttributeSync:(CDVInvokedUrlCommand *)command;
- (void)showFeed:(CDVInvokedUrlCommand *)command;
- (void)createAttributeString:(CDVInvokedUrlCommand *)command;
- (void)createAttributeInt:(CDVInvokedUrlCommand *)command;
- (void)createAttributeFloat:(CDVInvokedUrlCommand *)command;
- (void)createAttributeBool:(CDVInvokedUrlCommand *)command;
- (void)createAttributeDate:(CDVInvokedUrlCommand *)command;
- (void)updateFirstName:(CDVInvokedUrlCommand *)command;
- (void)updateLastName:(CDVInvokedUrlCommand *)command;
- (void)updateEmail:(CDVInvokedUrlCommand *)command;
- (void)updateAge:(CDVInvokedUrlCommand *)command;
- (void)updateGender:(CDVInvokedUrlCommand *)command;
- (void)setAuthorizationData:(CDVInvokedUrlCommand *)command;


@end
