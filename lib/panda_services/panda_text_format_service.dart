import 'package:number_display/number_display.dart';

class PandaTextFormatService {
  String sanitizeHtml(String data) {
    return data.replaceAll('\"', '"').replaceAll('src=" ', 'src="');
  }

  String thousandSeparator(String number) {
    String Function(num?) thousandSeparator = createDisplay(
      decimal: 0,
      separator: ',',
      length: 10,
    );
    return thousandSeparator(double.tryParse(number) ?? 0);
  }

  String fixEmoji(String text) {
    final Pattern unicodePattern = RegExp(r'\\u([0-9A-Fa-f]{4})');
    return text.replaceAll('%u', '\\u').replaceAllMapped(unicodePattern,
        (Match unicodeMatch) {
      final int hexCode = int.parse(unicodeMatch.group(1) ?? '', radix: 16);
      final unicode = String.fromCharCode(hexCode);
      return unicode;
    });
  }

  String cleanAmpersand(String text) {
    return text.replaceAll('amp;', '');
  }
}
