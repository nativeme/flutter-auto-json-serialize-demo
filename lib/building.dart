import 'package:auto_json_serialize_example/floor.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'building.mapper.g.dart' show initializeJsonMapper;

@jsonSerializable
class Building {
  static int idCounter = 0;
  int _id = 0;

  @JsonProperty(name: 'name')
  String name = "def_building_name";
  @JsonProperty(name: 'height')
  int height = 0;
  @JsonProperty(name: 'floors')
  List<Floor> floors = [];

  Building(String name, int height, List<Floor> floors) {
    initializeJsonMapper();
    nextID();
    this.name = name;
    this.height = height;
    this.floors = floors;

    print('''
    Created Building:
      Internal app ID: ${this._id};
      Name: ${this.name}
      Height: ${this.height}[m]
      Floors count: ${this.floors.length}
    ''');
  }

  @JsonProperty(name: 'id')
  getID() {
    return _id;
  }

  nextID() {
    _id = idCounter;
    idCounter++;
  }
}
