import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_upload_action.freezed.dart';
part 'file_upload_action.g.dart';

@freezed
class FileUploadAction with _$FileUploadAction {
  const factory FileUploadAction({
    String? assetPath,
    String? actionType,
    String? src,
    @Default(true) bool barrierDismissible,
    String? barrierLabel,
    @Default(true) bool useSafeArea,
    TraversalEdgeBehavior? traversalEdgeBehavior,
  }) = _FileUploadAction;

  factory FileUploadAction.fromJson(Map<String, dynamic> json) =>
      _$FileUploadActionFromJson(json);


}
