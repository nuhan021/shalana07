import 'package:get/get.dart';

import '../../../core/utils/constants/image_path.dart';

class AvatarScreenController extends GetxController {
  final List<TrendingItem> trendingItems = [
    TrendingItem(
      imgUrl: ImagePath.cat,
      title: 'Cat-yellow and white',
      coin: "150",
    ),
    TrendingItem(
      imgUrl: ImagePath.ambarDress,
      title: 'Amber Dress',
      coin: "150",
    ),
    TrendingItem(
      imgUrl: ImagePath.yellowDress,
      title: 'Yellow Dress',
      coin: "120",
    ),
    TrendingItem(
      imgUrl: ImagePath.ambarDress,
      title: 'Ambar Dress',
      coin: "120",
    ),
  ];
}

class TrendingItem {
  TrendingItem({
    required this.imgUrl,
    required this.title,
    required this.coin,
  });

  final String imgUrl;
  final String title;
  final String coin;
}
