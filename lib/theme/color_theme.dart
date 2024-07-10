import 'package:flutter/material.dart';

import 'color_palette.dart';

@immutable
class ColorTheme extends ThemeExtension<ColorTheme> {
  const ColorTheme({
    required this.background,
    required this.backgroundSecondary,
    required this.backgroundElevated,
    required this.backgroundElevatedSecondary,
    required this.txtPrimary,
    required this.txtSecondary,
    required this.txtThird,
    required this.dividerLine,
    required this.surface25,
    required this.surface50,
    required this.surface75,
    required this.surface100,
    required this.surface200,
    required this.surface300,
    required this.surface400,
    required this.surface500,
    required this.surface700,
    required this.surface800,
    required this.main500,
    required this.green300,
    required this.warning100,
    required this.warning200,
    required this.warning300,
    required this.warning400,
    required this.positive200,
    required this.positive300,
    required this.navigationIcon,
    required this.btnDisabledBg,
    required this.btnDisabledTxt,
    required this.btnPrimaryDefaultBg,
    required this.btnPrimaryDefaultTxt,
    required this.btnPrimaryPressedBg,
    required this.btnPrimaryPressedTxt,
    required this.btnSecondaryDefaultBg,
    required this.btnSecondaryDefaultTxt,
    required this.btnSecondaryPressedBg,
    required this.btnSecondaryPressedTxt,
    required this.btnTertiaryDefaultBg,
    required this.btnTertiaryDefaultTxt,
    required this.btnTertiaryPressedBg,
    required this.btnTertiaryPressedTxt,
    required this.btnNegativeDefaultBg,
    required this.btnNegativeDefaultTxt,
    required this.btnNegativePressedBg,
    required this.btnNegativePressedTxt,
    required this.btnTextButtonBg,
    required this.btnTextButtonTxt,
  });

  static const ColorTheme light = ColorTheme(
    background: ColorPalette.white,
    backgroundSecondary: ColorPalette.lightGray25,
    backgroundElevated: ColorPalette.lightGray25,
    backgroundElevatedSecondary: ColorPalette.white,
    txtPrimary: ColorPalette.lightGray800,
    txtSecondary: ColorPalette.lightGray600,
    txtThird: ColorPalette.white,
    dividerLine: ColorPalette.lightGray50,
    surface25: ColorPalette.lightGray25,
    surface50: ColorPalette.lightGray50,
    surface75: ColorPalette.lightGray75,
    surface100: ColorPalette.lightGray100,
    surface200: ColorPalette.lightGray200,
    surface300: ColorPalette.lightGray300,
    surface400: ColorPalette.lightGray400,
    surface500: ColorPalette.lightGray500,
    surface700: ColorPalette.lightGray700,
    surface800: ColorPalette.lightGray800,
    main500: ColorPalette.lightOrange500,
    green300: ColorPalette.lightGreen300,
    warning100: ColorPalette.lightRed100,
    warning200: ColorPalette.lightRed200,
    warning300: ColorPalette.lightRed300,
    warning400: ColorPalette.lightRed400,
    positive200: ColorPalette.lightBlue200,
    positive300: ColorPalette.lightBlue300,
    navigationIcon: ColorPalette.lightGray900,
    btnDisabledBg: ColorPalette.lightGray100,
    btnDisabledTxt: ColorPalette.white,
    btnPrimaryDefaultBg: ColorPalette.lightOrange500,
    btnPrimaryDefaultTxt: ColorPalette.white,
    btnPrimaryPressedBg: ColorPalette.lightOrange600,
    btnPrimaryPressedTxt: ColorPalette.white,
    btnSecondaryDefaultBg: ColorPalette.lightOrange100,
    btnSecondaryDefaultTxt: ColorPalette.lightOrange500,
    btnSecondaryPressedBg: ColorPalette.lightOrange200,
    btnSecondaryPressedTxt: ColorPalette.lightOrange500,
    btnTertiaryDefaultBg: ColorPalette.lightGray50,
    btnTertiaryDefaultTxt: ColorPalette.lightGray600,
    btnTertiaryPressedBg: ColorPalette.lightGray75,
    btnTertiaryPressedTxt: ColorPalette.lightGray600,
    btnNegativeDefaultBg: ColorPalette.lightRed300,
    btnNegativeDefaultTxt: ColorPalette.white,
    btnNegativePressedBg: ColorPalette.lightRed400,
    btnNegativePressedTxt: ColorPalette.white,
    btnTextButtonBg: ColorPalette.transparent,
    btnTextButtonTxt: ColorPalette.lightGray600,
  );

  final Color background;
  final Color backgroundSecondary;
  final Color backgroundElevated;
  final Color backgroundElevatedSecondary;

  final Color txtPrimary;
  final Color txtSecondary;
  final Color txtThird;

  final Color dividerLine;

  final Color surface25;
  final Color surface50;
  final Color surface75;
  final Color surface100;
  final Color surface200;
  final Color surface300;
  final Color surface400;
  final Color surface500;
  final Color surface700;
  final Color surface800;

  final Color main500;

  final Color green300;

  final Color warning100;
  final Color warning200;
  final Color warning300;
  final Color warning400;

  final Color positive200;
  final Color positive300;

  final Color navigationIcon;

  final Color btnDisabledBg;
  final Color btnDisabledTxt;

  final Color btnPrimaryDefaultBg;
  final Color btnPrimaryDefaultTxt;

  final Color btnPrimaryPressedBg;
  final Color btnPrimaryPressedTxt;

  final Color btnSecondaryDefaultBg;
  final Color btnSecondaryDefaultTxt;

  final Color btnSecondaryPressedBg;
  final Color btnSecondaryPressedTxt;

  final Color btnTertiaryDefaultBg;
  final Color btnTertiaryDefaultTxt;

  final Color btnTertiaryPressedBg;
  final Color btnTertiaryPressedTxt;

  final Color btnNegativeDefaultBg;
  final Color btnNegativeDefaultTxt;

  final Color btnNegativePressedBg;
  final Color btnNegativePressedTxt;

  final Color btnTextButtonBg;
  final Color btnTextButtonTxt;

  @override
  ColorTheme lerp(ColorTheme? other, double t) {
    if (other is! ColorTheme) {
      return this;
    }

    return ColorTheme(
      background: Color.lerp(background, other.background, t)!,
      backgroundSecondary:
          Color.lerp(backgroundSecondary, other.backgroundSecondary, t)!,
      backgroundElevated:
          Color.lerp(backgroundElevated, other.backgroundElevated, t)!,
      backgroundElevatedSecondary: Color.lerp(
        backgroundElevatedSecondary,
        other.backgroundElevatedSecondary,
        t,
      )!,
      txtPrimary: Color.lerp(txtPrimary, other.txtPrimary, t)!,
      txtSecondary: Color.lerp(txtSecondary, other.txtSecondary, t)!,
      txtThird: Color.lerp(txtThird, other.txtThird, t)!,
      dividerLine: Color.lerp(dividerLine, other.dividerLine, t)!,
      surface25: Color.lerp(surface25, other.surface25, t)!,
      surface50: Color.lerp(surface50, other.surface50, t)!,
      surface75: Color.lerp(surface75, other.surface75, t)!,
      surface100: Color.lerp(surface100, other.surface100, t)!,
      surface200: Color.lerp(surface200, other.surface200, t)!,
      surface300: Color.lerp(surface300, other.surface300, t)!,
      surface400: Color.lerp(surface400, other.surface400, t)!,
      surface500: Color.lerp(surface500, other.surface500, t)!,
      surface700: Color.lerp(surface700, other.surface700, t)!,
      surface800: Color.lerp(surface800, other.surface800, t)!,
      main500: Color.lerp(main500, other.main500, t)!,
      green300: Color.lerp(green300, other.green300, t)!,
      warning100: Color.lerp(warning100, other.warning100, t)!,
      warning200: Color.lerp(warning200, other.warning200, t)!,
      warning300: Color.lerp(warning300, other.warning300, t)!,
      warning400: Color.lerp(warning400, other.warning400, t)!,
      positive200: Color.lerp(positive200, other.positive200, t)!,
      positive300: Color.lerp(positive300, other.positive300, t)!,
      navigationIcon: Color.lerp(navigationIcon, other.navigationIcon, t)!,
      btnDisabledBg: Color.lerp(btnDisabledBg, other.btnDisabledBg, t)!,
      btnDisabledTxt: Color.lerp(btnDisabledTxt, other.btnDisabledTxt, t)!,
      btnPrimaryDefaultBg:
          Color.lerp(btnPrimaryDefaultBg, other.btnPrimaryDefaultBg, t)!,
      btnPrimaryDefaultTxt:
          Color.lerp(btnPrimaryDefaultTxt, other.btnPrimaryDefaultTxt, t)!,
      btnPrimaryPressedBg:
          Color.lerp(btnPrimaryPressedBg, other.btnPrimaryPressedBg, t)!,
      btnPrimaryPressedTxt:
          Color.lerp(btnPrimaryPressedTxt, other.btnPrimaryPressedTxt, t)!,
      btnSecondaryDefaultBg:
          Color.lerp(btnSecondaryDefaultBg, other.btnSecondaryDefaultBg, t)!,
      btnSecondaryDefaultTxt:
          Color.lerp(btnSecondaryDefaultTxt, other.btnSecondaryDefaultTxt, t)!,
      btnSecondaryPressedBg:
          Color.lerp(btnSecondaryPressedBg, other.btnSecondaryPressedBg, t)!,
      btnSecondaryPressedTxt:
          Color.lerp(btnSecondaryPressedTxt, other.btnSecondaryPressedTxt, t)!,
      btnTertiaryDefaultBg:
          Color.lerp(btnTertiaryDefaultBg, other.btnTertiaryDefaultBg, t)!,
      btnTertiaryDefaultTxt:
          Color.lerp(btnTertiaryDefaultTxt, other.btnTertiaryDefaultTxt, t)!,
      btnTertiaryPressedBg:
          Color.lerp(btnTertiaryPressedBg, other.btnTertiaryPressedBg, t)!,
      btnTertiaryPressedTxt:
          Color.lerp(btnTertiaryPressedTxt, other.btnTertiaryPressedTxt, t)!,
      btnNegativeDefaultBg:
          Color.lerp(btnNegativeDefaultBg, other.btnNegativeDefaultBg, t)!,
      btnNegativeDefaultTxt:
          Color.lerp(btnNegativeDefaultTxt, other.btnNegativeDefaultTxt, t)!,
      btnNegativePressedBg:
          Color.lerp(btnNegativePressedBg, other.btnNegativePressedBg, t)!,
      btnNegativePressedTxt:
          Color.lerp(btnNegativePressedTxt, other.btnNegativePressedTxt, t)!,
      btnTextButtonBg: Color.lerp(btnTextButtonBg, other.btnTextButtonBg, t)!,
      btnTextButtonTxt:
          Color.lerp(btnTextButtonTxt, other.btnTextButtonTxt, t)!,
    );
  }

  @override
  ColorTheme copyWith({
    Color? background,
    Color? backgroundSecondary,
    Color? backgroundElevated,
    Color? backgroundElevatedSecondary,
    Color? txtPrimary,
    Color? txtSecondary,
    Color? txtThird,
    Color? dividerLine,
    Color? surface25,
    Color? surface50,
    Color? surface75,
    Color? surface100,
    Color? surface200,
    Color? surface300,
    Color? surface400,
    Color? surface500,
    Color? surface700,
    Color? surface800,
    Color? main500,
    Color? green300,
    Color? warning100,
    Color? warning200,
    Color? warning300,
    Color? warning400,
    Color? positive100,
    Color? positive200,
    Color? positive300,
    Color? navigationIcon,
    Color? btnDisabledBg,
    Color? btnDisabledTxt,
    Color? btnPrimaryDefaultBg,
    Color? btnPrimaryDefaultTxt,
    Color? btnPrimaryPressedBg,
    Color? btnPrimaryPressedTxt,
    Color? btnSecondaryDefaultBg,
    Color? btnSecondaryDefaultTxt,
    Color? btnSecondaryPressedBg,
    Color? btnSecondaryPressedTxt,
    Color? btnTertiaryDefaultBg,
    Color? btnTertiaryDefaultTxt,
    Color? btnTertiaryPressedBg,
    Color? btnTertiaryPressedTxt,
    Color? btnNegativeDefaultBg,
    Color? btnNegativeDefaultTxt,
    Color? btnNegativePressedBg,
    Color? btnNegativePressedTxt,
    Color? btnTextButtonBg,
    Color? btnTextButtonTxt,
  }) =>
      ColorTheme(
        background: background ?? this.background,
        backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
        backgroundElevated: backgroundElevated ?? this.backgroundElevated,
        backgroundElevatedSecondary:
            backgroundElevatedSecondary ?? this.backgroundElevatedSecondary,
        txtPrimary: txtPrimary ?? this.txtPrimary,
        txtSecondary: txtSecondary ?? this.txtSecondary,
        txtThird: txtThird ?? this.txtThird,
        dividerLine: dividerLine ?? this.dividerLine,
        surface25: surface25 ?? this.surface25,
        surface50: surface50 ?? this.surface50,
        surface75: surface75 ?? this.surface75,
        surface100: surface100 ?? this.surface100,
        surface200: surface200 ?? this.surface200,
        surface300: surface300 ?? this.surface300,
        surface400: surface400 ?? this.surface400,
        surface500: surface500 ?? this.surface500,
        surface700: surface700 ?? this.surface700,
        surface800: surface800 ?? this.surface800,
        main500: main500 ?? this.main500,
        green300: green300 ?? this.green300,
        warning100: warning100 ?? this.warning100,
        warning200: warning200 ?? this.warning200,
        warning300: warning300 ?? this.warning300,
        warning400: warning400 ?? this.warning400,
        positive200: positive200 ?? this.positive200,
        positive300: positive300 ?? this.positive300,
        navigationIcon: navigationIcon ?? this.navigationIcon,
        btnDisabledBg: btnDisabledBg ?? this.btnDisabledBg,
        btnDisabledTxt: btnDisabledTxt ?? this.btnDisabledTxt,
        btnPrimaryDefaultBg: btnPrimaryDefaultBg ?? this.btnPrimaryDefaultBg,
        btnPrimaryDefaultTxt: btnPrimaryDefaultTxt ?? this.btnPrimaryDefaultTxt,
        btnPrimaryPressedBg: btnPrimaryPressedBg ?? this.btnPrimaryPressedBg,
        btnPrimaryPressedTxt: btnPrimaryPressedTxt ?? this.btnPrimaryPressedTxt,
        btnSecondaryDefaultBg:
            btnSecondaryDefaultBg ?? this.btnSecondaryDefaultBg,
        btnSecondaryDefaultTxt:
            btnSecondaryDefaultTxt ?? this.btnSecondaryDefaultTxt,
        btnSecondaryPressedBg:
            btnSecondaryPressedBg ?? this.btnSecondaryPressedBg,
        btnSecondaryPressedTxt:
            btnSecondaryPressedTxt ?? this.btnSecondaryPressedTxt,
        btnTertiaryDefaultBg: btnTertiaryDefaultBg ?? this.btnTertiaryDefaultBg,
        btnTertiaryDefaultTxt:
            btnTertiaryDefaultTxt ?? this.btnTertiaryDefaultTxt,
        btnTertiaryPressedBg: btnTertiaryPressedBg ?? this.btnTertiaryPressedBg,
        btnTertiaryPressedTxt:
            btnTertiaryPressedTxt ?? this.btnTertiaryPressedTxt,
        btnNegativeDefaultBg: btnNegativeDefaultBg ?? this.btnNegativeDefaultBg,
        btnNegativeDefaultTxt:
            btnNegativeDefaultTxt ?? this.btnNegativeDefaultTxt,
        btnNegativePressedBg: btnNegativePressedBg ?? this.btnNegativePressedBg,
        btnNegativePressedTxt:
            btnNegativePressedTxt ?? this.btnNegativePressedTxt,
        btnTextButtonBg: btnTextButtonBg ?? this.btnTextButtonBg,
        btnTextButtonTxt: btnTextButtonTxt ?? this.btnTextButtonTxt,
      );
}
