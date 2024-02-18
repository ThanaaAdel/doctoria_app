// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "book_your_date":
            MessageLookupByLibrary.simpleMessage("Book Your date"),
        "choose_a_doctor":
            MessageLookupByLibrary.simpleMessage("Choose a Doctor"),
        "find_a_doctor": MessageLookupByLibrary.simpleMessage("Find a doctor"),
        "intro_screen1": MessageLookupByLibrary.simpleMessage(
            "You can search for a doctor by specialty and the location you are in"),
        "intro_screen2": MessageLookupByLibrary.simpleMessage(
            "You can compare between doctors, according to the evaluation of other patients"),
        "intro_screen3": MessageLookupByLibrary.simpleMessage(
            "After choosing the doctor that suits you, you can book your appointment online"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "skip": MessageLookupByLibrary.simpleMessage("Skip"),
        "start_now": MessageLookupByLibrary.simpleMessage("Start Now")
      };
}
