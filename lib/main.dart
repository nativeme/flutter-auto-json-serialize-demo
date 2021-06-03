// JsonMapper().useAdapter(JsonMapperAdapter(
//     valueDecorators: {typeOf<List<Building>>(): (value) => value.cast<Building>(), typeOf<Set<Building>>(): (value) => value.cast<Building>()}));

// flutter pub run build_runner build --delete-conflicting-outputs
// flutter pub run build_runner watch --delete-conflicting-outputs
import 'global.dart';

import 'main.mapper.g.dart' show initializeJsonMapper;

import 'package:flutter/material.dart';

import 'package:dart_json_mapper/dart_json_mapper.dart';

import 'package:auto_json_serialize_example/building.dart';
import 'package:auto_json_serialize_example/floor.dart';

void main() {
  runApp(MyApp());
  initializeJsonMapper();

  Floor scraperFirstFloor = Floor(15, 100, true);
  Floor scraperSecondFloor = Floor(10, 100, true);
  Floor scraperThirdFloor = Floor(20, 100, false);

  List<Floor> scraperFloorList = [];

  scraperFloorList.add(scraperFirstFloor);
  scraperFloorList.add(scraperSecondFloor);
  scraperFloorList.add(scraperThirdFloor);

  Floor houseFirstFloor = Floor(5, 50, false);
  List<Floor> houseFloorList = [];
  houseFloorList.add(houseFirstFloor);

  Building superScraper = Building("Sky Scraper", 800, scraperFloorList);
  Building smallHouse = Building("Small House", 10, houseFloorList);

  print('Test serialize single building:');
  final buildingJson = JsonMapper.serialize(superScraper);
  print(buildingJson);
  print('');

  List<Building> buildingList = [];
  buildingList.add(superScraper);
  buildingList.add(smallHouse);

  print('Serialize whole list of buildings with nested floors:');
  final buildingListJson = JsonMapper.serialize(buildingList);
  print(buildingListJson);
  print('');

  print('Deserialize buildings from JSON:');
  final buildingListFromJson = JsonMapper.deserialize<List<Building>>(buildingListJson);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: APP_TITLE),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
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
        child: Icon(Icons.add),
      ),
    );
  }
}
