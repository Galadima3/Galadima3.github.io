// Runs only on Flutter Web

//import 'dart:html' as web;
import 'package:web/web.dart' as web;

// void triggerDownload(String path, String filename) {
//   final anchor = web.AnchorElement(href: path)
//     ..setAttribute('download', filename)
//     ..click();
// }

void triggerDownload(String path, String filename) {
  final _ = web.HTMLAnchorElement()
    ..href = path
    ..download = filename
    ..click();
}