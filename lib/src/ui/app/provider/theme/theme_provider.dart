import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
class ThemeNotifier extends _$ThemeNotifier {
  late SharedPreferences prefs;

  @override
  bool build() => false;

  Future _init() async {
    prefs = await SharedPreferences.getInstance();
    var darkMode = prefs.getBool("darkMode");
    state = darkMode ?? false;
  }

  ThemeNotifier() : super() {
    _init();
  }

  void toggle() async {
    state = !state;
    await prefs.setBool("darkMode", state);
  }
}
