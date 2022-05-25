import 'package:flutter/material.dart';

class PandaScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final Widget body;
  final Widget? bottomSheet;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  const PandaScaffold({
    Key? key,
    this.appBar,
    this.backgroundColor,
    required this.body,
    this.bottomSheet,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.floatingActionButtonLocation,
    this.resizeToAvoidBottomInset,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      }),
      child: Scaffold(
        key: key,
        appBar: appBar,
        floatingActionButtonLocation: floatingActionButtonLocation,
        backgroundColor: backgroundColor,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        bottomSheet: bottomSheet,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        body: body,
      ),
    );
  }
}
