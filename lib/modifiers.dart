library modifiers;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modifiers/navigation.dart';

export 'package:modifiers/navigation.dart';

extension PaddingModifers on Widget {
  Widget padding(double all) {
    return Padding(
      padding: EdgeInsets.all(all),
      child: this,
    );
  }

  Widget paddingOnly({double left, double right, double top, double bottom}) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        right: right,
        top: top,
        bottom: bottom,
      ),
      child: this,
    );
  }

  Widget paddingInsets(EdgeInsets insets) {
    return Padding(
      padding: insets,
      child: this,
    );
  }
}

extension ColorModifers on Widget {
  Widget backgroundColor(Color color) {
    return DecoratedBox(
      decoration: BoxDecoration(color: color),
      child: this,
    );
  }

  Widget forgroundColor(Color color) {
    return DefaultTextStyle(
      style: TextStyle(color: color),
      child: this,
    );
  }

  Widget overlay(
    Widget overlay, [
    Alignment alignment = Alignment.center,
  ]) {
    return Stack(
      alignment: alignment,
      children: <Widget>[
        this,
        overlay,
      ],
    );
  }
}

extension LayoutModifers on Widget {
  Widget frame({
    double width,
    double height,
    Alignment alignment: Alignment.center,
  }) {
    Widget content = this;
    if (alignment != null) {
      content = Align(
        alignment: alignment,
        child: this,
      );
    }
    return SizedBox(
      width: width,
      height: height,
      child: content,
    );
  }

  Widget frameConstrained({
    double minWidth,
    double idealWidth,
    double maxWidth,
    double minHeight,
    double idealHeight,
    double maxHeight,
    Alignment alignment,
  }) {
    Widget content = this;
    if (alignment != null) {
      content = Align(
        alignment: alignment,
        child: this,
      );
    }
    final box = ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
      ),
      child: content,
    );

    if (idealWidth != null || idealHeight != null) {
      return SizedBox(
        width: idealWidth,
        height: idealHeight,
        child: box,
      );
    }

    return box;
  }

  Widget offset(Offset offset) {
    return Transform.translate(
      offset: offset,
      child: this,
    );
  }

  Widget offsetOnly({double x = 0.0, double y = 0.0}) {
    return Transform.translate(
      offset: Offset(x, y),
      child: this,
    );
  }
}

extension BorderModifiers on Widget {
  Widget border(Border style) {
    return DecoratedBox(
      decoration: BoxDecoration(border: style),
      child: this,
    );
  }
}

extension RenderingModifiers on Widget {
  Widget clipped(Clip clipBehavior) {
    return ClipRect(
      child: this,
      clipBehavior: clipBehavior,
    );
  }

  Widget clipShape<T extends CustomClipper<Rect>>(
    T clipper,
    Clip clipBehavior,
  ) {
    return ClipRect(
      child: this,
      clipper: clipper,
      clipBehavior: clipBehavior,
    );
  }

  Widget corderRadius(double radius) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: this,
    );
  }

  Widget mask(Shader Function(Rect bounds) mask) {
    return ShaderMask(
      shaderCallback: (Rect bounds) => mask(bounds),
      child: this,
    );
  }

  Widget opacity(double opacity) {
    return Opacity(opacity: opacity, child: this);
  }

  Widget shadow(
    Color color,
    double radius, {
    double blur,
    double x = 0.0,
    double y = 0.0,
  }) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: blur,
            spreadRadius: radius,
            color: color,
            offset: Offset(x, y),
          ),
        ],
      ),
      child: this,
    );
  }
}

extension TextModifiers on Text {
  Widget font({
    double size,
    String family,
    FontWeight weight,
    FontStyle style,
  }) {
    return DefaultTextStyle(
      style: TextStyle(
        fontFamily: family,
        fontSize: size,
        fontWeight: weight,
        fontStyle: style,
      ),
      child: this,
    );
  }

  Widget lineSpacing(double height) {
    return DefaultTextStyle(
      style: TextStyle(
        height: height,
      ),
      child: this,
    );
  }

  Widget lineLimit(int limit) {
    return DefaultTextStyle(
      maxLines: limit,
      style: this.style,
      child: this,
    );
  }

  Widget multilineTextAlignment(TextAlign textAlign) {
    return DefaultTextStyle(
      textAlign: textAlign,
      style: this.style,
      child: this,
    );
  }

  Widget truncationMode(TextOverflow overflow) {
    return DefaultTextStyle(
      overflow: overflow,
      style: this.style,
      child: this,
    );
  }

  Widget backgroundColor(Color color) {
    return DefaultTextStyle(
      style: TextStyle(inherit: true, backgroundColor: color),
      child: this,
    );
  }

  Widget forgroundColor(Color color) {
    return DefaultTextStyle(
      style: TextStyle(inherit: true, color: color),
      child: this,
    );
  }

  Widget shadow(
    Color color,
    double radius, {
    double blur,
    double x = 0.0,
    double y = 0.0,
  }) {
    return DefaultTextStyle(
      style: TextStyle(
        inherit: true,
        shadows: <BoxShadow>[
          BoxShadow(
            blurRadius: blur,
            spreadRadius: radius,
            color: color,
            offset: Offset(x, y),
          ),
        ],
      ),
      child: this,
    );
  }
}

extension NavigationModifiers on Widget {
  Widget navigationBarTitle(Widget title, {NavigationBarStyle style}) {
    return Builder(
      builder: (BuildContext context) {
        NavigationView.of(context).navigationBarTitle = title;
        NavigationView.of(context).navigationBarStyle = style;
        return this;
      },
    );
  }

  Widget navigationBarItems({Widget leading, List<Widget> trailing}) {
    return Builder(
      builder: (BuildContext context) {
        NavigationView.of(context).leading = leading;
        NavigationView.of(context).trailing = trailing;
        return this;
      },
    );
  }
}

abstract class ViewModifier {
  Widget builder(Widget child);
}

extension CustomModifiers on Widget {
  Widget modifier(ViewModifier builder) {
    return builder.builder(this);
  }
}
