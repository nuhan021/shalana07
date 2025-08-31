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

  final List<TrendingItem> dress = [
    TrendingItem(
      imgUrl: ImagePath.yellowDress,
      title: 'Yellow Dress',
      coin: "150",
    ),
    TrendingItem(
      imgUrl: ImagePath.ambarDress,
      title: 'Green Dress',
      coin: "150",
    ),
    TrendingItem(
      imgUrl: ImagePath.lightBlueDress,
      title: 'Blue Dress',
      coin: "120",
    ),
  ];

  final List<TrendingItem> hair = [
    TrendingItem(
      imgUrl: ImagePath.redLonghair,
      title: 'Long Hair',
      coin: "150",
    ),
    TrendingItem(
      imgUrl: ImagePath.longHair,
      title: 'Red Long Hair',
      coin: "150",
    ),
  ];

  final List<TrendingItem> avatar = [
    TrendingItem(
      imgUrl: ImagePath.grilavater_1,
      title: 'Long Hair',
      coin: "150",
    ),

    TrendingItem(
      imgUrl: ImagePath.girlAvater_3,
      title: 'Red Long Hair',
      coin: "150",
    ),
    TrendingItem(
      imgUrl: ImagePath.girlavater_4,
      title: 'Red Long Hair',
      coin: "150",
    ),
  ];
}

class TrendingItem {
  TrendingItem({required this.imgUrl, required this.title, required this.coin});

  final String imgUrl;
  final String title;
  final String coin;
}
