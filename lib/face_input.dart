import 'package:face_input/face_input_factory.dart';

import 'models/face_input.dart';
import 'package:flutter/services.dart';

final FaceInputFactoryApi _api = FaceInputFactoryApi();

Future<Stream<FaceState>> create() async {
  // TODO: how to free event channel on the host side in case of exception, the same on the dart side
  // (free it in case of init exception and in case of stream exception)
  // also how to free that intermediate translator from json to FaceState and vice versa on the host side

  return EventChannel(await _api.create())
      .receiveBroadcastStream()
      .map((buffer) => FaceState.fromBuffer(buffer));

  // this method throws:
  // - no platform support
  // - platform exception:
  //   - camera permission denied
  //   - camera not available

  // stream throws:
  //   - platform exception:
  //      - camera permission denied
  //      - etc
}
