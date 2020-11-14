import 'package:shared_preferences/shared_preferences.dart';

class UserDataService {
  Future<String> getUUID() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getString('UUID');
  }

  void setUUID(String val) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('UUID', val);
  }

  void addContact(String val) async {
    final prefs = await SharedPreferences.getInstance();
    var contacts = prefs.getStringList('contacts');
    contacts = contacts ?? <String>[];
    contacts.add(val);

    await prefs.setStringList('contacts', contacts);
  }

  Future<List<String>> getContacts() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getStringList('contacts');
  }
}
