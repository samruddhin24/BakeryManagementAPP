import 'package:bakery_app/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class BannerSlider extends StatelessWidget {
  static final banner = [
    ImageConstants.bannerImage1,
    ImageConstants.bannerImage2
  ];
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          VxSwiper.builder(
            aspectRatio: 16 / 9,
            autoPlay: true,
            height: 150,
            itemCount: banner.length,
            itemBuilder: (context, index) {
              return Container(
                child: Image.asset(
                  banner[index],
                  fit: BoxFit.fill,
                )
                    .box
                    .rounded
                    .clip(Clip.antiAlias)
                    .margin(const EdgeInsets.symmetric(horizontal: 8))
                    .make(),
              );
            },
          ),
        ],
      ),
    );
  }
}
