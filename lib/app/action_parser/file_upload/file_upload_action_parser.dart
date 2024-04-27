import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_upload/app/action_parser/file_upload/file_upload_action.dart';
import 'package:image_upload/utils/action_type.dart';
import 'package:mirai/mirai.dart';

class FileUploadActionParser extends MiraiActionParser<FileUploadAction> {
  @override
  String get actionType => ActionType.openGallery.name;

  @override
  FileUploadAction getModel(Map<String, dynamic> json) =>
      FileUploadAction.fromJson(json);

  List<XFile> selectedImages = [];

  @override
  Future onCall(BuildContext context, FileUploadAction model) async {
    await imageCapture(isCamera: false);
  }

  Future<List<XFile>> imageCapture({required bool isCamera}) async {
    var picker = ImagePicker();

    if (isCamera) {
      XFile? file = await picker.pickImage(source: ImageSource.camera);
      return [file!];
    }
    final List<XFile> images = await picker.pickMultiImage();

    return images;
  }
}
