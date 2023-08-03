import 'dart:io';

class WMCtrlWrapper {
  static Future<List<String>> getWindows() async {
    final result = (await Process.run('wmctrl', ['-xl'])).stdout.toString();
    var lines =
        result.split('\n').where((element) => element.isNotEmpty).toList();

    var regex = RegExp(r'(?<=\.)(.*)(?=\s\s)');

    var windows = lines.map((line) => (regex.firstMatch(line)![0] ?? '')
        .trimRight()
        .replaceAll(' ', '-')
        .toLowerCase());

    return windows.where((window) => window.isNotEmpty).toList();
  }
}
