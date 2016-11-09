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
    
- (void)startPulsateSession:(CDVInvokedUrlCommand *)command {
    [pulsateManager startPulsateSession];
}
    
- (void)startPulsateSessionForAlias:(CDVInvokedUrlCommand *)command {
    NSString *alias = [command argumentAtIndex:0];
    if(alias)
        [pulsateManager startPulsateSessionForAlias:alias];
}
    
- (void)logout:(CDVInvokedUrlCommand *)command{
    [pulsateManager logout];
}
    
- (void)setUserAuthorized:(CDVInvokedUrlCommand *)command{
    NSNumber *authorized = [command argumentAtIndex:0];
    if(authorized)
        [pulsateManager setUserAuthorized:[authorized boolValue]];
}
    
- (void)showLastUnauthorizedMessage:(CDVInvokedUrlCommand *)command{
    [pulsateManager showLastUnauthorizedMessage];
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
    
- (void)setPrivacy:(CDVInvokedUrlCommand *)command{
    NSNumber *privacy = [command argumentAtIndex:0];
    if(privacy)
        [pulsateManager setPrivacy:[privacy intValue]];
}
    
- (void)createEvent:(CDVInvokedUrlCommand *)command{
    NSString *event = [command argumentAtIndex:0];
    if(event)
        [pulsateManager createEvent:event];
}
    
- (void)createEvents:(CDVInvokedUrlCommand *)command{
    NSArray *events = [command arguments];
    if(events && events.count)
        for(NSString *event in events)
            [pulsateManager createEvent:event];
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
    
- (void)forceAttributeSync:(CDVInvokedUrlCommand *)command{
    [pulsateManager forceAttributeSync];
}
    
- (void)showFeed:(CDVInvokedUrlCommand *)command{
    //[pulsateManager showFeed];
    UINavigationController* pulsateFeedNavController = [pulsateManager getFeedNavigationController];
    [self.viewController presentViewController:pulsateFeedNavController animated:YES completion:nil];
    
}
    
- (void)createAttributeString:(CDVInvokedUrlCommand *)command{
    NSString *attributeName = [command argumentAtIndex:0];
    NSString *attributeValue = [command argumentAtIndex:1];
    if(attributeName && attributeValue)
        [pulsateManager createAttribute:attributeName withString:attributeValue];
}
- (void)createAttributeInt:(CDVInvokedUrlCommand *)command{
    NSString *attributeName = [command argumentAtIndex:0];
    NSNumber *attributeValue = [command argumentAtIndex:1];
    if(attributeName && attributeValue)
        [pulsateManager createAttribute:attributeName withInteger:[attributeValue intValue]];
}
- (void)createAttributeFloat:(CDVInvokedUrlCommand *)command{
    NSString *attributeName = [command argumentAtIndex:0];
    NSNumber *attributeValue = [command argumentAtIndex:1];
    if(attributeName && attributeValue)
        [pulsateManager createAttribute:attributeName withFloat:[attributeValue floatValue]];
}
- (void)createAttributeBool:(CDVInvokedUrlCommand *)command{
    NSString *attributeName = [command argumentAtIndex:0];
    NSNumber *attributeValue = [command argumentAtIndex:1];
    if(attributeName && attributeValue)
        [pulsateManager createAttribute:attributeName withBoolean:[attributeValue boolValue]];
}
    
- (void)createAttributeDate:(CDVInvokedUrlCommand *)command{
    NSString *attributeName = [command argumentAtIndex:0];
    NSNumber *attributeValue = [command argumentAtIndex:1];
    
    if(attributeName && attributeValue){
        //NSDateFormatter *df = [[NSDateFormatter alloc] init];
        //[df setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
        //[df setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
        
        NSDate *formattedDate = [NSDate dateWithTimeIntervalSince1970:[attributeValue doubleValue] / 1000];
        
        [pulsateManager createAttribute:attributeName withDate:formattedDate];
    }
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
    
- (void)updateAge:(CDVInvokedUrlCommand *)command{
    NSNumber *age = [command argumentAtIndex:0];
    if(age)
        [pulsateManager updateAge:[age intValue]];
}
    
- (void)updateGender:(CDVInvokedUrlCommand *)command{
    NSNumber *gender = [command argumentAtIndex:0];
    if(gender)
        [pulsateManager updateGender:[gender intValue]];
}
    
- (void)setAuthorizationData:(CDVInvokedUrlCommand *)command{
    NSError *error;
    PULAuthorizationData *data = [[PULAuthorizationData alloc] initWithAppId:[command argumentAtIndex:0] andAppKey:[command argumentAtIndex:1]  validationError:&error];
    if(!error)
        pulsateManager = [PULPulsateFactory getInstanceWithAuthorizationData:data withLocationEnabled:YES withPushEnabled:YES withLaunchOptions:launchOptions error:&error];
    launchOptions = nil;
}
    
@end
