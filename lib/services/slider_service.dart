
import 'package:slashdiscount/pojos/response_sliders.dart';
import 'package:slashdiscount/services/api_service.dart';
import 'package:slashdiscount/utils/api_methods.dart';

class SliderService{

  static Future<ResponseSliders> getHomeSliders() async {
    final _response = await ApiService.postRequest({'method':ApiMethods.getSliderImages});
    return responseSlidersFromJson(_response);
  }

}