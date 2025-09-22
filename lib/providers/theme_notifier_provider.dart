import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends Notifier<bool> {
  @override
  build() => true;

  void toggleTheme (){
    state = !state;
  }
}

final themeNotifierProvider = NotifierProvider<ThemeNotifier, bool>(ThemeNotifier.new);
