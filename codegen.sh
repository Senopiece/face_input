flutter pub run pigeon \
  --input pigeons/face_input_factory.dart \
  --dart_out lib/face_input_factory.dart \
  --java_package "com.example.face_input" \
  --java_out android/src/main/java/com/example/face_input/FaceInputFactory.java

mkdir tmp_generated

protoc --dart_out=tmp_generated --java_out=tmp_generated -Iprotos protos/face_input.proto
cp tmp_generated/face_input.pb.dart lib/models/face_input.dart
cp tmp_generated/com/example/face_input/models/FaceInput.java android/src/main/java/com/example/face_input/models/FaceInput.java

rm -rf tmp_generated