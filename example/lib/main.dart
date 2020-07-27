import 'package:flutter/material.dart';
import 'package:modifiers/modifiers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      child: ListView(
        children: <Widget>[
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Hey Soho!",
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  "Add a printer to get started. We’ll help you set things up.",
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 6),
                Image.network(
                  "https://i.ibb.co/yW1XDP4/printer-image.png",
                ).paddingInsets(
                  const EdgeInsets.symmetric(horizontal: 28, vertical: 48),
                ),
                Text(
                  'Add a Printer',
                  style: Theme.of(context).accentTextTheme.button,
                ).modifier(
                  MainButtonModifier(
                    onPressed: () {},
                  ),
                ),
                FlatButton(
                  child: Text(
                    'Visit Zebra’s Online Store',
                    style: Theme.of(context).textTheme.button,
                  ),
                  onPressed: () {},
                ),
              ],
            ).padding(24.0),
          )
        ],
      ).navigationBarTitle(Text(widget.title)),
    );
  }
}

class MainButtonModifier extends ViewModifier {
  final VoidCallback onPressed;

  MainButtonModifier({this.onPressed});

  @override
  Widget builder(Widget child) {
    return Builder(
      builder: (context) {
        return RaisedButton(
          elevation: 0,
          padding: Theme.of(context).buttonTheme.padding,
          shape: Theme.of(context).buttonTheme.shape,
          color: Theme.of(context).primaryColor,
          child: child,
          onPressed: onPressed,
        );
      },
    );
  }
}
