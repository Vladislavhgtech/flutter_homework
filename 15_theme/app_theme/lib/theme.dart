import 'package:flutter/material.dart';

ThemeData _themeLight = ThemeData.light();
ThemeData _themeDart = ThemeData.dark();



ThemeData themeLight = _themeLight.copyWith(
  colorScheme: _colorScheme(_themeLight.colorScheme),
  primaryColorDark: Colors.deepOrange[100],
  primaryColorLight: Colors.deepOrange[100],
  primaryIconTheme: _primaryIconThemeData(_themeLight.primaryIconTheme),
  unselectedWidgetColor: Colors.deepOrange[100],
  inputDecorationTheme: _inputDecorationTheme(_themeLight.inputDecorationTheme),
  appBarTheme: _appBarTheme(_themeLight.appBarTheme),
  bottomNavigationBarTheme: _bottomNavigationBarThemeData(_themeLight.bottomNavigationBarTheme),
  cardTheme: _cardTheme(_themeLight.cardTheme),
  buttonTheme: _buttonThemeData(_themeLight.buttonTheme),
  chipTheme: _chipTheme(_themeLight.chipTheme),
  dialogTheme: _dialogTheme(_themeLight.dialogTheme),
  radioTheme: _radioThemeData(_themeLight.radioTheme),
);

ColorScheme _colorScheme (ColorScheme base){
  return base.copyWith(
    primary: Colors.black54,
    secondary: Colors.black54,
  );
}

IconThemeData _primaryIconThemeData (IconThemeData base){
  return base.copyWith(
    color: Colors.black54
  );
}

InputDecorationTheme _inputDecorationTheme(InputDecorationTheme base){
  return base.copyWith(
    labelStyle: TextStyle(color: Colors.black54),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black54),
    )
  );
}

RadioThemeData _radioThemeData(RadioThemeData base){
  return base.copyWith();
}

DialogTheme _dialogTheme(DialogTheme base){
  return base.copyWith(
    elevation: 10.0
  );
}

ButtonThemeData _buttonThemeData(ButtonThemeData base){
  return base.copyWith(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))
    ),
    buttonColor: Colors.deepOrange[100],
    height: 30
  );
}

ChipThemeData _chipTheme(ChipThemeData base){
  return base.copyWith(
    checkmarkColor: Colors.deepOrange[100],
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5))
    ),
    backgroundColor: Colors.black54,
    selectedColor: Colors.deepOrange[100],
    labelStyle: TextStyle(color: Colors.white),
    disabledColor: Colors.black54,
  );
}

AppBarTheme _appBarTheme(AppBarTheme base){
  return base.copyWith(
    color: Colors.black54,
    titleTextStyle: TextStyle(color: Colors.deepOrange[100], fontSize: 20),
    iconTheme: IconThemeData(color: Colors.deepOrange[100]),
    textTheme: _textTheme (_themeLight.textTheme),
  );
}

TextTheme _textTheme(TextTheme base){
  return base.copyWith(
    subtitle1: TextStyle(
      color: Colors.deepOrange[100]
    ),
    subtitle2: TextStyle(
        color: Colors.deepOrange[100]
    ),
  );
}

BottomNavigationBarThemeData _bottomNavigationBarThemeData(BottomNavigationBarThemeData base){
  return base.copyWith(
      backgroundColor: Colors.black54,
      selectedItemColor: Colors.deepOrange[100]
  );
}

// CircleAvatar _circleAvatar(CircleAvatar base){
//   return base;
// }

CardTheme _cardTheme(CardTheme base){
  return base.copyWith(
    color: Colors.deepOrange[100],
    shadowColor: Colors.blueGrey,
    elevation: 20,
    margin: EdgeInsets.all(10),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))
    ),
  );
}




