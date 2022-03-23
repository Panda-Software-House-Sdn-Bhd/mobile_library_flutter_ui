import 'package:number_display/number_display.dart';

class TextViewService {
  String thousandSeparator(String number) {
    String Function(num?) thousandSeparator = createDisplay(
      decimal: 0,
      separator: ',',
      length: 10,
    );
    return thousandSeparator(double.tryParse(number) ?? 0);
  }
}
