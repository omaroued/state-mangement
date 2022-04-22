import 'package:flutter/material.dart';
import 'package:provider_app/models/theme_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAppModel extends ChangeNotifier{

  bool isLoading=true;
  late ThemeData theme;

  MyAppModel(){
    onLaunch();
  }


  Future<void> onLaunch()async{
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getBool("isDark") ?? false){
      theme=ThemeModel.dark;
    }else{
      theme=ThemeModel.light;
    }


    isLoading=false;
    notifyListeners();
  }

}