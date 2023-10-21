import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slashdiscount/controllers/slider_controller.dart';
import 'package:slashdiscount/utils/constants.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SliderController>(
        builder: (controller){
      return CarouselSlider.builder(
          itemCount: controller.isHomeSliderLoading.value ? 3 : controller.homeSliders.length,
          itemBuilder: (context,index,pageIndex){
            return controller.isHomeSliderLoading.value ?
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(Constants.placeHolderBannerImage)
            ) : Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(25),
                ),
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(25),
                child: CachedNetworkImage(
                  placeholder: (context,url)=> Image.asset(Constants.placeHolderBannerImage),
                  errorWidget: (context,url,error)=> Image.asset(Constants.placeHolderImage),
                  imageUrl: controller.homeSliders[index].image.toString(),
                ),
              ),
            );
          },
          options: CarouselOptions(
            aspectRatio: 16/8,
            enlargeCenterPage: true,
            viewportFraction: 1,
            autoPlay: true
          )
      );
    });
  }
}
