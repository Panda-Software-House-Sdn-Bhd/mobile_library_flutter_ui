import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:panda_flutter_ui/panda_flutter_ui.dart';

class PandaTextFormField extends StatefulWidget {
  final GlobalKey<FormFieldState>? textEditingKey;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final String hintText;
  final TextInputType textInputType;
  final Function? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final Function(String)? onFieldSubmitted;
  final TextInputAction textInputAction;
  final Function? validator;
  final Function(String)? onChanged;
  final bool isHideInlineErrorMessage;
  final bool isEnabled;
  final bool isForcedCamelcase;
  final bool isForcedUppercase;
  final IconData? trailingIcon;
  final IconData? leadingIcon;
  final String? leadingSvgPath;
  final String? trailingSvgPath;
  final Function()? trailingAction;
  final Function()? leadingAction;
  final String errorMessage;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool autofocus;
  final Function(String?)? onSaved;
  final Function()? onTap;
  final Brightness? keyboardAppearance;
  final bool obscureText;
  final bool readOnly;
  final bool isCircularDesign;
  final double circularDesignBorderRadius;
  final int textAreaMaxLine;
  final int textAreaMinLine;
  final double fontSize;
  final double iconSize;
  final bool isHideTextFieldBottomLine;
  final String? initialValue;
  final Color? textColor;

  const PandaTextFormField({
    Key? key,
    this.textEditingKey,
    this.textEditingController,
    this.textInputAction = TextInputAction.done,
    this.focusNode,
    this.hintText = '',
    this.textInputType = TextInputType.text,
    this.inputFormatters,
    this.autofillHints,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onChanged,
    this.validator,
    this.isHideInlineErrorMessage = true,
    this.isEnabled = true,
    this.isForcedCamelcase = false,
    this.isForcedUppercase = false,
    this.trailingAction,
    this.leadingAction,
    this.trailingIcon,
    this.leadingIcon,
    this.leadingSvgPath,
    this.trailingSvgPath,
    this.errorMessage = '',
    this.backgroundColor,
    this.foregroundColor,
    this.autofocus = false,
    this.obscureText = false,
    this.readOnly = false,
    this.onSaved,
    this.onTap,
    this.keyboardAppearance,
    this.isCircularDesign = false,
    this.circularDesignBorderRadius = 40,
    this.textAreaMaxLine = 1,
    this.textAreaMinLine = 1,
    this.fontSize = 15,
    this.iconSize = 20,
    this.isHideTextFieldBottomLine = false,
    this.initialValue,
    this.textColor,
  }) : super(key: key);

  @override
  _PandaTextFormFieldState createState() => _PandaTextFormFieldState();
}

class _PandaTextFormFieldState extends State<PandaTextFormField> {
  @override
  Widget build(BuildContext context) {
    //leading icon
    Widget? leadingIcon =
        widget.trailingIcon != null || widget.leadingSvgPath != null
            ? PandaIconButton(
                iconData: widget.trailingIcon,
                customSvgPath: widget.leadingSvgPath,
                buttonColor: widget.foregroundColor,
                iconSize: widget.iconSize,
                onPressed: null,
                // margin: widget.isCircularDesign
                //     ? const EdgeInsets.only(left: 20)
                //     : const EdgeInsets.all(0),
              )
            : null;
    //trailing icon
    Widget? trailingIcon =
        widget.leadingIcon != null || widget.trailingSvgPath != null
            ? PandaIconButton(
                iconData: widget.leadingIcon,
                customSvgPath: widget.trailingSvgPath,
                buttonColor: widget.foregroundColor,
                iconSize: widget.iconSize,
                // margin: widget.isCircularDesign
                //     ? const EdgeInsets.only(right: 20)
                //     : const EdgeInsets.all(0),
                onPressed: widget.trailingAction,
              )
            : null;
    //Input decoration
    InputDecoration inputDecoration = InputDecoration(
      prefixIcon: leadingIcon,
      suffixIcon: trailingIcon,
      prefixIconConstraints: BoxConstraints.tight(Size(
        widget.iconSize + 30,
        widget.iconSize + 6,
      )),
      suffixIconConstraints: BoxConstraints.tight(Size(
        widget.iconSize + 30,
        widget.iconSize + 6,
      )),
      errorStyle: widget.isHideInlineErrorMessage
          ? const TextStyle(height: 0, fontSize: 0)
          : const TextStyle(),
      hintStyle: TextStyle(
        fontSize: widget.fontSize,
        // color: widget.isEnabled
        //     ? (widget.foregroundColor != null)
        //         ? widget.foregroundColor
        //         : themeModel.subtitleColor
        //     : themeModel.disableColor,
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: widget.isCircularDesign ? 10 : 0,
        vertical: widget.isCircularDesign ? 15 : 5,
      ),
      isDense: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: widget.isCircularDesign
          ? InputBorder.none
          : const UnderlineInputBorder(
              // borderSide: BorderSide(
              //   color: widget.isHideTextFieldBottomLine
              //       ? Colors.transparent
              //       : themeModel.inactiveColor,
              // ),
              ),
      focusedBorder: widget.isCircularDesign
          ? InputBorder.none
          : const UnderlineInputBorder(
              borderSide: BorderSide(
                  // color: widget.isHideTextFieldBottomLine
                  //     ? Colors.transparent
                  //     : themeModel.themeColor,
                  ),
            ),
      enabledBorder: widget.isCircularDesign
          ? InputBorder.none
          : const UnderlineInputBorder(
              // borderSide: BorderSide(
              //   color: widget.isHideTextFieldBottomLine
              //       ? Colors.transparent
              //       : themeModel.inactiveColor,
              // ),
              ),
      errorBorder: widget.isCircularDesign
          ? InputBorder.none
          : const UnderlineInputBorder(
              // borderSide: BorderSide(
              //   color: widget.isHideTextFieldBottomLine
              //       ? Colors.transparent
              //       : themeModel.dangerColor,
              // ),
              ),
      disabledBorder: widget.isCircularDesign
          ? InputBorder.none
          : const UnderlineInputBorder(
              // borderSide: BorderSide(
              //   color: widget.isHideTextFieldBottomLine
              //       ? Colors.transparent
              //       : themeModel.disableColor,
              // ),
              ),
      hintText: widget.hintText,
    );
    return Container(
      decoration: widget.isCircularDesign
          ? BoxDecoration(
              color: widget.backgroundColor,
              border: Border.all(
                color: widget.foregroundColor ?? const Color(0xFF000000),
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(
                widget.circularDesignBorderRadius,
              ),
            )
          : null,
      child: TextFormField(
        controller: widget.textEditingController,
        key: widget.textEditingKey,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        enabled: widget.isEnabled,
        initialValue: widget.initialValue,
        keyboardAppearance: widget.keyboardAppearance,
        textCapitalization: widget.isForcedUppercase
            ? TextCapitalization.characters
            : widget.isForcedCamelcase
                ? TextCapitalization.words
                : TextCapitalization.none,
        onEditingComplete: widget.onEditingComplete == null
            ? null
            : () => widget.onEditingComplete,
        style: TextStyle(
          color: widget.textColor,
        ),
        onChanged: widget.onChanged,
        inputFormatters: widget.inputFormatters,
        readOnly: widget.readOnly,
        onTap: widget.onTap,
        onSaved: widget.onSaved,
        keyboardType: widget.textInputType,
        obscureText: widget.obscureText,
        validator: widget.validator == null
            ? null
            : (value) => widget.validator!(value),
        textInputAction: widget.textInputAction,
        onFieldSubmitted: widget.onFieldSubmitted,
        maxLines: widget.textAreaMaxLine,
        minLines: widget.textAreaMinLine,
        cursorColor: widget.foregroundColor,
        decoration: inputDecoration,
      ),
    );
  }
}
