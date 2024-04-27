// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_upload_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FileUploadActionImpl _$$FileUploadActionImplFromJson(
        Map<String, dynamic> json) =>
    _$FileUploadActionImpl(
      assetPath: json['assetPath'] as String?,
      actionType: json['actionType'] as String?,
      src: json['src'] as String?,
      barrierDismissible: json['barrierDismissible'] as bool? ?? true,
      barrierLabel: json['barrierLabel'] as String?,
      useSafeArea: json['useSafeArea'] as bool? ?? true,
      traversalEdgeBehavior: $enumDecodeNullable(
          _$TraversalEdgeBehaviorEnumMap, json['traversalEdgeBehavior']),
    );

Map<String, dynamic> _$$FileUploadActionImplToJson(
        _$FileUploadActionImpl instance) =>
    <String, dynamic>{
      'assetPath': instance.assetPath,
      'actionType': instance.actionType,
      'src': instance.src,
      'barrierDismissible': instance.barrierDismissible,
      'barrierLabel': instance.barrierLabel,
      'useSafeArea': instance.useSafeArea,
      'traversalEdgeBehavior':
          _$TraversalEdgeBehaviorEnumMap[instance.traversalEdgeBehavior],
    };

const _$TraversalEdgeBehaviorEnumMap = {
  TraversalEdgeBehavior.closedLoop: 'closedLoop',
  TraversalEdgeBehavior.leaveFlutterView: 'leaveFlutterView',
  TraversalEdgeBehavior.parentScope: 'parentScope',
};
