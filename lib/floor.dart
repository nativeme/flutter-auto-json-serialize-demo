import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'floor.mapper.g.dart' show initializeJsonMapper;

@jsonSerializable
class Floor {
  static int idCounter = 0;
  int _id = 0;

  @JsonProperty(name: 'roomNumber')
  int roomNumber = 0;
  @JsonProperty(name: 'size')
  int size = 0;
  @JsonProperty(name: 'isFree')
  bool isFree = true;

  Floor(int roomNumber, int size, bool isFree) {
    initializeJsonMapper();
    nextID();
    this.roomNumber = roomNumber;
    this.size = size;
    this.isFree = isFree;

    print('''
    Creted Floor:
     Internal app ID: ${this._id}
     Number of rooms: ${this.roomNumber}
     Foor size in m2: ${this.size}
     Number of rooms: ${this.isFree}
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
