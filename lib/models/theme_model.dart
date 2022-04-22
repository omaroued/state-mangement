import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModel extends ChangeNotifier{

  static ThemeData dark=ThemeData.dark();
  static ThemeData light=ThemeData.light();


  ThemeData currentTheme;
  ThemeModel({required this.currentTheme});



  bool get isDark=>currentTheme.brightness==Brightness.dark;


  void changeTheme(ThemeData theme)async{
    currentTheme=theme;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();

    prefs.setBool("isDark", isDark);

  }




}