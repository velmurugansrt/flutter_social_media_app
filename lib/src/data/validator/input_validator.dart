import 'package:flutter/services.dart';
import 'package:flutter_social_media_app/src/data/validator/length_limiting_textfield_formatter_fixed.dart';

class InputValidator {
  static List<TextInputFormatter> maxLength(count) {
    return <TextInputFormatter>[
      LengthLimitingTextFieldFormatterFixed(count),
    ];
  }
}
