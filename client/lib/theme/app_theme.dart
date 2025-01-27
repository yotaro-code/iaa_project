import 'package:flutter/material.dart';
import 'app_colors.dart';

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.light, // 明るいテーマ
    primary: AppColors.primary, // プライマリーカラー
    onPrimary: AppColors.onPrimary, // プライマリー上の文字色

    secondary: AppColors.recordStart, // セカンダリーカラー
    onSecondary: AppColors.onRecordStart, // セカンダリー上の文字色

    surface: AppColors.contentBackground, // サーフェス色 (CardやDialogの背景)
    onSurface: AppColors.onContentBackground, // サーフェス上の文字色

    error: AppColors.recordStop, // エラー色
    onError: AppColors.onRecordStop, // エラー上の文字色

    background: AppColors.background, // 非推奨だが互換性のため追加
    onBackground: AppColors.onBackground, // 非推奨だが互換性のため追加

    // アプリ全体の色が必要なら追加
    primaryContainer: AppColors.primary, // プライマリカラーの補助
    onPrimaryContainer: AppColors.onPrimary,
    secondaryContainer: AppColors.recordStop, // 録音停止用のセカンダリー補助
    onSecondaryContainer: AppColors.onRecordStop,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primary, // AppBarの背景色
    foregroundColor: AppColors.onPrimary, // AppBarの文字色
    titleTextStyle: const TextStyle(
      fontSize: 20.0, // フォントサイズ
      fontWeight: FontWeight.bold, // 太文字
      color: Colors.white, // 文字色
    ),
  ),
  scaffoldBackgroundColor: AppColors.background, // 背景色
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.recordStart,
      foregroundColor: AppColors.onRecordStart,
    ),
  ),
);
