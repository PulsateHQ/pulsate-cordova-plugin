package com.pulsatehq.cordova;

import com.pulsatehq.external.pulsate.listener.IPulsateLogoutCurrentUserListener;
import com.pulsatehq.external.pulsate.manager.IPulsateManager;
import com.pulsatehq.internal.util.AuthorizationData;

import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;
import org.json.JSONArray;
import org.json.JSONException;
import java.util.ArrayList;
import java.util.Date;


public class PulsatePlugin extends CordovaPlugin {
    
    
    @Override
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);
    }
    
    @Override
    public boolean execute(String action, JSONArray args, final CallbackContext callbackContext) throws JSONException {
        
        IPulsateManager manager = ((MyApplication) this.cordova.getActivity().getApplication()).getPulsate();
        
        if (action.equals("startPulsateSession")) {
            manager.startPulsateSession();
            callbackContext.success();
            return true;
        } else if (action.equals("startPulsateSessionForAlias")) {
            manager.startPulsateSessionForAlias(args.getString(0));
            callbackContext.success();
            return true;
        } else if (action.equals("logout")) {
            manager.logoutCurrentAlias(new IPulsateLogoutCurrentUserListener() {
                @Override
                public void onLogout() {
                    
                }
            });
            callbackContext.success();
            return true;
        } else if (action.equals("setUserAuthorized")) {
            manager.setUserAuthorized(args.getBoolean(0));
            callbackContext.success();
            return true;
        } else if (action.equals("showLastUnauthorizedMessage")) {
            manager.showLastUnauthorizedMessage();
            callbackContext.success();
            return true;
        }
        else if (action.equals("setNewThreadButtonEnabled")) {
            manager.setNewThreadButtonEnabled(args.getBoolean(0));
            callbackContext.success();
            return true;
        } else if (action.equals("sendLocationWithBeaconEvents")) {
            manager.sendLocationWithBeaconEvents(args.getBoolean(0));
            callbackContext.success();
            return true;
        } else if (action.equals("setPrivacy")) {
            Integer privacy = args.getInt(0);
            if(privacy == 1)
                privacy = 0;
            else
                privacy = 1;
            manager.setPrivacy(privacy);
            callbackContext.success();
            return true;
        } else if (action.equals("createEvent")) {
            manager.createEvent(args.getString(0));
            callbackContext.success();
            return true;
        } else if (action.equals("createEvents")) {
            ArrayList<String> listdata = new ArrayList<String>();
            for (int i=0;i<args.length();i++)
                listdata.add(args.getString(i));
            manager.createEvents(listdata);
            callbackContext.success();
            return true;
        } else if (action.equals("incrementCounter")) {
            String counterName = args.getString(0);
            Object value = args.get(1);
            if(value instanceof Integer)
                manager.incrementCounter(counterName,(Integer)value);
            callbackContext.success();
            return true;
        } else if (action.equals("decrementCounter")) {
            String counterName = args.getString(0);
            Object value = args.get(1);
            if(value instanceof Integer)
                manager.decrementCounter(counterName,(Integer)value);
            callbackContext.success();
            return true;
        } else if (action.equals("forceAttributeSync")) {
            manager.forceAttributeSync();
            callbackContext.success();
            return true;
        } else if (action.equals("showFeed")) {
            manager.showFeed();
            callbackContext.success();
            return true;
        } else if (action.equals("createAttributeString")) {
            String attributeName = args.getString(0);
            String attributeValue = args.getString(1);
            manager.createAttribute(attributeName, attributeValue);
            callbackContext.success();
            return true;
        } else if (action.equals("createAttributeInt")) {
            String attributeName = args.getString(0);
            Integer attributeValue = args.getInt(1);
            manager.createAttribute(attributeName, attributeValue);
            callbackContext.success();
            return true;
        } else if (action.equals("createAttributeFloat")) {
            String attributeName = args.getString(0);
            Double attributeValue = args.getDouble(1);
            manager.createAttribute(attributeName, attributeValue.floatValue());
            callbackContext.success();
            return true;
        } else if (action.equals("createAttributeBool")) {
            String attributeName = args.getString(0);
            Boolean attributeValue = args.getBoolean(1);
            manager.createAttribute(attributeName, attributeValue);
            callbackContext.success();
            return true;
        } else if (action.equals("createAttributeDate")) {
            String attributeName = args.getString(0);
            long attributeValue = args.getLong(1);
            Date date = new Date(attributeValue);
            manager.createAttribute(attributeName, date);
            callbackContext.success();
            return true;
        } else if (action.equals("updateFirstName")) {
            String firstName = args.getString(0);
            manager.updateFirstName(firstName);
            callbackContext.success();
            return true;
        } else if (action.equals("updateLastName")) {
            String lastName = args.getString(0);
            manager.updateLastName(lastName);
            callbackContext.success();
            return true;
        } else if (action.equals("updateEmail")) {
            String email = args.getString(0);
            manager.updateEmail(email);
            callbackContext.success();
            return true;
        } else if (action.equals("updateAge")) {
            Integer age = args.getInt(0);
            manager.updateAge(age.toString());
            callbackContext.success();
            return true;
        } else if (action.equals("updateGender")) {
            Integer gender = args.getInt(0);
            if(gender == 1)
                gender = 0;
            else
                gender = 1;
            manager.updateGender(gender);
            callbackContext.success();
            return true;
        } else if (action.equals("setAuthorizationData")) {
            AuthorizationData data = new AuthorizationData(args.getString(0), args.getString(1), args.getString(2));
            manager.setAuthorizationData(data);
            callbackContext.success();
            return true;
        } else if (action.equals("enableInAppNotification")) {
            manager.enableInAppNotification(args.getBoolean(0));
            callbackContext.success();
            return true;
        } else if (action.equals("disablePushNotification")) {
            manager.disablePushNotification(args.getBoolean(0));
            callbackContext.success();
            return true;
        }else if (action.equals("showLastInAppNotification")) {
            manager.showLastInAppNotification();
            callbackContext.success();
            return true;
        }
    
        
        return false;
    }
    
}
