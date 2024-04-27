
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
part 'image_state.dart';

class HomeBlocs extends Cubit<HomeStateImage> {
  HomeBlocs() : super(HomeLoadingImage(files: [])) {
    _initialize();
  }

  List<XFile> files = []; 

  Future<void> loadImages() async {
    _initialize();
  }

  Future<void> _initialize() async {
    final filess = await _loadAndParseJsonFromAsset();
    files.addAll(filess);
    emit(HomeLoadingImage(files: files));
  }

  Future<void> handleSelectedImage(XFile image) async {
  }

  Future<List<XFile>> _loadAndParseJsonFromAsset() async {
    try {
      final String json = await rootBundle
          .loadString("assets/json/elevated_button_example.json");
      final List<dynamic> decodedJson = jsonDecode(json);
      final List<XFile> files =
          decodedJson.map((files) => XFile(files['path'])).toList();
      return files;
    } catch (e) {
      print('Error loading JSON: $e');
      return [];
    }
  }
}
