
var Pulsate = function () {
}
Pulsate.prototype.PULUserGenderMale = 0;
Pulsate.prototype.PULUserGenderFemale = 1;

Pulsate.prototype.PULPrivacyLevelSubscribed = 0;
Pulsate.prototype.PULPrivacyLevelUnsubscribed = 1;


Pulsate.prototype.setAuthorizationData = function (APP_ID, APP_KEY, GCM_APP_ID) {
	cordova.exec(null, null, "PulsatePlugin", "setAuthorizationData", [APP_ID, APP_KEY, GCM_APP_ID]);
}

Pulsate.prototype.setAuthorizationDataCustom = function (APP_ID, APP_KEY, PUSH, LOCATION, APP_DELEGATE, NOTIFICATION_DELEGATE) {
	cordova.exec(null, null, "PulsatePlugin", "setAuthorizationDataCustom", [APP_ID, APP_KEY, PUSH, LOCATION, APP_DELEGATE, NOTIFICATION_DELEGATE]);
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

Pulsate.prototype.getDeviceGuid = function (result) {
    cordova.exec(result, null, "PulsatePlugin", "getDeviceGuid", []);
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

Pulsate.prototype.updateAge = function (age) {
    cordova.exec(null, null, "PulsatePlugin", "updateAge", [age]);
}

Pulsate.prototype.updateGender = function (gender) {
    cordova.exec(null, null, "PulsatePlugin", "updateGender", [gender]);
}
   
Pulsate.prototype.setPushNotificationEnabled = function (enabled) {
    cordova.exec(null, null, "PulsatePlugin", "setPushNotificationEnabled", [enabled]);
}

Pulsate.prototype.setPrivacy = function (privacy) {
    cordova.exec(null, null, "PulsatePlugin", "setPrivacy", [privacy]);
}

Pulsate.prototype.createAttributeString = function (attributeName, attributeValue) {
    cordova.exec(null, null, "PulsatePlugin", "createAttributeString", [attributeName, attributeValue]);
}

Pulsate.prototype.createAttributeInt = function (attributeName, attributeValue) {
    cordova.exec(null, null, "PulsatePlugin", "createAttributeInt", [attributeName, attributeValue]);
}

Pulsate.prototype.createAttributeFloat= function (attributeName, attributeValue) {
    cordova.exec(null, null, "PulsatePlugin", "createAttributeFloat", [attributeName, attributeValue]);
}

Pulsate.prototype.createAttributeBool = function (attributeName, attributeValue) {
    cordova.exec(null, null, "PulsatePlugin", "createAttributeBool", [attributeName, attributeValue]);
}

Pulsate.prototype.createAttributeDate = function (attributeName, attributeValue) {
    cordova.exec(null, null, "PulsatePlugin", "createAttributeDate", [attributeName, attributeValue.getTime()]);
}

Pulsate.prototype.incrementCounter = function (counterName, value) {
    cordova.exec(null, null, "PulsatePlugin", "incrementCounter", [counterName, value]);
}

Pulsate.prototype.decrementCounter = function (counterName, value) {
    cordova.exec(null, null, "PulsatePlugin", "decrementCounter", [counterName, value]);
}

Pulsate.prototype.showFeed = function () {
    cordova.exec(null, null, "PulsatePlugin", "showFeed", []);
}

Pulsate.prototype.createEvent = function (event) {
    cordova.exec(null, null, "PulsatePlugin", "createEvent", [event]);
}

Pulsate.prototype.createEvents = function (events) {
    cordova.exec(null, null, "PulsatePlugin", "createEvents", events);
}

Pulsate.prototype.forceAttributeSync = function () {
    cordova.exec(null, null, "PulsatePlugin", "forceAttributeSync", []);
}

Pulsate.prototype.setNewThreadButtonEnabled = function (enabled) {
    cordova.exec(null, null, "PulsatePlugin", "setNewThreadButtonEnabled", [enabled]);
}

Pulsate.prototype.sendLocationWithBeaconEvents = function (enabled) {
    cordova.exec(null, null, "PulsatePlugin", "sendLocationWithBeaconEvents", [enabled]);
}

Pulsate.prototype.setLocationUpdatesEnabled = function (enabled) {
    cordova.exec(null, null, "PulsatePlugin", "setLocationUpdatesEnabled", [enabled]);
}

Pulsate.prototype.enableInAppNotification = function (enabled) {
    cordova.exec(null, null, "PulsatePlugin", "enableInAppNotification", [enabled]);
}
               
Pulsate.prototype.setUserAuthorized = function (authorized) {
	cordova.exec(null, null, "PulsatePlugin", "setUserAuthorized", [authorized]);
}

Pulsate.prototype.showLastInAppNotification = function () {
    cordova.exec(null, null, "PulsatePlugin", "showLastInAppNotification", []);
}

Pulsate.prototype.showLastUnauthorizedMessage = function () {
	cordova.exec(null, null, "PulsatePlugin", "showLastUnauthorizedMessage", []);
}

               
Pulsate.prototype.setUnreadCountUpdateListener = function (success) {
    cordova.exec(success, null, "PulsatePlugin", "setUnreadCountUpdateListener", []);
}
               
Pulsate.prototype.getBadgeCount = function () {
    cordova.exec(null, null, "PulsatePlugin", "getBadgeCount", []);
}

Pulsate.prototype.onUnauthorizedAction = function (result) {
    cordova.exec(result, null, "PulsatePlugin", "onUnauthorizedAction", []);
}

Pulsate.prototype.onBadgeUpdated = function (result) {
    cordova.exec(result, null, "PulsatePlugin", "onBadgeUpdated", []);
}
               
Pulsate.prototype.onBadgeDecrementBy = function (result) {
    cordova.exec(result, null, "PulsatePlugin", "onBadgeDecrementBy", []);
}
               
Pulsate.prototype.onBadgeIncrementBy = function (result) {
    cordova.exec(result, null, "PulsatePlugin", "onBadgeIncrementBy", []);
}


module.exports = new Pulsate();


});
