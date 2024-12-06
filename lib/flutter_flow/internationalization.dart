import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
    String? arText = '',
  }) =>
      [enText, frText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    't5fvroky': {
      'en': 'Page Title',
      'ar': '',
      'fr': '',
    },
    'u9xyye3d': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // logIn
  {
    'ap3uwpii': {
      'en': 'Sign In',
      'ar': '',
      'fr': '',
    },
    '76uqwi48': {
      'en': 'Email Address',
      'ar': '',
      'fr': '',
    },
    'lf5ed2ku': {
      'en': 'Enter your email...',
      'ar': '',
      'fr': '',
    },
    'urbrroq3': {
      'en': 'Password',
      'ar': '',
      'fr': '',
    },
    'skrres6s': {
      'en': 'Enter your password...',
      'ar': '',
      'fr': '',
    },
    'bnw9bmdh': {
      'en': 'Forgot Password ?',
      'ar': '',
      'fr': '',
    },
    'bqwvw2nd': {
      'en': 'Sign In',
      'ar': '',
      'fr': '',
    },
    '7uyjqbry': {
      'en': 'Sign Up',
      'ar': '',
      'fr': '',
    },
    'sxa1tfz6': {
      'en': 'Your Name',
      'ar': '',
      'fr': '',
    },
    'd46wcmft': {
      'en': 'Enter your Name ...',
      'ar': '',
      'fr': '',
    },
    'hn35t7xx': {
      'en': 'Email Address',
      'ar': '',
      'fr': '',
    },
    'u1r2ynpt': {
      'en': 'Enter your email...',
      'ar': '',
      'fr': '',
    },
    'luh38l5x': {
      'en': 'Phone Number',
      'ar': '',
      'fr': '',
    },
    'fe4z4crh': {
      'en': 'Enter your Phone Number ...',
      'ar': '',
      'fr': '',
    },
    'bjezncsj': {
      'en': 'Password',
      'ar': '',
      'fr': '',
    },
    '769tpfpw': {
      'en': 'Enter your password...',
      'ar': '',
      'fr': '',
    },
    '5jjddv5j': {
      'en': 'Confirm Password',
      'ar': '',
      'fr': '',
    },
    'qq14ig8m': {
      'en': 'Confirm your password...',
      'ar': '',
      'fr': '',
    },
    '78pm0nzv': {
      'en': 'Create Account',
      'ar': '',
      'fr': '',
    },
    'omyhth7l': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // Profile
  {
    'kaiezeey': {
      'en': 'User \nJoined',
      'ar': '',
      'fr': '',
    },
    '88lw0w82': {
      'en': 'Edit Profile',
      'ar': '',
      'fr': '',
    },
    'muo4v4m1': {
      'en': 'Edit Code PIN',
      'ar': '',
      'fr': '',
    },
    'cse7bn8l': {
      'en': 'Manage Users',
      'ar': '',
      'fr': '',
    },
    'o8lo4ed5': {
      'en': 'privacy policy',
      'ar': '',
      'fr': '',
    },
    'exjkm75r': {
      'en': 'Share',
      'ar': '',
      'fr': '',
    },
    'zhw45rme': {
      'en': 'Log out',
      'ar': '',
      'fr': '',
    },
    'j4mpjj9u': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // editProfile
  {
    'tpcr33i5': {
      'en': 'PICTURE IDEAS',
      'ar': '',
      'fr': '',
    },
    'mmwtr5xc': {
      'en': 'Your Name',
      'ar': '',
      'fr': '',
    },
    'p8040c2h': {
      'en': 'Your Name',
      'ar': '',
      'fr': '',
    },
    '1ct1wl8l': {
      'en': 'Phone Number',
      'ar': '',
      'fr': '',
    },
    'zvm26sjq': {
      'en': 'Phone Number',
      'ar': '',
      'fr': '',
    },
    'ak57gh4j': {
      'en': 'First name is required.',
      'ar': '',
      'fr': '',
    },
    '06ck2x2n': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'fr': '',
    },
    '3x4xpni0': {
      'en': 'Last name is required.',
      'ar': '',
      'fr': '',
    },
    'wdtxd8hl': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'fr': '',
    },
    'ownszdj5': {
      'en': 'Nickname is required.',
      'ar': '',
      'fr': '',
    },
    '1wvn8q6g': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'fr': '',
    },
    'lrs98l5m': {
      'en': 'Save Changes',
      'ar': '',
      'fr': '',
    },
    'zs4qb9ew': {
      'en': 'Edit Profile',
      'ar': '',
      'fr': '',
    },
    'ru63jnww': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // Map
  {
    'qgcwj7ky': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // VisitsHome
  {
    'oqk70a2f': {
      'en': 'Page Title',
      'ar': '',
      'fr': '',
    },
    'j0gwrw2u': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // ClientsHome
  {
    'qm6fcbuy': {
      'en': 'Page Title',
      'ar': '',
      'fr': '',
    },
    'nfqt7iph': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // addRegion
  {
    '1bghrtua': {
      'en': 'Page Title',
      'ar': '',
      'fr': '',
    },
    'f8ohs1pr': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // ForgetPassword
  {
    'liw7opad': {
      'en': 'Forgot Password',
      'ar': '',
      'fr': '',
    },
    'zf26v9dk': {
      'en': 'Enter youe email to get reset password link ',
      'ar': '',
      'fr': '',
    },
    'dmqktkna': {
      'en': 'Email',
      'ar': '',
      'fr': '',
    },
    'a6rexrna': {
      'en': 'Enter your email',
      'ar': '',
      'fr': '',
    },
    'ne92xvov': {
      'en': 'Send Reset Link',
      'ar': '',
      'fr': '',
    },
  },
  // EmailSent
  {
    'nghyosvz': {
      'en': 'Email sent successfully',
      'ar': '',
      'fr': '',
    },
    'knmpxxw2': {
      'en': 'continue',
      'ar': '',
      'fr': '',
    },
  },
  // NavBarAdmin
  {
    '40lpi4de': {
      'en': 'OverView',
      'ar': '',
      'fr': '',
    },
    '10li06su': {
      'en': 'Clients',
      'ar': '',
      'fr': '',
    },
    'mr2f9blq': {
      'en': 'Visits',
      'ar': '',
      'fr': '',
    },
    'pk248wm1': {
      'en': 'Profile',
      'ar': '',
      'fr': '',
    },
  },
  // RegistreSucess
  {
    'gg5x0o6r': {
      'en': 'Register Success',
      'ar': '',
      'fr': '',
    },
    '3srsqzkg': {
      'en':
          'Congratulation ! your account is created ,\nPlease login to get amazing experience.',
      'ar': '',
      'fr': '',
    },
    'l55s6r35': {
      'en': 'Log In',
      'ar': '',
      'fr': '',
    },
  },
  // UpdatedSuccess
  {
    'p6ppivj1': {
      'en': 'Updated Successfully ',
      'ar': '',
      'fr': '',
    },
    'l4hz6a68': {
      'en': 'Done',
      'ar': '',
      'fr': '',
    },
  },
  // loginSucess
  {
    'pjbua8ci': {
      'en': 'Login successfully !',
      'ar': '',
      'fr': '',
    },
    '6lx9j0nx': {
      'en': 'Log In',
      'ar': '',
      'fr': '',
    },
  },
  // addProduct
  {
    '3so7g0jg': {
      'en': 'Add Product',
      'ar': '',
      'fr': '',
    },
    '00488per': {
      'en': 'Title',
      'ar': '',
      'fr': '',
    },
    'u86gzeg1': {
      'en': 'Describe your Farm ',
      'ar': '',
      'fr': '',
    },
    'ebsfp37f': {
      'en': 'Farm Adresse',
      'ar': '',
      'fr': '',
    },
    'c4x9lupm': {
      'en': 'Tap To upload image',
      'ar': '',
      'fr': '',
    },
    'vilptpxo': {
      'en': 'Title is required.',
      'ar': '',
      'fr': '',
    },
    '6ouihgsg': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'fr': '',
    },
    'rvmyuv4l': {
      'en': 'Description is required',
      'ar': '',
      'fr': '',
    },
    'd7n5e7fs': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'fr': '',
    },
    'xi3ispbg': {
      'en': 'Field is required',
      'ar': '',
      'fr': '',
    },
    '3l6if0jz': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'fr': '',
    },
    'l40kwtm5': {
      'en': 'Add',
      'ar': '',
      'fr': '',
    },
    'etg61es0': {
      'en': 'Cancel',
      'ar': '',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'e2us3kbx': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'xvf4np2a': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '9ywd9bov': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'mkus204z': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'ucjcw6me': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'bcxhzns7': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '0ibwmzuz': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'jv70r9op': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '5zymne6e': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'n637ww7g': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    't6mflcth': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'v98wpzm2': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'jtpw625t': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'hcp18myx': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'o1editn6': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'hin6f0pi': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'ha3tm2y4': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '8qtm6pri': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'ojo9honw': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'mez7x4f8': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '7m6ahlgo': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '2l7e4sp9': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'z8swjgob': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'h34vxfl0': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '7t0nskyl': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'baxnwfic': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'olhodi5m': {
      'en': '',
      'ar': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
