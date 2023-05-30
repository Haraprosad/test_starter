import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension TextS on String {
  Widget toText({TextStyle style = const TextStyle()}) {
    return Text(
      this,
      style: style,
    );
  }
}

extension Nums on String {
  // to int
  int toInt() => int.parse(trim());

  //this double
  double toDouble() => double.parse(trim());
}

extension SP on String {
  // use get and set
  Future<bool?> get spGetBool async =>
      SharedPreferences.getInstance().then((value) => value.getBool(this));
  Future<int?> get spGetInt async =>
      SharedPreferences.getInstance().then((value) => value.getInt(this));
  Future<double?> get spGetDouble async =>
      SharedPreferences.getInstance().then((value) => value.getDouble(this));
  Future<String?> get spGetStr async =>
      SharedPreferences.getInstance().then((value) => value.getString(this));
  Future<List<String>?> get spGetStrList async =>
      SharedPreferences.getInstance()
          .then((value) => value.getStringList(this));
  Future<Object?> get spGetObject async =>
      SharedPreferences.getInstance().then((value) => value.get(this));

  void spBoolSet(bool value) {
    SharedPreferences.getInstance().then((sp) => sp.setBool(this, value));
  }

  void spIntSet(int value) {
    SharedPreferences.getInstance().then((sp) => sp.setInt(this, value));
  }

  void spDoubleSet(double value) {
    SharedPreferences.getInstance().then((sp) => sp.setDouble(this, value));
  }

  void spStringSet(String value) {
    SharedPreferences.getInstance().then((sp) => sp.setString(this, value));
  }

  void spStringListSet(List<String> value) {
    SharedPreferences.getInstance().then((sp) => sp.setStringList(this, value));
  }
}

extension FS on String {
  Future<String?> get fsRead async =>
      await const FlutterSecureStorage().read(key: this);

  set fsWrite(String value) =>
      const FlutterSecureStorage().write(key: this, value: value);
}
