
import 'package:get/get.dart';
import 'package:slashdiscount/models/slider.dart';
import 'package:slashdiscount/pojos/response_sliders.dart';
import 'package:slashdiscount/services/slider_service.dart';

class SliderController extends GetxController{

  @override
  void onInit() {
    getHomeSlider();
    super.onInit();
  }

  var isHomeSliderLoading = true.obs;
  List<Slider> homeSliders = [];

  Future<void> getHomeSlider() async {
    isHomeSliderLoading(true);
    final ResponseSliders responseSliders = await SliderService.getHomeSliders();
    homeSliders = responseSliders.data!;
    isHomeSliderLoading(false);
    update();
  }

}