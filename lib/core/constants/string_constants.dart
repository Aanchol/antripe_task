import 'package:flutter/material.dart';

import '../../core/widgets/measurement.dart';
import 'app_color.dart';

class AppStrings {
  static String get appName => "সতর্ক";

  static const String genericErrorBn = "কিছু একটা সমস্যা হয়েছে!";

  static String get loginText => "আপনার বিকাশ এজেন্ট একাউন্ট লগইন করুন";

  static String get loginRegistrationText =>
      "লগ-ইন/রেজিস্ট্রেশন করতে মোবাইল নম্বর দিয়ে এগিয়ে যান।";

  static String get accountNumberHint => "আপনার একাউন্ট নম্বর দিন";

  static String get numberVerifyText => "আপনার মোবাইল নাম্বার যাচাই করুন";

  static String otpText(String number) =>
      "\"$number\" নাম্বারে পাঠানো ৬ ডিজিটের ওটিপি কোডটি লিখুন";

  static String get otp => "ও টি পি দিন";

  static String sendAgain(int time) =>
      "পুনরায় পাঠান ${time != 0 ? "(${formatTime(time)} s)" : ""}";

  static String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.substring(2, 7);
  }

  static String get accountNumberLabel => "আপনার একাউন্ট";

  static String get pinNumberHint => "********";

  static String get numberOfImageHint =>
      "Number of Images (Default 5 & max 10)";

  static String get newPinHints => "নতুন পাসওয়ার্ড";

  static String get newPinLabel => "নতুন পাসওয়ার্ড*";

  static String get cancel => "CANCEL";

  static String get delete => "DELETE";

  static String get no => "no";

  static String get deleteDevice => "Do you want to delete this device?";

  static String get deleteHub => "Do you want to delete this hub?";

  static String get warningMsgForDeleteDevice =>
      "Once the device is deleted, all the settings will be removed. To use the device you will need to add the device again.";

  static String get warningMsgForDeleteHub =>
      "Once the hub is deleted, all the settings will be removed. To use the hub you will need to add the hub again.";

  static String get newConfirmPasswordHints => "পুনরায় নতুন পাসওয়ার্ড লিখুন";

  static String get newConfirmPasswordLabel => "পুনরায় নতুন পাসওয়ার্ড লিখুন*";

  // static String get oldPasswordHints => "পুরাতন পাসওয়ার্ড";

  static String get oldPasswordLabel => "পুরাতন পাসওয়ার্ড*";

  static String get confirmPinHints => "পুনরায় পিন দিন";

  static String get emptyNewPin => "Password fields is not empty";

  static String get termsConditionUrl =>
      "https://app.satarko.com/terms-and-conditions";

  static String get privacyPolicyUrl =>
      "https://app.satarko.com/privacy-policy";

  static String get satarkoUrl => "https://satarko.com/";

  static String get emptyNewConfirmPin => "Confirm pin field must be filled";

  static String get passwordResetSuccess =>
      "আপনার পাসওয়ার্ড সফল ভাবে পরিবর্তন হয়েছে ";

  static String get doNotMatch => "Your both password doesn't match";

  static String get pinNumberLabel => "পিন কোড লিখুন";

  static String get passwordHints => "Password";

  static String get newPasswordHints => "New Password";

  static String get oldPasswordHints => "Old Password";

  static String get confirmPasswordHints => "Confirm Password";

  static String get go => "এগিয়ে যান";

  static String get sessionExpired => "আপনার সেশনের শেষ";

  // static String get next => "পরবর্তী";

  static String get sentOtp => "Send OTP";

  static String get alert => "Alert";

  static String get emergencyAlert => "Emergency Alert";

  static String get yesExit => "Yes Exit";

  static String get termsAndCondition => "Terms & Conditions";

  static String get privacyPolicy => "Privacy & Policy";

  static String get agreeMsg => "By continuing, I agree to the";

  static String get resetPin => "রিসেট পিন";

  static String get applyFilter => "ফিল্টার এপ্লাই করুন";

  static String get doChange => "পরিবর্তন করুন";

  static String get forgetPassword => "Forget Password?";

  static String get goToRegistration => "Create Account";

  static String get phoneNumber => "ফোন নাম্বার";

  static String get noApplicationTitle => "কোন অ্যাপ্লিকেশন নেই";

  static String get noApplicationSubTitle =>
      "আপনি এখনও কোন অ্যাপ্লিকেশন করেনি।";

  static String get noSearchResultTitle => "কোন অ্যাপ্লিকেশন পাওয়া যায়নি!";

  static String get noSearchResultSubTitle =>
      "আপনি যেসকল ফিল্টার ব্যবহার করে সার্চ করেছেন সে অনুযায়ী কোন অ্যাপ্লিকেশন পাওয়া যায়নি।";

  static String get newApplication => "নতুন অ্যাপ্লিকেশন করুন";

  static String get clearSearch => "Clear Search/Filter";

  static String get mobileNumberLabel => "Mobile Number";

  static String get prefixText => "+88 ";

  static String get mobileNumberHint => "01xxxxxxxxx";

  static String get hubNameHint => "Ex: Room5";

  static String get cameraNameHint => "Ex: Camera5";

  static String get cameraUserNameHint => "User Name";

  static String get personNameHint => "Ex: Person1";

  static String get unitNameHint => "Ex: Unit1";

  static String get divNameHint => "Ex: Door Lock";

  static String get entryDelayTimeHint => "Entry Delay Time";

  static String get exitDelayTimeHint => "Exit Delay Time";

  static String get delayTimeHint => "Delay Time";

  static String get hubNameLabel => "Hub Name";

  static String get cameraNameLabel => "Camera Name";

  static String get cameraUserNameLabel => "Camera User Name";

  static String get cameraPasswordLabel => "Camera Password";

  static String get cameraNoOfImgLabel => "Number of Images";

  static String get entryDelayTimeLabel => "Entry Delay Time";

  static String get exitDelayTimeLabel => "Exit Delay Time";

  static String get delayTimeLabel => "Delay Time";

  static String get resPersonNameLabel => "Person Name";

  static String get resUnitNameLabel => "Unit Name";

  static String get resPersonPhoneLabel => "Phone No";

  static String get divNameLabel => "Device Name";

  static String get hubIdHint => "Ex: hub-0";

  static String get packageIdHint => "subscription code";

  static String get cameraIPAddressHint => "Ex: 255.255.255.255";

  static String get cameraPortHint => "Ex: 554";

  static String get emergencyContactHints => "Ex: 01XXXXXXXXX";

  static String get divIdHint => "Ex:device-0";

  static String get hubIdLabel => "Hub Id";

  static String get packageIdLabel => "Subscription code";

  static String get cameraIPLabel => "Camera IP Address";

  static String get cameraPortLabel => "Port";

  static String get emergencyContactLabel => "Emergency Contact";

  static String get divIdLabel => "Device Serial Id";

  static String get tryAfterSometimeToast =>
      "Please wait sometime... and try again";

  static String get otpEmptyToast => "Please input otp";

  static String get helpMsg => "Do you want to see his current location?";

  static String get noInternetConnectionMsg =>
      "Something went wrong. Try refreshing the page or checking your internet connection.";

  static String get resetPinTitle => "পিন রিসেট করুন";

  static String get changePinTitle => "পাসওয়ার্ড পরিবর্তন";

  static String get registerMerchant => "রেজিস্টারকৃত মার্চেন্ট সমূহ";

  static String get applicationList => "অ্যাপ্লিকেশন লিস্ট";

  static String get searchFilter => "সার্চ ফিলটার";

  static String get searchHint => "অ্যাপ্লিকেশন সার্চ";

  static String get number => "01678242900";

  static String get changeNumber => "নাম্বার পরিবর্তন করুন";

  static String get doNotGetOtp => "ও টি পি কোড পাননি?";

  static String get emptyPin => "অনুগ্রহ করে আপনার পাসওয়ার্ড দিন";

  static String get emptyPhoneOrPassword =>
      "Your phone or password is empty or invalid. Please check again";

  static String get emptyDevice =>
      "Your hub name or hub id is empty or invalid. Please check again";

  static String get didNotMatchPassword =>
      "Password didn't match, Please check again";

  static String get passwordReq => "Password is at least 6 characters";

  static String get passwordRequired => "Password is required";

  static String get newPasswordSame => "Old password and new password is same";

  static String get invalidNumberToast => "Please input your number first!";

  static String get emptyNameToast => "Please input your name";

  static String get inputNumber => "Please Enter Your Phone Number";

  static String get registrationTitle => "Create new account";

  static String get resetPasswordTitle => "Reset Password";

  static String get verify => "OTP Verification";

  static String get verifyDes =>
      "Please enter the otp sent to your given number";

  static String get regDes => "We will send you the 6 digit verification code";

  static String get registration => "Please create your account";

  static String get confirmMobile => "মোবাইল নাম্বার নিশ্চিত করুন";

  static String get newMerchant => "নতুন অ্যাপ্লিকেশন";

  static String get newDevices => "Add Device";

  static String get agent => "AGENT";

  static String get doLogin => "Login to Your Account";

  static String get doRegistration => "আপনার নিবন্ধিত নাম্বারটি লিখুন";

  static String get login => "Sign In";

  static String get alreadyAccount => "Already have account?";

  static String get loginSuccess => "Login Successful";

  static String get resetPasswordSuccess => "Reset Password Successful";

  static String get emptyNumber => "অনুগ্রহ করে আপনার ফোন নাম্বার দিন ";

  static String get notificationTitle => "নোটিফিকেশন";

  static String get changePassword => "পাসওয়ার্ড পরিবর্তন";

  static String get passwordChangeSuccess =>
      "আপনার পাসওয়ার্ড পরিবর্তন সফল হয়েছে";

  static String get logout => "লগ আউট করুন";

  static String get profileTitle => "এজেন্ট প্রোফাইল";

  static String get personalInfo => "ব্যক্তিগত তথ্য";

  static String get managerInfo => "ম্যানেজার তথ্য";

  static String get createAccount => "Create Account";

  static String get mobilePattern => r'\+?(88)?0?1[3456789][0-9]{8}\b';

  static String get numberOnly => r'^[0-9]+$';

  static List<String> get buttonList =>
      ["আমার অ্যাপ্লিকেশন লিস্ট", "নতুন অ্যাপ্লিকেশন"];

  static String get wifiConnected => "Connected";

  static String get wifiNotConnected =>
      "Please Enter Correct Wifi and Password";
}

class NotificationType {
  static const String hubOnboard = "HUB_ONBOARD";

  static const String deviceOnboard = "DEVICE_ONBOARD";

  static const String hubDelete = "HUB_DELETE";

  static const String deviceDelete = "DEVICE_DELETE";

  static const String allDeviceDelete = "ALL_DEVICE_DELETE";

  static const String hubArm = "HUB_ARM";

  static const String hubDisArm = "HUB_DISARM";

  static const String deviceArm = "DEVICE_ARM";

  static const String deviceDisArm = "DEVICE_DISARM";

  static const String deviceOpen = "DEVICE_OPEN";

  static const String deviceClose = "DEVICE_CLOSED";

  static const String deviceTrigger = "DEVICE_TRIGGER";

  static const String deviceZoneUpdate = "DEVICE_ZONE_UPDATE";

  static const String deviceConfiguration = "DEVICE_CONFIGURATION";

  static const String hubConfiguration = "HUB_CONFIGURATION";

  static const String poaStatusOn = "POA_STATUS_ON";

  static const String poaStatusOff = "POA_STATUS_OFF";

  static const String pobStatusOn = "POB_STATUS_ON";

  static const String pobStatusOff = "POB_STATUS_OFF";

  static const String temperOff = "TEMPER_OFF";

  static const String temperOn = "TEMPER_ON";

  static const String lidOpen = "LID_OPEN";

  static const String lidClose = "LID_CLOSE";

  static const String pobExternalSirenOn = "POB_EXTERNAL_SIREN_ON";

  static const String pobExternalSirenOff = "POB_EXTERNAL_SIREN_OFF";

  static const String sensorResetOn = "SENSOR_RESET_ON";

  static const String sensorResetOff = "SENSOR_RESET_OFF";

  static const String hubOnline = "HUB_ONLINE";

  static const String hubOffline = "HUB_OFFLINE";

  static const String hubSirenStart = "HUB_SIREN_START";

  static const String hubSirenEnd = "HUB_SIREN_END";

  static const String hubArmByRemote = "HUB_ARM_BY_REMOTE";

  static const String hubDisArmByRemote = "HUB_DISARM_BY_REMOTE";

  static const String hubSirenEndByRemote = "HUB_SIREN_END_BY_REMOTE";

  static const String captureOnAlarm = "CAPTURE_ON_ALARM";

  static const String captureOnDemand = "CAPTURE_ON_DEMAND";
  static const String panic = "PANIC";
  static const String medical = "MEDICAL";
  static const String hubWifiProvision = "HUB_WIFI_PROVISION";
  static const String hubShareRequest = "HUB_SHARE_REQUEST";
  static const String hubOwnershipChangeRequest =
      "HUB_OWNERSHIP_CHANGE_REQUEST";
  static const String hubOwnershipRequestAccepted =
      "HUB_OWNERSHIP_REQUEST_ACCEPTED";
}

List<String> get hubSettingsItemList =>
    const [
      "Shared User",
      "Wifi Provision",
      "Update Hub Info",
      "Responsible Person",
      "Responsible Unit"
    ];

List<BottomNavigationBarItem> get bottomNavItems =>
    [
      BottomNavigationBarItem(
        label: "Home",
        icon: Icon(
          Icons.home_outlined,
          size: measurement.margin(24),
          color: AppColors.black700,
        ),
        activeIcon: Icon(
          Icons.home,
          size: measurement.margin(24),
          color: AppColors.black850,
        ),
      ),
      BottomNavigationBarItem(
        label: "Action",
        icon: Icon(
          Icons.settings_suggest_outlined,
          size: measurement.margin(24),
          color: AppColors.black700,
        ),
        activeIcon: Icon(
          Icons.hub_rounded,
          size: measurement.margin(24),
          color: AppColors.black850,
        ),
      ),
      BottomNavigationBarItem(
        label: "Room",
        icon: Icon(
          Icons.room_preferences_outlined,
          size: measurement.margin(24),
          color: AppColors.black700,
        ),
        activeIcon: Icon(
          Icons.room_preferences,
          size: measurement.margin(24),
          color: AppColors.black850,
        ),
      ),
      BottomNavigationBarItem(
        label: "Notification",
        icon: Icon(
          Icons.notification_important_outlined,
          size: measurement.margin(24),
          color: AppColors.black700,
        ),
        // activeIcon: Icon(
        //   Icons.notification_important_rounded,
        //   size: measurement.margin(24),
        //   color: AppColors.black850,
        // ),
      ),
    ];

// String get mobilePattern => r'\+?(88)?0?1[3456789][0-9]{8}\b';
String get mobilePattern => r'^(?:\+?88)?01[3-9]\d{8}$';

String get numberOnly => r'^[0-9]+$';
