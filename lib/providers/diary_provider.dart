import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/diary_entry.dart';


class DiaryProvider with ChangeNotifier {
  List<DiaryEntry> _entries = [];
  bool _isDarkMode = false;

  List<DiaryEntry> get entries => _entries;
  bool get isDarkMode => _isDarkMode;

  DiaryProvider() {
    _loadEntries();
  }

  Future<void> _loadEntries() async {
    final prefs = await SharedPreferences.getInstance();
    final entriesString = prefs.getString('entries');
    if (entriesString != null) {
      final List<dynamic> entriesJson = jsonDecode(entriesString);
      _entries = entriesJson.map((e) => DiaryEntry.fromJson(e)).toList();
      notifyListeners();
    }
  }

  Future<void> _saveEntries() async {
    final prefs = await SharedPreferences.getInstance();
    final entriesJson = _entries.map((e) => e.toJson()).toList();
    await prefs.setString('entries', jsonEncode(entriesJson));
  }

  void addEntry(DiaryEntry entry) {
    _entries.add(entry);
    _saveEntries();
    notifyListeners();
  }

  void updateEntry(DiaryEntry entry) {
    final index = _entries.indexWhere((e) => e.id == entry.id);
    if (index != -1) {
      _entries[index] = entry;
      _saveEntries();
      notifyListeners();
    }
  }

  void deleteEntry(int id) {
    _entries.removeWhere((entry) => entry.id == id);
    _saveEntries();
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
