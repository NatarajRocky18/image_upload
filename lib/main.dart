import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_upload/app/action_parser/file_upload/file_upload_action_parser.dart';
import 'package:image_upload/app/home/cubit/image_cubit.dart';
import 'package:image_upload/app/home/home_screen.dart';
import 'package:mirai/mirai.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Mirai.initialize(
    actionParsers: [
      FileUploadActionParser(),
    ],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBlocs>(
          create: (context) => HomeBlocs(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MiraiApp(
            title: 'Mirai Demo',
            homeBuilder: (context) => const MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBlocs,HomeStateImage >(
      builder: (context, state) {
        return MiraiApp(
          homeBuilder: (context) =>  HomeScreen(),
          title: 'Image Upload',
          routes: {
            '/homeScreen': (context) =>  HomeScreen(),
          },
        );
      },
    );
  }
}
