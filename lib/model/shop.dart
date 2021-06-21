import 'package:groceries_stores_app/model/minimumOrder.dart';
import 'package:groceries_stores_app/model/translatedString.dart';

import 'address.dart';

class Shop{
TranslatedString shopName , description;
Address address;
List<dynamic> deliveryRegions;
String  coverPhoto , estimatedDeliveryTime;
MinimumOrder minimumOrder;

Shop.fromJson(Map<String , dynamic> json ){
 shopName = TranslatedString.fromMap(json['shopName']);
  description = TranslatedString.fromMap(json['description']);
 //  shopName = TranslatedString(en: json['shopName']['en'],
 //    ar: json['shopName']['ar']
 //  );

  address = Address.fromJson(json['address']);
  deliveryRegions = json['deliveryRegions'];
  coverPhoto = json['coverPhoto'];
  estimatedDeliveryTime = json['estimatedDeliveryTime'];
  minimumOrder = MinimumOrder.fromMap(json['minimumOrder']);
  
}

@override
  String toString() {
    return 'Shop{shopName: $shopName, description: $description, address: $address, deliveryRegions: $deliveryRegions, coverPhoto: $coverPhoto, estimatedDeliveryTime: $estimatedDeliveryTime, minimumOrder: $minimumOrder}';
  }
}