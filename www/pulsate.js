
var Pulsate = function () {
}
Pulsate.prototype.PULUserGenderMale = 0;
Pulsate.prototype.PULUserGenderFemale = 1;

Pulsate.prototype.PULPrivacyLevelSubscribed = 0;
Pulsate.prototype.PULPrivacyLevelUnsubscribed = 1;

Pulsate.prototype.setAuthData = function (APP_ID, APP_KEY) {
	cordova.exec(null, null, "PulsatePlugin", "setAuthData", [APP_ID, APP_KEY]);
}

Pulsate.prototype.startPulsateSession = function (success, error) {
	cordova.exec(success, error, "PulsatePlugin", "startPulsateSession", []);
}

Pulsate.prototype.startPulsateSessionForAlias = function (alias, success, error) {
	cordova.exec(success, error, "PulsatePlugin", "startPulsateSessionForAlias", [alias]);
}

Pulsate.prototype.logout = function (success, error) {
	cordova.exec(success, error, "PulsatePlugin", "logout", []);
}

Pulsate.prototype.setNewThreadButtonEnabled = function (buttonEnabled) {
	cordova.exec(null, null, "PulsatePlugin", "setNewThreadButtonEnabled", [buttonEnabled]);
}

Pulsate.prototype.sendLocationWithBeaconEvents = function (sendLocation) {
	cordova.exec(null, null, "PulsatePlugin", "sendLocationWithBeaconEvents", [sendLocation]);
}

Pulsate.prototype.setLocationUpdatesEnabled = function (enabled) {
	cordova.exec(null, null, "PulsatePlugin", "setLocationUpdatesEnabled", [enabled]);
}

Pulsate.prototype.setInAppNotificationEnabled = function (enabled) {
    cordova.exec(null, null, "PulsatePlugin", "setInAppNotificationEnabled", [enabled]);
}

Pulsate.prototype.showLastInAppNotification = function () {
    cordova.exec(null, null, "PulsatePlugin", "showLastInAppNotification", []);
}

Pulsate.prototype.setPushNotificationEnabled = function (enabled) {
    cordova.exec(null, null, "PulsatePlugin", "setPushNotificationEnabled", [enabled]);
}

Pulsate.prototype.setUserAuthorized = function (authorized) {
	cordova.exec(null, null, "PulsatePlugin", "setUserAuthorized", [authorized]);
}

Pulsate.prototype.showLastUnauthorizedMessage = function () {
	cordova.exec(null, null, "PulsatePlugin", "showLastUnauthorizedMessage", []);
}

Pulsate.prototype.updateFirstName = function (firstName) {
    cordova.exec(null, null, "PulsatePlugin", "updateFirstName", [firstName]);
}

Pulsate.prototype.updateLastName = function (lastName) {
    cordova.exec(null, null, "PulsatePlugin", "updateLastName", [lastName]);
}

Pulsate.prototype.updateEmail = function (email) {
    cordova.exec(null, null, "PulsatePlugin", "updateEmail", [email]);
}

Pulsate.prototype.updateGender = function (gender) {
    cordova.exec(null, null, "PulsatePlugin", "updateGender", [gender]);
}

Pulsate.prototype.updateAge = function (age) {
    cordova.exec(null, null, "PulsatePlugin", "updateAge", [age]);
}

Pulsate.prototype.setPrivacy = function (privacy) {
    cordova.exec(null, null, "PulsatePlugin", "setPrivacy", [privacy]);
}

Pulsate.prototype.createAttributeWithString = function (attributeName, attributeValue) {
    cordova.exec(null, null, "PulsatePlugin", "createAttributeWithString", [attributeName, attributeValue]);
}

Pulsate.prototype.createAttributeWithFloat= function (attributeName, attributeValue) {
    cordova.exec(null, null, "PulsatePlugin", "createAttributeWithFloat", [attributeName, attributeValue]);
}

Pulsate.prototype.createAttributeWithInt = function (attributeName, attributeValue) {
    cordova.exec(null, null, "PulsatePlugin", "createAttributeWithInt", [attributeName, attributeValue]);
}

Pulsate.prototype.createAttributeWithBool = function (attributeName, attributeValue) {
    cordova.exec(null, null, "PulsatePlugin", "createAttributeWithBool", [attributeName, attributeValue]);
}

Pulsate.prototype.createAttributeWithDate = function (attributeName, attributeValue) {
    cordova.exec(null, null, "PulsatePlugin", "createAttributeWithDate", [attributeName, attributeValue.getTime()]);
}

Pulsate.prototype.incrementCounter = function (counterName, value) {
    cordova.exec(null, null, "PulsatePlugin", "incrementCounter", [counterName, value]);
}

Pulsate.prototype.decrementCounter = function (counterName, value) {
    cordova.exec(null, null, "PulsatePlugin", "decrementCounter", [counterName, value]);
}

Pulsate.prototype.createEvent = function (event) {
    cordova.exec(null, null, "PulsatePlugin", "createEvent", [event]);
}

Pulsate.prototype.forceAttributeSync = function () {
    cordova.exec(null, null, "PulsatePlugin", "forceAttributeSync", []);
}

Pulsate.prototype.showFeed = function () {
    cordova.exec(null, null, "PulsatePlugin", "showFeed", []);
}

Pulsate.prototype.useInitialsForUserAvatar = function (useInitials) {
    cordova.exec(null, null, "PulsatePlugin", "useInitialsForUserAvatar", [useInitials]);
}

Pulsate.prototype.setSmallInAppNotificationDuration = function (duration) {
    cordova.exec(null, null, "PulsatePlugin", "setSmallInAppNotificationDuration", [duration]);
}

// Android Methods
Pulsate.prototype.setOnInboxRightButtonClickListenerAndroid = function (success) {
    cordova.exec(success, null, "PulsatePlugin", "setOnInboxRightButtonClickListenerAndroid", []);
}

Pulsate.prototype.removeOnInboxRightButtonClickListenerAndroid = function () {
    cordova.exec(null, null, "PulsatePlugin", "removeOnInboxRightButtonClickListenerAndroid", []);
}

Pulsate.prototype.setUserUnauthorizedListenerAndroid = function (success) {
    cordova.exec(success, null, "PulsatePlugin", "setUserUnauthorizedListenerAndroid", []);
}

Pulsate.prototype.setUnreadCountUpdateListenerAndroid = function (success) {
    cordova.exec(success, null, "PulsatePlugin", "setUnreadCountUpdateListenerAndroid", []);
}

Pulsate.prototype.showNetworkAndroid = function () {
    cordova.exec(null, null, "PulsatePlugin", "showNetworkAndroid", []);
}

// iOS Methods
Pulsate.prototype.setAuthDataIOS = function (APP_ID, APP_KEY, PUSH, LOCATION, APP_DELEGATE, NOTIFICATION_DELEGATE) {
	cordova.exec(null, null, "PulsatePlugin", "setAuthDataIOS", [APP_ID, APP_KEY, PUSH, LOCATION, APP_DELEGATE, NOTIFICATION_DELEGATE]);
}

Pulsate.prototype.getDeviceGuidIOS = function (result) {
    cordova.exec(result, null, "PulsatePlugin", "getDeviceGuidIOS", []);
}
            
Pulsate.prototype.getBadgeCountIOS = function () {
    cordova.exec(null, null, "PulsatePlugin", "getBadgeCountIOS", []);
}

Pulsate.prototype.onUnauthorizedActionIOS = function (result) {
    cordova.exec(result, null, "PulsatePlugin", "onUnauthorizedActionIOS", []);
}

Pulsate.prototype.onBadgeUpdatedIOS = function (result) {
    cordova.exec(result, null, "PulsatePlugin", "onBadgeUpdatedIOS", []);
}
               
Pulsate.prototype.onBadgeDecrementByIOS = function (result) {
    cordova.exec(result, null, "PulsatePlugin", "onBadgeDecrementByIOS", []);
}
               
Pulsate.prototype.onBadgeIncrementByIOS = function (result) {
    cordova.exec(result, null, "PulsatePlugin", "onBadgeIncrementByIOS", []);
}

module.exports = new Pulsate();
