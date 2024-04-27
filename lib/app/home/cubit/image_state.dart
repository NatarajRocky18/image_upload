part of 'image_cubit.dart';

@immutable
abstract class HomeStateImage {
  final List<XFile>? files;

    HomeStateImage({ this.files});
}

class HomeLoadingImage extends HomeStateImage {
   HomeLoadingImage({super.files=const []});
}


