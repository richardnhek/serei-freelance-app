import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'km'];

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
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? kmText = '',
  }) =>
      [enText, kmText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    'a6v6m1zy': {
      'en': 'Welcome Back,',
      'km': 'ស្វា​គម​ន៏​ការ​ត្រ​លប់​មក​វិញ,',
    },
    'c8zfcb9n': {
      'en': 'Email Address',
      'km': 'អាស័យ​ដ្ឋាន​អ៊ី​ម៉េ​ល',
    },
    'kgt38sxv': {
      'en': 'Enter your email here...',
      'km': 'បញ្ចូលអ៊ីមែលរបស់អ្នកនៅទីនេះ...',
    },
    'bnavgmz1': {
      'en': 'Password',
      'km': 'ពាក្យសម្ងាត់',
    },
    '71iv2elq': {
      'en': 'Enter your password here...',
      'km': 'បញ្ចូលពាក្យសម្ងាត់របស់អ្នកនៅទីនេះ...',
    },
    'auek5yfc': {
      'en': 'Forgot Password?',
      'km': 'ភ្លេច​លេខសំងាត់​?',
    },
    'r9txk646': {
      'en': 'Login',
      'km': 'ចូល',
    },
    '4b0xgy5u': {
      'en': 'Continue as Guest',
      'km': 'បន្តក្នុងនាមជាភ្ញៀវ',
    },
    '1bzjw8n8': {
      'en': 'Create Account',
      'km': 'បង្កើតគណនី',
    },
    '6f766ai9': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // Register
  {
    'yqc19kny': {
      'en': 'Get Started!',
      'km': 'ចាប់ផ្តើម!',
    },
    '1ghunedq': {
      'en': 'Your Email',
      'km': 'អ៊ីមែល​របស់​អ្នក',
    },
    '20meb9qy': {
      'en': 'Enter your email here...',
      'km': 'បញ្ចូលអ៊ីមែលរបស់អ្នកនៅទីនេះ...',
    },
    'ry3kl31u': {
      'en': 'Create Password',
      'km': 'បង្កើត​ពាក្យ​សម្ងាត់',
    },
    'pqnd6vji': {
      'en': 'Enter your password here...',
      'km': 'បញ្ចូលពាក្យសម្ងាត់របស់អ្នកនៅទីនេះ...',
    },
    '7bmy9g6v': {
      'en': 'Create Account',
      'km': 'បង្កើតគណនី',
    },
    'o1972svd': {
      'en': 'Continue as Guest',
      'km': 'បន្តក្នុងនាមជាភ្ញៀវ',
    },
    'c0k864yx': {
      'en': 'Login',
      'km': 'ចូល',
    },
    '3ukxo4g6': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // CreateProfile
  {
    '4tuh1xjh': {
      'en': 'Create Profile',
      'km': 'បង្កើតប្រវត្តិរូប',
    },
    'a2i095pn': {
      'en': 'Full Name',
      'km': 'ឈ្មោះ​ពេញ',
    },
    'yukexfmq': {
      'en': 'Postition Title',
      'km': 'ចំណងជើងប្រកាស',
    },
    'yuqkjf69': {
      'en': 'Short Description',
      'km': 'ការពិពណ៌នាខ្លី',
    },
    'n9rxh0do': {
      'en': '< 6 Months',
      'km': '< 6 ខែ',
    },
    'upfquj1x': {
      'en': '6m - 1y',
      'km': '6 ម - 1 ឆ្នាំ។',
    },
    'b9j887cu': {
      'en': '1y - 3y',
      'km': '1 ឆ្នាំ - 3 ឆ្នាំ។',
    },
    'fawtn61z': {
      'en': '+3 years',
      'km': '+3 ឆ្នាំ។',
    },
    'zo00dmpc': {
      'en': '+5 years',
      'km': '+5 ឆ្នាំ។',
    },
    'jx09vm9t': {
      'en': '+8 years',
      'km': '+8 ឆ្នាំ។',
    },
    'tlr56yel': {
      'en': 'Experience Level',
      'km': 'កម្រិតបទពិសោធន៍',
    },
    'gt4rg3eo': {
      'en': 'Company',
      'km': 'ក្រុមហ៊ុន',
    },
    '93td5geh': {
      'en': 'Salary',
      'km': 'ប្រាក់ខែ',
    },
    '7hrrvofc': {
      'en': '\$40,000',
      'km': '៤០,០០០ ដុល្លារ',
    },
    'uhtx3jl9': {
      'en': '\$150,000+',
      'km': '\$150,000+',
    },
    'tho1v3ns': {
      'en': 'Continue as a(n)',
      'km': 'បន្តជា a(n)',
    },
    'ztewckq1': {
      'en': 'Choose an option below to continue.',
      'km': 'ជ្រើសរើសជម្រើសខាងក្រោមដើម្បីបន្ត។',
    },
    'himeghz2': {
      'en': 'As an Individual',
      'km': 'ជាបុគ្គល',
    },
    'j9fvzbrp': {
      'en': 'As a Company',
      'km': 'ជាក្រុមហ៊ុន',
    },
    'wou7lndo': {
      'en': 'Skip for Now',
      'km': 'រំលងឥឡូវនេះ',
    },
    'di7m2i63': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // CompanyProfile
  {
    'tlgube3e': {
      'en': 'Company Profile',
      'km': 'ប្រវត្តិ​ក្រុមហ៊ុន',
    },
    'mgkhy5a4': {
      'en': 'Company Name',
      'km': 'ឈ្មោះ​ក្រុម​ហ៊ុន',
    },
    'vpup353f': {
      'en': 'Website',
      'km': 'គេហទំព័រ',
    },
    '9cqvphvv': {
      'en': 'A little bit about your company',
      'km': 'បន្តិចអំពីក្រុមហ៊ុនរបស់អ្នក។',
    },
    '8jtmbwls': {
      'en': 'Company Size',
      'km': 'ទំហំ​ក្រុមហ៊ុន',
    },
    'n7jqd7xx': {
      'en': 'Company Size',
      'km': 'ទំហំ​ក្រុមហ៊ុន',
    },
    't2wnb4br': {
      'en': '1-10',
      'km': '១-១០',
    },
    'f6dim4bh': {
      'en': '11-50',
      'km': '១១-៥០',
    },
    'fjmg3j1t': {
      'en': '51-100',
      'km': '៥១-១០០',
    },
    'c9fag3yy': {
      'en': '100+',
      'km': '100+',
    },
    '30gk3x2v': {
      'en': 'Location',
      'km': 'ទីតាំង',
    },
    'pvsqwk2l': {
      'en': 'Skip for Now',
      'km': 'រំលងឥឡូវនេះ',
    },
    'hlen9yph': {
      'en': 'Continue',
      'km': 'បន្ត',
    },
    'sr8w8h3f': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // AddWorkExp
  {
    '8yq23cgk': {
      'en': 'Work History',
      'km': 'ប្រវត្តិការងារ',
    },
    'u5ue6zk7': {
      'en': 'Job Title',
      'km': 'ចំណងជើងការងារ',
    },
    '44ay04t9': {
      'en': 'Add Work Experience',
      'km': 'បន្ថែមបទពិសោធន៍ការងារ',
    },
    'asz6yory': {
      'en': 'Continue',
      'km': 'បន្ត',
    },
    '4910z90v': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // Onboarding
  {
    '0xzh5sx9': {
      'en': 'Search for Jobs',
      'km': 'ស្វែងរកការងារ',
    },
    '6xuju9hz': {
      'en':
          'Search and find jobs in your industry for companies that are ready to hire the top talent!',
      'km':
          'ស្វែងរក និងស្វែងរកការងារនៅក្នុងឧស្សាហកម្មរបស់អ្នកសម្រាប់ក្រុមហ៊ុនដែលត្រៀមរួចជាស្រេចដើម្បីជួលអ្នកដែលមានទេពកោសល្យកំពូល!',
    },
    'fhjldgub': {
      'en': 'Post Jobs Easily',
      'km': 'ប្រកាសការងារយ៉ាងងាយស្រួល',
    },
    'btg5kfjm': {
      'en':
          'Post jobs for your company easily and find the best talent looking for new opportunities immediately.',
      'km':
          'ប្រកាសការងារសម្រាប់ក្រុមហ៊ុនរបស់អ្នកយ៉ាងងាយស្រួល និងស្វែងរកទេពកោសល្យល្អបំផុត ស្វែងរកឱកាសថ្មីៗភ្លាមៗ។',
    },
    'bf6074dx': {
      'en': 'Find the Right Fit',
      'km': 'ស្វែងរកសមត្រឹមត្រូវ។',
    },
    'h0m44cyo': {
      'en':
          'Search and find jobs in your industry for companies that are ready to hire the top talent!',
      'km':
          'ស្វែងរក និងស្វែងរកការងារនៅក្នុងឧស្សាហកម្មរបស់អ្នកសម្រាប់ក្រុមហ៊ុនដែលត្រៀមរួចជាស្រេចដើម្បីជួលអ្នកដែលមានទេពកោសល្យកំពូល!',
    },
    '78sinxvd': {
      'en': 'Continue',
      'km': 'បន្ត',
    },
    'zhg4epba': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // MAINHome
  {
    '56z74vuu': {
      'en': 'Welcome',
      'km': 'សូមស្វាគមន៍',
    },
    '1rqb9ktm': {
      'en': 'Posted On:',
      'km': 'បង្ហោះនៅលើ៖',
    },
    '55vdu4e5': {
      'en': ' ',
      'km': '',
    },
  },
  // SEARCH_Jobs
  {
    'y30t22ea': {
      'en': 'Search jobs...',
      'km': 'ស្វែងរកការងារ...',
    },
    'cewxcin2': {
      'en': 'Posted On:',
      'km': 'បង្ហោះនៅលើ៖',
    },
    'o116wq03': {
      'en': ' ',
      'km': '',
    },
  },
  // MAINSavedJobs
  {
    'nh0j05gb': {
      'en': 'My Jobs',
      'km': 'ការងាររបស់ខ្ញុំ',
    },
    '0ggp670v': {
      'en': 'Applied',
      'km': 'បានអនុវត្ត',
    },
    'mgupvmh2': {
      'en': 'Posted',
      'km': 'ប្រកាស',
    },
    '2bdyov6u': {
      'en': ' ',
      'km': '',
    },
  },
  // MAIN_Candidates
  {
    'bizg0ebd': {
      'en': 'Candidates',
      'km': 'បេក្ខជន',
    },
    'n6yyl012': {
      'en': ' ',
      'km': '',
    },
  },
  // SEARCH_Candidates
  {
    'pta8k6c3': {
      'en': 'Search candidates...',
      'km': 'ស្វែងរកបេក្ខជន...',
    },
    'ka437s20': {
      'en': ' ',
      'km': '',
    },
  },
  // MAIN_MyProfile
  {
    'envnc4lg': {
      'en': 'Add Job',
      'km': 'បន្ថែមការងារ',
    },
    'qtbqusev': {
      'en': 'Switch to Dark Mode',
      'km': 'ប្តូរទៅរបៀបងងឹត',
    },
    'i3t8ricl': {
      'en': 'Switch to Light Mode',
      'km': 'ប្តូរទៅរបៀបពន្លឺ',
    },
    'cq1i7nqp': {
      'en': 'Short Description',
      'km': 'ការពិពណ៌នាខ្លី',
    },
    '5y13xka5': {
      'en': 'Experience Level',
      'km': 'កម្រិតបទពិសោធន៍',
    },
    't2lggscu': {
      'en': 'Company',
      'km': 'ក្រុមហ៊ុន',
    },
    'cynu3op9': {
      'en': 'Salary',
      'km': 'ប្រាក់ខែ',
    },
    'azqfq14m': {
      'en': 'Company Profile',
      'km': 'ប្រវត្តិ​ក្រុមហ៊ុន',
    },
    '8xfluc1k': {
      'en': 'Work Experience',
      'km': 'បទពិសោធន៍​ការងារ',
    },
  },
  // MAIN_Chat
  {
    'pvxmp1zh': {
      'en': 'Messages',
      'km': 'សារ',
    },
    'bspx2yjr': {
      'en': 'Chats',
      'km': 'ជជែក',
    },
  },
  // DETAILS_Chat
  {
    'q6qladyp': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // JobPost_DetailsActual
  {
    '3p7qsh4f': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
    },
    '2o41g10y': {
      'en': 'Requirements',
      'km': 'តម្រូវការ',
    },
    '95edwj6h': {
      'en': 'Preferred Skills & Expertise',
      'km': 'ជំនាញ និងជំនាញដែលពេញចិត្ត',
    },
    'w6y0gqo9': {
      'en': 'APPLY NOW',
      'km': 'ដាក់ពាក្យ​ឥឡូវនេះ',
    },
    't61bx5b8': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // JobPost_submitApplication
  {
    'x3981tj3': {
      'en': 'Submit your prosoal below',
      'km': 'សូមផ្ញើប្រូម៉ូសិនរបស់អ្នកខាងក្រោម',
    },
    'z4yj80ph': {
      'en': 'Start typing here....',
      'km': 'ចាប់ផ្តើមវាយនៅទីនេះ....',
    },
    '9n00gzb6': {
      'en': 'Add Attachments',
      'km': 'បន្ថែមឯកសារភ្ជាប់',
    },
    'o72l9fff': {
      'en': 'Submit Application',
      'km': 'ដាក់ពាក្យស្នើសុំ',
    },
    'vow0tpvk': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // JobPost_Applied
  {
    'u05sfn65': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
    },
    'us2cfjsq': {
      'en': 'Requirements',
      'km': 'តម្រូវការ',
    },
    'd4p7wd6y': {
      'en': 'Preferred Skills & Expertise',
      'km': 'ជំនាញ និងជំនាញដែលពេញចិត្ត',
    },
    '0ih5rjiq': {
      'en': 'Your proposal',
      'km': 'សំណើរបស់អ្នក។',
    },
    'v2c5kpa1': {
      'en': 'Submitted',
      'km': 'បានដាក់ស្នើ',
    },
    'qhb3jnef': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // JobPost_MyJob_Applicants
  {
    'grmv497v': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
    },
    'yjm1osqq': {
      'en': 'Your Applicants',
      'km': 'បេក្ខជនរបស់អ្នក។',
    },
    'vycmghd1': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // forgotPassword
  {
    'wkdlskvv': {
      'en': 'Forgot Password',
      'km': 'ភ្លេច​លេខសំងាត់​',
    },
    '6at4s5c5': {
      'en': 'Your Email',
      'km': 'អ៊ីមែល​របស់​អ្នក',
    },
    'q2xnwom9': {
      'en': 'Please enter a valid email...',
      'km': 'សូមបញ្ចូលអ៊ីមែលដែលមានសុពលភាព...',
    },
    'lqovkjg4': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account above.',
      'km':
          'យើងនឹងផ្ញើអ៊ីមែលទៅអ្នកដែលមានតំណភ្ជាប់ដើម្បីកំណត់ពាក្យសម្ងាត់របស់អ្នកឡើងវិញ សូមបញ្ចូលអ៊ីមែលដែលភ្ជាប់ជាមួយគណនីរបស់អ្នកខាងលើ។',
    },
    'yraqq3bg': {
      'en': 'Send Reset Password',
      'km': 'ផ្ញើពាក្យសម្ងាត់កំណត់ឡើងវិញ',
    },
    'g0nt0gpi': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // editProfile
  {
    'z17yt8q3': {
      'en': 'Edit Profile',
      'km': 'កែសម្រួលប្រវត្តិរូប',
    },
    'gl6hr6kg': {
      'en': 'Full Name',
      'km': 'ឈ្មោះ​ពេញ',
    },
    'hkoruc7x': {
      'en': 'Postition Title',
      'km': 'ចំណងជើងប្រកាស',
    },
    'ni0h8z6k': {
      'en': 'Email',
      'km': 'អ៊ីមែល',
    },
    'a85tjxrv': {
      'en': 'Short Description',
      'km': 'ការពិពណ៌នាខ្លី',
    },
    'xnc90c58': {
      'en': 'Experience Level',
      'km': 'កម្រិតបទពិសោធន៍',
    },
    'oqwch7r6': {
      'en': '< 6 Months',
      'km': '< 6 ខែ',
    },
    'c614u4pi': {
      'en': '6m - 1y',
      'km': '6 ម - 1 ឆ្នាំ។',
    },
    'at5wo194': {
      'en': '1y - 3y',
      'km': '1 ឆ្នាំ - 3 ឆ្នាំ។',
    },
    'zjdtr80a': {
      'en': '+3 years',
      'km': '+3 ឆ្នាំ។',
    },
    'g5scbkn1': {
      'en': '+5 years',
      'km': '+5 ឆ្នាំ។',
    },
    'jqa1ddvr': {
      'en': '+8 years',
      'km': '+8 ឆ្នាំ។',
    },
    'x7b2kig7': {
      'en': 'Experience LEvel',
      'km': 'បទពិសោធន៍កម្រិត',
    },
    '9l1frbtk': {
      'en': 'Company',
      'km': 'ក្រុមហ៊ុន',
    },
    'ethgbdqc': {
      'en': 'Salary',
      'km': 'ប្រាក់ខែ',
    },
    'zbfjywal': {
      'en': '\$40,000',
      'km': '៤០,០០០ ដុល្លារ',
    },
    'qymlo0f2': {
      'en': '\$150,000+',
      'km': '\$150,000+',
    },
    's16fn2qs': {
      'en': 'Save Changes',
      'km': 'រក្សាទុកការផ្លាស់ប្តូរ',
    },
    '6a7sud1r': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // createJob
  {
    'vsvsw06k': {
      'en': 'Create Job Post',
      'km': 'បង្កើតប្រកាសការងារ',
    },
    'el7aj0m8': {
      'en': 'Position Title',
      'km': 'ចំណងជើងមុខតំណែង',
    },
    '0lm3ywzw': {
      'en': 'Short Description',
      'km': 'ការពិពណ៌នាខ្លី',
    },
    '5thyfcs4': {
      'en': 'Requirements',
      'km': 'តម្រូវការ',
    },
    '1ykjxzwx': {
      'en': 'Have to have x many years of experience, education, etc...',
      'km': 'ត្រូវមានបទពិសោធន៍ x ច្រើនឆ្នាំ ការអប់រំ ។ល។',
    },
    '2ujndzsf': {
      'en': 'Preferred Skills & Experiences',
      'km': 'ជំនាញ និងបទពិសោធន៍ដែលពេញចិត្ត',
    },
    '3h2gb2st': {
      'en': 'Knowledge of software or processes...',
      'km': 'ចំណេះដឹងអំពីកម្មវិធី ឬដំណើរការ...',
    },
    'fsn9op6q': {
      'en': '< 6 Months',
      'km': '< 6 ខែ',
    },
    'nx8rzsko': {
      'en': '6m - 1y',
      'km': '6 ម - 1 ឆ្នាំ។',
    },
    'zr6qf3he': {
      'en': '1y - 3y',
      'km': '1 ឆ្នាំ - 3 ឆ្នាំ។',
    },
    'c25miaap': {
      'en': '+3 years',
      'km': '+3 ឆ្នាំ។',
    },
    'pp6ssfqx': {
      'en': '+5 years',
      'km': '+5 ឆ្នាំ។',
    },
    '07c2oxig': {
      'en': '+8 years',
      'km': '+8 ឆ្នាំ។',
    },
    'a8mn2mib': {
      'en': 'Experience Level',
      'km': 'កម្រិតបទពិសោធន៍',
    },
    '215z38z9': {
      'en': 'Salary',
      'km': 'ប្រាក់ខែ',
    },
    'elefikgx': {
      'en': '\$40,000',
      'km': '៤០,០០០ ដុល្លារ',
    },
    'dm03wz8e': {
      'en': '\$150,000+',
      'km': '\$150,000+',
    },
    '9ov6vdus': {
      'en': 'Location',
      'km': 'ទីតាំង',
    },
    'xbzasjoz': {
      'en': 'Create Post',
      'km': 'បង្កើតប្រកាស',
    },
    'ee6pt03y': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // candidateDetails
  {
    'qmmot66k': {
      'en': 'Short Description',
      'km': 'ការពិពណ៌នាខ្លី',
    },
    'p0h6ti0b': {
      'en': 'Experience Level',
      'km': 'កម្រិតបទពិសោធន៍',
    },
    'dbvoi7cy': {
      'en': 'Company',
      'km': 'ក្រុមហ៊ុន',
    },
    '6ff2cvjq': {
      'en': 'Salary',
      'km': 'ប្រាក់ខែ',
    },
    'h5mf6fe8': {
      'en': 'Message Candidate',
      'km': 'សារបេក្ខជន',
    },
  },
  // JobPost_Details
  {
    '4l6xel5e': {
      'en': 'Job Post',
      'km': 'ប្រកាសការងារ',
    },
    'qf2gucvn': {
      'en': 'SpaceX',
      'km': 'ក្រុមហ៊ុន SpaceX',
    },
    'fyufdrxk': {
      'en': '\$60k-\$70k',
      'km': '\$60k-\$70k',
    },
    'fm51rjx9': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
    },
    'mlexvbs2': {
      'en':
          'I think from our end -- a run through of test accounts, staging environment access. And a deep dive into current layout, reasoning, exploration. I have read through the document Alexis sent over and have been doing some preliminary research for the & after we get some test accounts we can complete the audit which I have put the deadline as next Tuesday as I feel that will be helpful to be thorough in our audit.',
      'km':
          'ខ្ញុំគិតថាពីទីបញ្ចប់របស់យើង - ដំណើរការតាមរយៈគណនីសាកល្បង ការចូលដំណើរការបរិយាកាសដំណាក់កាល។ និងការជ្រមុជទឹកជ្រៅទៅក្នុងប្លង់បច្ចុប្បន្ន ហេតុផល ការរុករក។ ខ្ញុំបានអានឯកសារដែល Alexis បានផ្ញើមក ហើយបាននិងកំពុងធ្វើការស្រាវជ្រាវបឋមមួយចំនួនសម្រាប់ & បន្ទាប់ពីយើងទទួលបានគណនីសាកល្បងមួយចំនួន យើងអាចបញ្ចប់សវនកម្មដែលខ្ញុំបានដាក់កាលកំណត់នៅថ្ងៃអង្គារក្រោយនេះ ខណៈដែលខ្ញុំមានអារម្មណ៍ថាវានឹងមានប្រយោជន៍ក្នុងការធ្វើសវនកម្មឱ្យបានហ្មត់ចត់។ សវនកម្មរបស់យើង។',
    },
    'm2xvueip': {
      'en': 'Requirements',
      'km': 'តម្រូវការ',
    },
    'xd80y19e': {
      'en':
          'I think from our end -- a run through of test accounts, staging environment access. And a deep dive into current layout, reasoning, exploration. I have read through the document Alexis sent over and have been doing some preliminary research for the & after we get some test accounts we can complete the audit which I have put the deadline as next Tuesday as I feel that will be helpful to be thorough in our audit.\n I think from our end -- a run through of test accounts, staging environment access. And a deep dive into current layout, reasoning, exploration. I have read through the document Alexis sent over and have been doing some preliminary research for the & after we get some test accounts we can complete the audit which I have put the deadline as next Tuesday as I feel that will be helpful to be thorough in our audit.',
      'km':
          'ខ្ញុំគិតថាពីទីបញ្ចប់របស់យើង - ដំណើរការតាមរយៈគណនីសាកល្បង ការចូលដំណើរការបរិយាកាសដំណាក់កាល។ និងការជ្រមុជទឹកជ្រៅទៅក្នុងប្លង់បច្ចុប្បន្ន ហេតុផល ការរុករក។ ខ្ញុំបានអានឯកសារដែល Alexis បានផ្ញើមក ហើយបាននិងកំពុងធ្វើការស្រាវជ្រាវបឋមមួយចំនួនសម្រាប់ & បន្ទាប់ពីយើងទទួលបានគណនីសាកល្បងមួយចំនួន យើងអាចបញ្ចប់សវនកម្មដែលខ្ញុំបានដាក់កាលកំណត់នៅថ្ងៃអង្គារក្រោយនេះ ខណៈដែលខ្ញុំមានអារម្មណ៍ថាវានឹងមានប្រយោជន៍ក្នុងការធ្វើសវនកម្មឱ្យបានហ្មត់ចត់។ សវនកម្មរបស់យើង។\n ខ្ញុំគិតថាពីទីបញ្ចប់របស់យើង - ដំណើរការតាមរយៈគណនីសាកល្បង ការចូលដំណើរការបរិយាកាសដំណាក់កាល។ និងការជ្រមុជទឹកជ្រៅទៅក្នុងប្លង់បច្ចុប្បន្ន ហេតុផល ការរុករក។ ខ្ញុំបានអានឯកសារដែល Alexis បានផ្ញើមក ហើយបាននិងកំពុងធ្វើការស្រាវជ្រាវបឋមមួយចំនួនសម្រាប់ & បន្ទាប់ពីយើងទទួលបានគណនីសាកល្បងមួយចំនួន យើងអាចបញ្ចប់សវនកម្មដែលខ្ញុំបានដាក់កាលកំណត់នៅថ្ងៃអង្គារក្រោយនេះ ខណៈដែលខ្ញុំមានអារម្មណ៍ថាវានឹងមានប្រយោជន៍ក្នុងការធ្វើសវនកម្មឱ្យបានហ្មត់ចត់។ សវនកម្មរបស់យើង។',
    },
    'qh7j23sy': {
      'en': 'Preferred Skills & Expertise',
      'km': 'ជំនាញ និងជំនាញដែលពេញចិត្ត',
    },
    'l6zzkrgt': {
      'en':
          'I think from our end -- a run through of test accounts, staging environment access. And a deep dive into current layout, reasoning, exploration. I have read through the document Alexis sent over and have been doing some preliminary research for the & after we get some test accounts we can complete the audit which I have put the deadline as next Tuesday as I feel that will be helpful to be thorough in our audit.\n I think from our end -- a run through of test accounts, staging environment access. And a deep dive into current layout, reasoning, exploration. I have read through the document Alexis sent over and have been doing some preliminary research for the & after we get some test accounts we can complete the audit which I have put the deadline as next Tuesday as I feel that will be helpful to be thorough in our audit.',
      'km':
          'ខ្ញុំគិតថាពីទីបញ្ចប់របស់យើង - ដំណើរការតាមរយៈគណនីសាកល្បង ការចូលដំណើរការបរិយាកាសដំណាក់កាល។ និងការជ្រមុជទឹកជ្រៅទៅក្នុងប្លង់បច្ចុប្បន្ន ហេតុផល ការរុករក។ ខ្ញុំបានអានឯកសារដែល Alexis បានផ្ញើមក ហើយបាននិងកំពុងធ្វើការស្រាវជ្រាវបឋមមួយចំនួនសម្រាប់ & បន្ទាប់ពីយើងទទួលបានគណនីសាកល្បងមួយចំនួន យើងអាចបញ្ចប់សវនកម្មដែលខ្ញុំបានដាក់កាលកំណត់នៅថ្ងៃអង្គារក្រោយនេះ ខណៈដែលខ្ញុំមានអារម្មណ៍ថាវានឹងមានប្រយោជន៍ក្នុងការធ្វើសវនកម្មឱ្យបានហ្មត់ចត់។ សវនកម្មរបស់យើង។\n ខ្ញុំគិតថាពីទីបញ្ចប់របស់យើង - ដំណើរការតាមរយៈគណនីសាកល្បង ការចូលដំណើរការបរិយាកាសដំណាក់កាល។ និងការជ្រមុជទឹកជ្រៅទៅក្នុងប្លង់បច្ចុប្បន្ន ហេតុផល ការរុករក។ ខ្ញុំបានអានឯកសារដែល Alexis បានផ្ញើមក ហើយបាននិងកំពុងធ្វើការស្រាវជ្រាវបឋមមួយចំនួនសម្រាប់ & បន្ទាប់ពីយើងទទួលបានគណនីសាកល្បងមួយចំនួន យើងអាចបញ្ចប់សវនកម្មដែលខ្ញុំបានដាក់កាលកំណត់នៅថ្ងៃអង្គារក្រោយនេះ ខណៈដែលខ្ញុំមានអារម្មណ៍ថាវានឹងមានប្រយោជន៍ក្នុងការធ្វើសវនកម្មឱ្យបានហ្មត់ចត់។ សវនកម្មរបស់យើង។',
    },
    'qzjiian8': {
      'en': 'Submit Application',
      'km': 'ដាក់ពាក្យស្នើសុំ',
    },
    '7oup2lry': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // companyDetails
  {
    'nqgiwmcl': {
      'en': 'Description',
      'km': 'ការពិពណ៌នា',
    },
    '1gcghdbb': {
      'en': 'Home',
      'km': 'ផ្ទះ',
    },
  },
  // HomePage_OLD
  {
    'op5qe257': {
      'en': 'Welcome',
      'km': 'សូមស្វាគមន៍',
    },
    'n7qc7yxg': {
      'en': 'Featured Jobs',
      'km': 'ការងារពិសេស',
    },
    'u0akka2f': {
      'en': 'Job Title',
      'km': 'ចំណងជើងការងារ',
    },
    'gp45zz6n': {
      'en': '[Company Name]',
      'km': '[ឈ្មោះ​ក្រុម​ហ៊ុន]',
    },
    '6cpnzbcn': {
      'en': '\$50k-\$60k',
      'km': '\$50k-\$60k',
    },
    's5wgp7sm': {
      'en': 'Job Title',
      'km': 'ចំណងជើងការងារ',
    },
    'urx5emym': {
      'en': '[Company Name]',
      'km': '[ឈ្មោះ​ក្រុម​ហ៊ុន]',
    },
    'e62zzrlk': {
      'en': '\$50k-\$60k',
      'km': '\$50k-\$60k',
    },
    'k8re7jbf': {
      'en': 'Job Title',
      'km': 'ចំណងជើងការងារ',
    },
    '2iefs17g': {
      'en': '[Company Name]',
      'km': '[ឈ្មោះ​ក្រុម​ហ៊ុន]',
    },
    'bo3uscqk': {
      'en': '\$50k-\$60k',
      'km': '\$50k-\$60k',
    },
    'tog7azpz': {
      'en': 'Search Jobs',
      'km': 'ស្វែងរកការងារ',
    },
    'siwwoi30': {
      'en': 'Search jobs here...',
      'km': 'ស្វែងរកការងារនៅទីនេះ...',
    },
    'ene4t1lz': {
      'en': 'Posted On:',
      'km': 'បង្ហោះនៅលើ៖',
    },
    '24qonzaz': {
      'en': ' ',
      'km': '',
    },
  },
  // PhoneSignIn
  {
    '1va6hrsc': {
      'en': 'Phone Sign In',
      'km': '',
    },
    '376jvk1g': {
      'en': 'Type in your phone number below to register.',
      'km': '',
    },
    '6dhte67s': {
      'en': 'Your Phone Number',
      'km': '',
    },
    '1ay2q81q': {
      'en': 'Please enter a valid number...',
      'km': '',
    },
    'lp0guler': {
      'en': '+855',
      'km': '',
    },
    '76kub4gx': {
      'en': 'Sign In with Phone',
      'km': '',
    },
    '9rrwh47x': {
      'en': 'Home',
      'km': '',
    },
  },
  // OTPCodeScreen
  {
    'pvfl1g86': {
      'en': 'Confirm your Code',
      'km': '',
    },
    'vjdm1ouo': {
      'en': 'This code helps keep your account safe and secure.',
      'km': '',
    },
    'k1lsflre': {
      'en': 'Confirm & Continue',
      'km': '',
    },
    '00fzlylm': {
      'en': 'Enter Pin Code Below',
      'km': '',
    },
    'oe5evkvw': {
      'en': 'Home',
      'km': '',
    },
  },
  // WorkExpBottomSheet
  {
    'fqchfm4l': {
      'en': 'Work Experience',
      'km': 'បទពិសោធន៍​ការងារ',
    },
    '38pk67h0': {
      'en': 'Add Credentials below.',
      'km': 'បន្ថែមលិខិតសម្គាល់ខាងក្រោម។',
    },
    'srex91h7': {
      'en': 'Position Title',
      'km': 'ចំណងជើងមុខតំណែង',
    },
    '18xm60f9': {
      'en': 'Company',
      'km': 'ក្រុមហ៊ុន',
    },
    'by37zkvj': {
      'en': 'Start Date',
      'km': 'ថ្ងៃ​ចាប់ផ្តើម',
    },
    '054xthz4': {
      'en': 'End Date',
      'km': 'កាលបរិច្ឆេទបញ្ចប់',
    },
    'bzn2h0jf': {
      'en': 'What did you do here?',
      'km': 'តើអ្នកបានធ្វើអ្វីនៅទីនេះ?',
    },
    '8wb7xmkx': {
      'en': 'Save Work Experience',
      'km': 'រក្សាទុកបទពិសោធន៍ការងារ',
    },
  },
  // WorkExp_Edit
  {
    'h9dkrrrs': {
      'en': 'Work Experience',
      'km': 'បទពិសោធន៍​ការងារ',
    },
    '2tcuacpt': {
      'en': 'Add Credentials below.',
      'km': 'បន្ថែមលិខិតសម្គាល់ខាងក្រោម។',
    },
    'cvmaegxy': {
      'en': 'Position Title',
      'km': 'ចំណងជើងមុខតំណែង',
    },
    'w05x0xg7': {
      'en': 'Company',
      'km': 'ក្រុមហ៊ុន',
    },
    'b9rwn7ci': {
      'en': 'Start Date',
      'km': 'ថ្ងៃ​ចាប់ផ្តើម',
    },
    'x8co9b4k': {
      'en': 'End Date',
      'km': 'កាលបរិច្ឆេទបញ្ចប់',
    },
    '6ynql0z2': {
      'en': 'What did you do here?',
      'km': 'តើអ្នកបានធ្វើអ្វីនៅទីនេះ?',
    },
    '4ur9vx2t': {
      'en': 'Save Work Experience',
      'km': 'រក្សាទុកបទពិសោធន៍ការងារ',
    },
  },
  // Miscellaneous
  {
    'kpju2etc': {
      'en':
          'In order to take a picture or video, this app requires permission to access the camera.',
      'km':
          'ដើម្បីថតរូប ឬវីដេអូ កម្មវិធីនេះទាមទារការអនុញ្ញាតដើម្បីចូលប្រើកាមេរ៉ា។',
    },
    '3x5w9dem': {
      'en':
          'In order to upload media, this app requires permission to access the photo library.',
      'km':
          'ដើម្បីបង្ហោះមេឌៀ កម្មវិធីនេះទាមទារការអនុញ្ញាតដើម្បីចូលប្រើបណ្ណាល័យរូបថត។',
    },
    'ytr88yhr': {
      'en': '',
      'km': '',
    },
    'ta5kly1y': {
      'en': '',
      'km': '',
    },
    'o5nn9l9p': {
      'en': '',
      'km': '',
    },
    '0l0mx8py': {
      'en': '',
      'km': '',
    },
    'p36fvdli': {
      'en': '',
      'km': '',
    },
    '263n7io1': {
      'en': '',
      'km': '',
    },
    'zcmj1mtn': {
      'en': '',
      'km': '',
    },
    '5czp9gvs': {
      'en': '',
      'km': '',
    },
    'ntludjxr': {
      'en': '',
      'km': '',
    },
    'yoqnvphg': {
      'en': '',
      'km': '',
    },
    'afdkbryv': {
      'en': '',
      'km': '',
    },
    '2isijnya': {
      'en': '',
      'km': '',
    },
    'xvi2594v': {
      'en': '',
      'km': '',
    },
    '70l4ei1t': {
      'en': '',
      'km': '',
    },
    '37x6hylq': {
      'en': '',
      'km': '',
    },
    'zorhyrbv': {
      'en': '',
      'km': '',
    },
    '7t24qknx': {
      'en': '',
      'km': '',
    },
    'ze923l0g': {
      'en': '',
      'km': '',
    },
    'uka39ds6': {
      'en': '',
      'km': '',
    },
    '0m4wd7nf': {
      'en': '',
      'km': '',
    },
  },
].reduce((a, b) => a..addAll(b));
