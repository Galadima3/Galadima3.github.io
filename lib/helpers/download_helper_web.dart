// Runs only on Flutter Web
// ignore: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:html' as web;

void triggerDownload(String path, String filename) {
  final anchor = web.AnchorElement(href: path)
    ..setAttribute('download', filename)
    ..click();
}