import 'package:flutter/material.dart';
import 'package:notes_app/themes/theme.dart';

class ThemeProvider extends ChangeNotifier{
  //initially the theme of the app will be in a light Mode 
  ThemeData _themeData=lightMode;
  //getter methods for accessing the them 
  ThemeData get themeData=>_themeData; 
  // boolean getter method for checking if its in dark mode or not 
  bool get isDarkMode=> _themeData==darkMode;
  //setter method 

  setThemeData(ThemeData themeData){
    _themeData=themeData;
    notifyListeners();
  }

  //toggle method that we will use in a Switch later on 
  toggleTheme(){
    if(_themeData==lightMode){
      setThemeData(darkMode);
    }
    else{
      setThemeData(lightMode);
    }
  }

}