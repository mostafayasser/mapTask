import 'dart:async';

import 'package:location/location.dart';

class LocationStream {
  static double lat = 30.034565;
  static double long = 30.034565;
  final _controller = StreamController<LocationData>();
  LocationStream() {
    Timer.periodic(Duration(seconds: 1), (t) {
      _controller.sink
          .add(LocationData.fromMap({"latitude": lat, "longitude": long}));
      lat += 0.0001;
    });
  }

  Stream<LocationData> get stream => _controller.stream;
}
