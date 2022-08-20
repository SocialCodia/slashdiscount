
import 'package:slashdiscount/pojos/response_vendors.dart';
import 'package:slashdiscount/services/api_service.dart';
import 'package:slashdiscount/utils/api_methods.dart';

class VendorService{

  static Future<ResponseVendors> getTopVendors() async {
    final _res = await ApiService.postRequest({'method':ApiMethods.getTopVendorList});
    return responseVendorsFromJson(_res);
  }

  static Future<ResponseVendors> getVendorsByCategory({category}) async {
    final _res = await ApiService.postRequest({'method':ApiMethods.getCategoryWiseVendor,'category':category});
    return responseVendorsFromJson(_res);
  }

}