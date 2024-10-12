import 'package:shared_preferences/shared_preferences.dart';

import '../../app.dart';

class LocalStorageImpl implements LocalStorage {
  late final SharedPreferences prefs;

  @override
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<void> clear() async => await prefs.clear();

  @override
  bool contains(String key) => prefs.containsKey(key);

  @override
  P? read<P>(String key) {
    switch (P) {
      case const (String):
        return prefs.getString(key) as P?;
      case const (int):
        return prefs.getInt(key) as P?;
      case const (bool):
        return prefs.getBool(key) as P?;
      case const (double):
        return prefs.getDouble(key) as P?;
      case const (List<String>):
        return prefs.getStringList(key) as P?;
      default:
        return null;
    }
  }

  @override
  Future<void> remove(String key) async => await prefs.remove(key);

  @override
  Future<void> write<P>(String key, P value) async {
    switch (P) {
      case const (String):
        await prefs.setString(key, value as String);
        break;
      case const (int):
        await prefs.setInt(key, value as int);
        break;
      case const (bool):
        await prefs.setBool(key, value as bool);
        break;
      case const (double):
        await prefs.setDouble(key, value as double);
        break;
      case const (List<String>):
        await prefs.setStringList(key, value as List<String>);
        break;
      default:
        throw Exception('Type not supported');
    }
  }
}
