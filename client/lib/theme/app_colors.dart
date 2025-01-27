import 'package:flutter/material.dart';

class AppColors {
  // プライマリーカラー (AppBarなどに使用)
  static const Color primary = Color(0xFF0178D4);
  static const Color onPrimary = Colors.white; // プライマリー上の文字色

  // 背景カラー
  static const Color background = Color(0xFFF5F5F5);
  static const Color onBackground = Colors.black; // 背景上の文字色

  // コンテンツ背景カラー (Cardなど)
  static const Color contentBackground = Color(0xFFFFFFFF);
  static const Color onContentBackground = Colors.black; // コンテンツ背景上の文字色

  // 録音関連の色
  static const Color recordStart = Colors.green; // 録音開始ボタン
  static const Color onRecordStart = Colors.white; // 録音開始ボタン上の文字色
  static const Color recordStop = Colors.red; // 録音停止ボタン
  static const Color onRecordStop = Colors.white; // 録音停止ボタン上の文字色
}
