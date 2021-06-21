import 'package:http/http.dart';
import 'dart:convert';

import 'address.dart';
import 'shop.dart';
class API {
  String secretKey = '2a2xExPa!&+bO9KS!aMC';
  String uri = 'https://api.orianosy.com/shop/test/find/all/shop?deviceKind=android';


    Future<List<Shop>> getShops() async {
    try {
      List<Shop> shops = [];
      Response response = await get(Uri.parse(uri), headers:{
        'secretKey': secretKey
      });
      if (response.statusCode == 200) {
        String data = response.body;
        List<dynamic> jsonData = jsonDecode(data)['result'];
        for(int i =0;i<jsonData.length;i++){
          shops.add(Shop.fromJson(jsonData[i]));
        }
        return shops;
      }
      else {
        print('status code = ${response.statusCode}');
      }
    } catch (e) {
    print(e.toString());
    }


  }

  @override
  String toString() {
    return 'API{secretKey: $secretKey, uri: $uri}';
  }



}