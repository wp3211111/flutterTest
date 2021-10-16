import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/http/core/hi_error.dart';
import 'package:flutter_app/http/dao/login_dao.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter wp3211111',
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
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Flutter   wp321111'),
    );
  }
}

class NewTest extends StatefulWidget {
  final String title;

  const NewTest({Key? key, required this.title}) : super(key: key);
  @override
  _NewTestState createState() => _NewTestState();
}

class _NewTestState extends State<NewTest> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Text('kuaijianjian'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _text = "";
  var aa;
  void _incrementCounter() async {
    // TestRquest request = TestRquest();
    // request
    //     .add("aaa", "wp32111")
    //     .add("bbb", "wp3211111")
    //     .add("requestPrams", "dfsdfsfsdfsdf");
    // try {
    //   var result = await HiNet.getInstance()?.fire(request);
    //   print(result);
    // } on NeedAuth catch (e) {
    //   print(e);
    // } on NeedLogin catch (e) {
    //   print(e);
    // } on HiNetError catch (e) {
    //   print(e);
    // } catch (e) {
    //   print(e);
    // }
    // print(null ?? false);
    // print(false ?? 11);
    // print(true ?? false);
    //Test();
    TestLogin();
    // setState(() {
    //   _text = result.toString();
    //   // _counter = result.toString();
    // });
  }

  void TestLogin() async {
    try {
      var result = await LoginDao.Registration(
          "userName", "password", 'imoocId', 'orderId');
      print(result);
    } on NeedAuth catch (e) {
      print("NeedAuth:${e}");
    } on HiNetError catch (e) {
      print("HiNetError:${e}");
    }
  }

  void Test() {
    const jsonStr =
        '{\"name\" : \"flutter\",\"url\" : \"https://www.baidu.com\",\"aaaaaaaa\" : \"ddddddddddd\",\"bbbbbb\" : \"ccccccccccc\"}';
    Map<String, dynamic> jsonMap = jsonDecode(jsonStr);
    print("name:${jsonMap['name']}");
    print("url:${jsonMap['url']}");
    String json = jsonEncode(jsonMap);
    print("json:${json}");
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _text + 'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
