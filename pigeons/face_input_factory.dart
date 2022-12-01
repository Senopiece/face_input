import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class FaceInputFactoryApi {
  @async
  String create(); // setup event channel from this string
}
