import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:panda_flutter_ui/panda_flutter_ui.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class PandaHtmlView extends StatelessWidget {
  final String data;
  final Color? accentColor;
  final Color? textColor;
  final Color? pTagColor;
  final Color? borderColor;

  final double? fontSize;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final Function(String? url)? onLinkTap;
  final bool isRemoveBodyPadding;

  const PandaHtmlView({
    Key? key,
    required this.data,
    this.accentColor,
    this.textColor,
    this.pTagColor,
    this.borderColor,
    this.fontSize,
    this.textAlign,
    this.fontWeight = FontWeight.normal,
    this.onLinkTap,
    this.isRemoveBodyPadding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PandaTextFormatService _textFormatService = PandaTextFormatService();
    // return Container();
    return HtmlWidget(
      _textFormatService.fixEmoji(
        _textFormatService.cleanAmpersand(
          _textFormatService.sanitizeHtml(data),
        ),
      ),
      onTapUrl: (url) {
        if (onLinkTap != null) {
          onLinkTap!(url);
          return true;
        } else {
          return false;
        }
      },
      // style: {
      //   "*": Style(
      //     textAlign: textAlign,
      //     margin: Margins.zero,
      //   ),
      //   "h1": Style(
      //     margin: Margins.only(bottom: 15),
      //     textDecorationColor: textColor,
      //     fontSize: FontSize(30),
      //     color: textColor,
      //     textAlign: textAlign,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   "h2": Style(
      //     margin: Margins.only(bottom: 15),
      //     textDecorationColor: textColor,
      //     fontSize: FontSize(25),
      //     color: textColor,
      //     textAlign: textAlign,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   "h3": Style(
      //     margin: Margins.only(bottom: 15),
      //     textDecorationColor: textColor,
      //     fontSize: FontSize(22),
      //     color: textColor,
      //     textAlign: textAlign,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   "h4": Style(
      //     margin: Margins.only(bottom: 15),
      //     textDecorationColor: textColor,
      //     fontSize: FontSize(20),
      //     color: textColor,
      //     textAlign: textAlign,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   "h5": Style(
      //     margin: Margins.only(bottom: 15),
      //     textDecorationColor: textColor,
      //     fontSize: FontSize(18),
      //     color: textColor,
      //     textAlign: textAlign,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   "h6": Style(
      //     margin: Margins.only(bottom: 15),
      //     textDecorationColor: textColor,
      //     fontSize: FontSize(15),
      //     color: textColor,
      //     textAlign: textAlign,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   "p": Style(
      //     margin: Margins.only(bottom: 15),
      //     textDecorationColor: textColor,
      //     fontSize: FontSize(fontSize ?? 15),
      //     color: textColor,
      //     textAlign: textAlign,
      //     fontWeight: fontWeight,
      //   ),
      //   "a": Style(
      //     margin: Margins.all(0),
      //     textDecorationColor: textColor,
      //     fontSize: FontSize(fontSize ?? 15),
      //     color: accentColor,
      //     textAlign: textAlign,
      //     fontWeight: fontWeight,
      //   ),
      //   "table": Style(
      //       // backgroundColor: const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
      //       ),
      //   // some other granular customizations are also possible
      //   "tr": Style(
      //     border: Border(
      //       bottom: BorderSide(
      //         color: borderColor ?? Colors.grey,
      //       ),
      //     ),
      //   ),
      //   "th": Style(
      //     padding: HtmlPaddings.all(10),
      //     backgroundColor: Colors.grey,
      //   ),
      //   "td": Style(
      //     padding: HtmlPaddings.all(10),
      //     alignment: Alignment.topLeft,
      //   ),
      //   "body": isRemoveBodyPadding
      //       ? Style(
      //           // margin: EdgeInsets.zero,
      //           margin: Margins.zero,
      //           // padding: EdgeInsets.zero,
      //           padding: HtmlPaddings.zero,
      //         )
      //       : Style()
      // },
    );
  }
}
