import 'package:billing/languages/marathi/calculator/tr_transaction_saved.dart';
import 'package:billing/languages/marathi/calculator/tr_you_gave.dart';
import 'package:billing/languages/marathi/calculator/tr_you_got.dart';
import 'package:billing/languages/marathi/email_auth/app_tra_select_app.dart';
import 'package:billing/languages/marathi/email_auth/tr_forgotpassword.dart';
import 'package:billing/languages/marathi/email_auth/tr_login.dart';
import 'package:billing/languages/marathi/homepage/tr_add_party.dart';
import 'package:billing/languages/marathi/tr_customers_history/tr_customes_history.dart';
import 'package:billing/languages/marathi/tr_customers_history/tr_entry_details.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';
import '../email_auth/tr_signup.dart';
import 'tr_bulk_reminder.dart';
import 'tr_string_homepage.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      // Add translations from HomeTranslations
      ...?SelectLanguageTransalations().keys['en_US'],
      ...?HomeTranslations().keys['en_US'],
      ...?BulkReminderTranslations().keys['en_US'],
      ...?AddPartyTranslations().keys['en_US'],
      ...?YouGotTranslations().keys['en_US'],
      ...?YouGaveTranslations().keys['en-US'],
       ...?TransactionSavedTransalations().keys['en_US'],
      ...?CustomersHistoryTransalations().keys['en_US'],
      ...?EntryDetailsTranslations().keys['en_US'],
      ...?ForgotPasswordTransaltion().keys['en_US'],
      ...?LoginTranslations().keys['en_US'],
      ...?SignUpScreenTranslations().keys['en_US'],
    },
    'mr_IN': {
      // Add Marathi translations similarly
      ...?SelectLanguageTransalations().keys['mr_IN'],
      ...?HomeTranslations().keys['mr_IN'],
      ...?BulkReminderTranslations().keys['mr_IN'],
      ...?AddPartyTranslations().keys['mr_IN'],
      ...?YouGotTranslations().keys['mr_IN'],
      ...?YouGotTranslations().keys['mr_IN'],
       ...?TransactionSavedTransalations().keys['mr_IN'],
      ...?CustomersHistoryTransalations().keys['mr_IN'],
      ...?EntryDetailsTranslations().keys['mr_IN'],
      ...?ForgotPasswordTransaltion().keys['mr_IN'],
      ...?LoginTranslations().keys['mr_IN'],
      ...?SignUpScreenTranslations().keys['mr_IN'],
    },
  };
}
