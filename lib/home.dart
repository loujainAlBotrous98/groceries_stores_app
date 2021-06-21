import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceries_stores_app/shopCard.dart';

import 'model/api.dart';
import 'model/constants.dart';
import 'model/shop.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    API api = new API();
    // api.getShops();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.appBarColor,
        title: Text(
          'Oriano'.toUpperCase(),
          style: GoogleFonts.getFont(Constants.font,fontWeight: FontWeight.bold),
        ),
        titleSpacing: 0,
        leading: IconButton(icon:Icon(Icons.menu ,color: Colors.white, size: 20,) , ),
      ),
      body: FutureBuilder(
        future: api.getShops(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return cirecularProgressIndicator();
          } else {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:0.83,
                  // crossAxisSpacing: size.width*0.008,
                  // mainAxisSpacing: size.width*0.00001,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                ),

                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, index) {
                  Shop shop = snapshot.data[index];
                  return ShopCard(shop: shop);
                });
          }
        },
      ),
    );
  }

  Center cirecularProgressIndicator() {
    return Center(
              child: CircularProgressIndicator(
            backgroundColor: Constants.primary,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
            strokeWidth: 4,
          ));
  }
}
