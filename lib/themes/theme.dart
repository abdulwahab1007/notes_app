
import 'package:flutter/material.dart';

ThemeData lightMode=ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: const Color.fromARGB(255, 218, 215, 215),
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade400,
    inversePrimary: Colors.grey.shade800,

  )
  
);

ThemeData darkMode=ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: const Color.fromARGB(255, 20, 20, 20),
    primary: const Color.fromARGB(255, 33, 33, 33),
    secondary: const Color.fromARGB(255, 68, 68, 68),
    inversePrimary: Colors.grey.shade300,
    
  )
  
);