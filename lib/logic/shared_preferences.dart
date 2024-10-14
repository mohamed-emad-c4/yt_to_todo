import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceClass {
  // حفظ قيمة من نوع bool
  Future<void> saveValueBool({required bool value, required String key}) async {
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setBool(key, value);
    } catch (e) {
      print('خطأ في حفظ قيمة bool: $e');
    }
  }

  // حفظ قيمة من نوع String
  Future<void> saveValueString({required String value, required String key}) async {
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString(key, value);
    } catch (e) {
      print('خطأ في حفظ قيمة String: $e');
    }
  }

  // حفظ قيمة من نوع int
  Future<void> saveValueInt({required int value, required String key}) async {
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setInt(key, value);
    } catch (e) {
      print('خطأ في حفظ قيمة int: $e');
    }
  }

  // استرجاع قيمة
  Future<dynamic> getValue({required String key, required dynamic defaultValue}) async {
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      dynamic value = pref.get(key) ?? defaultValue;
      return value;
    } catch (e) {
      print('خطأ في استرجاع القيمة: $e');
      return defaultValue; // إرجاع القيمة الافتراضية في حالة حدوث خطأ
    }
  }
}
