import 'package:flutter/foundation.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class KeyboardVisibilityNotifier with ChangeNotifier {
  bool _isKeyboardVisible = false;

  bool get isKeyboardVisible => _isKeyboardVisible;

  // Constructor to initialize and listen for keyboard visibility changes
  KeyboardVisibilityNotifier() {
    final keyboardVisibilityController = KeyboardVisibilityController();

    // Set the initial keyboard visibility status
    // _isKeyboardVisible = keyboardVisibilityController.isKeyboardVisible;

    // Listen for changes in keyboard visibility
    keyboardVisibilityController.onChange.listen((bool isVisible) {
      _isKeyboardVisible = isVisible;
      notifyListeners(); // Notify listeners when visibility changes
    });
  }
}
