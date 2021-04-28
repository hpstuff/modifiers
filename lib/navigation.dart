import 'package:flutter/material.dart';

class NavigationView extends StatefulWidget {
  final Widget? child;

  const NavigationView({Key? key, this.child}) : super(key: key);

  @override
  _NavigationViewState createState() => _NavigationViewState();

  static _NavigationViewState? of(BuildContext context, {bool nullOk = false}) {
    assert(nullOk != null);
    assert(context != null);
    final _NavigationViewState? result =
        context.findAncestorStateOfType<_NavigationViewState>();
    if (nullOk || result != null) return result;
    throw FlutterError.fromParts(
      <DiagnosticsNode>[
        ErrorSummary(
            'NavigationView.of() called with a context that does not contain a NavigationView.'),
        ErrorDescription(
            'No NavigationView ancestor could be found starting from the context that was passed to NavigationView.of(). '
            'This usually happens when the context provided is from the same StatefulWidget as that '
            'whose build function actually creates the NavigationView widget being sought.'),
      ],
    );
  }
}

class _NavigationViewState extends State<NavigationView> {
  Widget? _navigationBarTitle;
  Widget? get navigationBarTitle => _navigationBarTitle;
  set navigationBarTitle(Widget? value) {
    if (value == _navigationBarTitle) {
      return;
    }
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        _navigationBarTitle = value;
      });
    });
  }

  NavigationBarStyle? _navigationBarStyle;
  NavigationBarStyle? get navigationBarStyle => _navigationBarStyle;
  set navigationBarStyle(NavigationBarStyle? value) {
    if (value == _navigationBarStyle) {
      return;
    }
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        _navigationBarStyle = value;
      });
    });
  }

  Widget? _leading;
  Widget? get leading => _leading;
  set leading(Widget? value) {
    if (value == _leading) {
      return;
    }
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        _leading = value;
      });
    });
  }

  List<Widget>? _trailing;
  List<Widget>? get trailing => _trailing;
  set trailing(List<Widget>? value) {
    if (value == _trailing) {
      return;
    }
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        _trailing = value;
      });
    });
  }

  _buildAppBar(BuildContext context) {
    if (navigationBarStyle != null) {
      return AppBar(
        title: navigationBarTitle,
        backgroundColor: navigationBarStyle!.color,
        elevation: navigationBarStyle!.elevation,
        centerTitle: navigationBarStyle!.centerTitle,
        leading: leading,
        actions: trailing,
      );
    }
    return AppBar(
      title: navigationBarTitle,
      leading: leading,
      actions: trailing,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigationBarTitle != null ? _buildAppBar(context) : null,
      body: widget.child,
    );
  }
}

class NavigationBarStyle {
  final Color? color;
  final double? elevation;
  final bool? centerTitle;

  NavigationBarStyle({this.centerTitle, this.color, this.elevation});
}
