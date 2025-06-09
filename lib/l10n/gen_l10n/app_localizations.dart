import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @profileDetail.
  ///
  /// In en, this message translates to:
  /// **'Profile Detail'**
  String get profileDetail;

  /// No description provided for @uploadPhoto.
  ///
  /// In en, this message translates to:
  /// **'Upload Your Photos'**
  String get uploadPhoto;

  /// No description provided for @uploadPhotoBody.
  ///
  /// In en, this message translates to:
  /// **'Resources out incentivize\nrelaxation floor loss cc.'**
  String get uploadPhotoBody;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @helloBody.
  ///
  /// In en, this message translates to:
  /// **'Tempus varius a vitae interdum id tortor elementum tristique eleifend at.'**
  String get helloBody;

  /// No description provided for @mail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get mail;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgotPass.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPass;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get warning;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account?  '**
  String get dontHaveAccount;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Sign Up!'**
  String get register;

  /// No description provided for @limitedOffer.
  ///
  /// In en, this message translates to:
  /// **'Limited Offer'**
  String get limitedOffer;

  /// No description provided for @favoriteMovies.
  ///
  /// In en, this message translates to:
  /// **'My Favorite Movies'**
  String get favoriteMovies;

  /// No description provided for @noFavoriteMovies.
  ///
  /// In en, this message translates to:
  /// **'No favorite movies have been added yet'**
  String get noFavoriteMovies;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @welcomeBody.
  ///
  /// In en, this message translates to:
  /// **'Tempus varius a vitae interdum id tortor elementum tristique eleifend at.'**
  String get welcomeBody;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @rePass.
  ///
  /// In en, this message translates to:
  /// **'Repeat Password'**
  String get rePass;

  /// No description provided for @userAgreementStart.
  ///
  /// In en, this message translates to:
  /// **'I have read and accept the '**
  String get userAgreementStart;

  /// No description provided for @userAgreementClickable.
  ///
  /// In en, this message translates to:
  /// **'user agreement. '**
  String get userAgreementClickable;

  /// No description provided for @userAgreementEnd.
  ///
  /// In en, this message translates to:
  /// **'Please read this agreement before continuing.'**
  String get userAgreementEnd;

  /// No description provided for @registerNow.
  ///
  /// In en, this message translates to:
  /// **'Register Now'**
  String get registerNow;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?  '**
  String get alreadyHaveAccount;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **' More'**
  String get more;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @addPhoto.
  ///
  /// In en, this message translates to:
  /// **'Add Photo'**
  String get addPhoto;

  /// No description provided for @info.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get info;

  /// No description provided for @photoUploadSuccess.
  ///
  /// In en, this message translates to:
  /// **'Profile photo uploaded successfully.'**
  String get photoUploadSuccess;

  /// No description provided for @emptyMailError.
  ///
  /// In en, this message translates to:
  /// **'Email cannot be empty.'**
  String get emptyMailError;

  /// No description provided for @invalidMailError.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address.'**
  String get invalidMailError;

  /// No description provided for @emptyPassError.
  ///
  /// In en, this message translates to:
  /// **'Password cannot be empty.'**
  String get emptyPassError;

  /// No description provided for @passMinDigitError.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters.'**
  String get passMinDigitError;

  /// No description provided for @emptyFullnameError.
  ///
  /// In en, this message translates to:
  /// **'Full name cannot be empty.'**
  String get emptyFullnameError;

  /// No description provided for @matchPassErorr.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match.'**
  String get matchPassErorr;

  /// No description provided for @errorMessage.
  ///
  /// In en, this message translates to:
  /// **'An error occurred, please try again later.'**
  String get errorMessage;

  /// No description provided for @limited_offer.
  ///
  /// In en, this message translates to:
  /// **'Limited Offer'**
  String get limited_offer;

  /// No description provided for @bonus_message.
  ///
  /// In en, this message translates to:
  /// **'Choose your token package\nto get bonuses and unlock new chapters!'**
  String get bonus_message;

  /// No description provided for @see_all_tokens.
  ///
  /// In en, this message translates to:
  /// **'View All Tokens'**
  String get see_all_tokens;

  /// No description provided for @bonuses_you_get.
  ///
  /// In en, this message translates to:
  /// **'Bonuses You Get'**
  String get bonuses_you_get;

  /// No description provided for @premium_account.
  ///
  /// In en, this message translates to:
  /// **'Premium\nAccount'**
  String get premium_account;

  /// No description provided for @more_matches.
  ///
  /// In en, this message translates to:
  /// **'More\nMatches'**
  String get more_matches;

  /// No description provided for @highlight.
  ///
  /// In en, this message translates to:
  /// **'Highlight'**
  String get highlight;

  /// No description provided for @more_likes.
  ///
  /// In en, this message translates to:
  /// **'More\nLikes'**
  String get more_likes;

  /// No description provided for @choose_token_package.
  ///
  /// In en, this message translates to:
  /// **'Select a token package to unlock'**
  String get choose_token_package;

  /// No description provided for @token.
  ///
  /// In en, this message translates to:
  /// **'Token'**
  String get token;

  /// No description provided for @weekly_per.
  ///
  /// In en, this message translates to:
  /// **'Per week'**
  String get weekly_per;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'tr': return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
