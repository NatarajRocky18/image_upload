import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_upload/app/home/cubit/image_cubit.dart';
import 'package:mirai/mirai.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBlocs>(
      create: (context) => HomeBlocs(),
      child: Builder(
        builder: (context) {
          final homeBlocs = BlocProvider.of<HomeBlocs>(context);

          return Scaffold(
            appBar: AppBar(
              title: const Text("Mirai Gallery"),
            ),
            body: Column(
              children: [
                Expanded(
                  child: BlocBuilder<HomeBlocs, HomeStateImage>(
                    builder: (context, state) {
                      if (state is HomeLoadingImage) {
                        print("Again Loading");
                        return Mirai.fromJson(
                              {
                                "type": "row",
                                "mainAxisAlignment": "center",
                                "crossAxisAlignment": "center",
                                "children": [
                                  {
                                    "type": "column",
                                    "mainAxisAlignment": "center",
                                    "crossAxisAlignment": "center",
                                    "children": [
                                      {
                                        "type": "row",
                                        "mainAxisAlignment": "center",
                                        "crossAxisAlignment": "center",
                                        "children": [
                                          {
                                            "type": "elevatedButton",
                                            "child": {
                                              "type": "text",
                                              "data": "Open Gallery"
                                            },
                                            "style": {
                                              "padding": {
                                                "top": 8,
                                                "left": 12,
                                                "right": 12,
                                                "bottom": 8
                                              }
                                            },
                                            "onPressed": {
                                              "actionType": "openGallery"
                                            },
                                              "children": homeBlocs.files,
                                            
                                          }
                                        ]
                                      }
                                    ]
                                  }
                                ]
                              },
                              context,
                            ) ??
                            const SizedBox();
                      }
                      if (state is HomeLoadingImage) {
                        return const CircularProgressIndicator();
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
