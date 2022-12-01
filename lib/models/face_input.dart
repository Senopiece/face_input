///
//  Generated code. Do not modify.
//  source: face_input.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class FaceState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FaceState', createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'leftEyeOpenProbability', $pb.PbFieldType.OF, protoName: 'leftEyeOpenProbability')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rightEyeOpenProbability', $pb.PbFieldType.OF, protoName: 'rightEyeOpenProbability')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'headEulerAngleY', $pb.PbFieldType.OF, protoName: 'headEulerAngleY')
    ..hasRequiredFields = false
  ;

  FaceState._() : super();
  factory FaceState({
    $core.double? leftEyeOpenProbability,
    $core.double? rightEyeOpenProbability,
    $core.double? headEulerAngleY,
  }) {
    final _result = create();
    if (leftEyeOpenProbability != null) {
      _result.leftEyeOpenProbability = leftEyeOpenProbability;
    }
    if (rightEyeOpenProbability != null) {
      _result.rightEyeOpenProbability = rightEyeOpenProbability;
    }
    if (headEulerAngleY != null) {
      _result.headEulerAngleY = headEulerAngleY;
    }
    return _result;
  }
  factory FaceState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FaceState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FaceState clone() => FaceState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FaceState copyWith(void Function(FaceState) updates) => super.copyWith((message) => updates(message as FaceState)) as FaceState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FaceState create() => FaceState._();
  FaceState createEmptyInstance() => create();
  static $pb.PbList<FaceState> createRepeated() => $pb.PbList<FaceState>();
  @$core.pragma('dart2js:noInline')
  static FaceState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FaceState>(create);
  static FaceState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get leftEyeOpenProbability => $_getN(0);
  @$pb.TagNumber(1)
  set leftEyeOpenProbability($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLeftEyeOpenProbability() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeftEyeOpenProbability() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get rightEyeOpenProbability => $_getN(1);
  @$pb.TagNumber(2)
  set rightEyeOpenProbability($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRightEyeOpenProbability() => $_has(1);
  @$pb.TagNumber(2)
  void clearRightEyeOpenProbability() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get headEulerAngleY => $_getN(2);
  @$pb.TagNumber(3)
  set headEulerAngleY($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHeadEulerAngleY() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeadEulerAngleY() => clearField(3);
}

