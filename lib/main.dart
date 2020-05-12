import 'package:flutter/material.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutsster Demo Home Piage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;


  final  Map<String, dynamic> widgetJson = {
    "elements": [

      {
        "type": "Text",
        "element": "Test Bluetooth FormPong"
      },
      {
        "type": "TextFormField",
        "element": {
          "hintText": "input a  value"
        },
        "label": "Value:"
      },
      {
        "type": "FlatButton",
        "label": "Submit"
      }
    ]
  };

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    List<dynamic> widgetList = widget.widgetJson["elements"];
    List<Widget> widgets = new List<Widget>();
    Map<String, Function> factories = {

      'Text':  (element, label) =>  new Text(element),

      'TextFormField': (element, label) {

        final decoration = InputDecoration(hintText: element['hintText']);
        var validator = (value) {
          if (value.isEmpty) {
            return 'Pleasssdsdsdse enter some text';
          }
          return null;
        };

        //return Table(columnWidths , children: [TableRow(children: [TableCell(width: 30, child: new Text(label)), TableCell(child: new TextFormField(decoration: decoration, validator: validator))])]);

        return Row(

          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(child: new Text(label)),
            ),
            Expanded(
              flex: 8,
              child: Container(child: new TextFormField(decoration: decoration, validator: validator))
            )
          ],
        );

      },

      'FlatButton': (element, label) =>

        FlatButton(
          child: Text(label),
          color: Colors.blue,
          onPressed: () {/** */},
        )



    };


    print(widgetList.length);

    for (var i = 0; i < widgetList.length; i++) {


      Object widget = factories[widgetList[i]['type']](widgetList[i]['element'], widgetList[i]['label']);

      widgets.add(widget);

    }



    final wisdgetList = [
      TextFormField(
        decoration: const InputDecoration(
          hintText: 'Enter yoasdsdsil',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Pleasssdsdsdse enter some text';
          }
          return null;
        },
      ),
      Text(
        'You have pusssshed the button this many times:',
      ),
      Text(
          'yo'//,
        //style: Theme.of(context).textTheme.headline4,
      ),
    ];


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgets//(widgetList).toList()
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

