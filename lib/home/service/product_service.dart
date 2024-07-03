
import 'package:flutter_firebase1/home/api/product_api.dart';
import 'package:flutter_firebase1/home/model/product_model.dart';
import 'package:http/http.dart' as http;



class ServiceProductAPI {
  Future fetchProductAPI() async {
    try {
      var response = await http.get(Uri.parse(productAPI));
      if (response.statusCode == 200) {
        return productModelFromJson(response.body);
      } else {
        return [];
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}