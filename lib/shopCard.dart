import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model/constants.dart';
import 'model/shop.dart';
class ShopCard extends StatefulWidget {
  const ShopCard({
    Key key,
    @required this.shop,
  }) : super(key: key);

  // final Size size;
  final Shop shop;

  @override
  _ShopCardState createState() => _ShopCardState();
}

class _ShopCardState extends State<ShopCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
          width: size.width * 0.5,
          height: size.height * 0.2,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2,
                offset: Offset(2, 2), // Shadow position
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
                image: NetworkImage(widget.shop.coverPhoto), fit: BoxFit.cover),
          ),
          child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: imageLinearGradient(),
              ),
              child: Stack(

                children: [
                  Positioned(
                    left: size.width * 0.03,
                    bottom: size.height * 0.035,
                    height: 20,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Text(
                              '${widget.shop.shopName.en}',
                              style: GoogleFonts.getFont(Constants.font,
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ]),
                  ),
                  Positioned(
                      left: size.width * 0.03,
                      bottom: size.height * 0.017,
                      child: Text('${widget.shop.address.city}',
                          style: GoogleFonts.getFont(Constants.font,
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
                              color: Colors.white))),
                  Positioned(
                    right: size.width * 0.03,
                    bottom: size.height * 0.017,
                    child: Text(
                        '${widget.shop.minimumOrder.amount}  ${widget.shop.minimumOrder.currency}',
                        style: GoogleFonts.getFont(Constants.font,
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.005,
                    right: size.width * 0.03,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      height: size.height * 0.02,
                      width: size.width * 0.2,
                      decoration: BoxDecoration(
                          color: Constants.primary,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children :[
                              Icon(Icons.access_time_outlined , size: 10, color: Colors.white,),
                              Text(
                                '${widget.shop.estimatedDeliveryTime}',
                                style: GoogleFonts.getFont(Constants.font,
                                    fontSize: 10, color: Colors.white),
                              ),

                            ]
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
        Container(
          // color: Colors.red,
            width: size.width * 0.4,
            height: size.height * 0.05,
            child: Center(
                child: Text('${widget.shop.description.en}',
                    style: GoogleFonts.getFont(Constants.font, fontSize: 10)))),
      ],
    );
    // );
  }

  LinearGradient imageLinearGradient() {
    return LinearGradient(
        end: Alignment.bottomCenter,
        begin: Alignment.topCenter,
        colors: [
          // const Color(0xFFFAFAFA).withOpacity(0.7),
          // const Color(0xFFD6D6D6).withOpacity(0.7),
          // const Color(0xFF303030).withOpacity(0.7),
          // const Color(0xFF212121).withOpacity(0.7),
          Colors.black54.withOpacity(0),
          Colors.black54.withOpacity(0.75)
        ]);
  }
}
