import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zsz/Constant.dart';
import 'package:zsz/responsive.dart';

Widget Order_Dialog_Header(context) {
  SizeConfig().init(context);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Material(
        color: Colors.transparent,
        shape: CircleBorder(),
        clipBehavior: Clip.hardEdge,
        //  color: theme.,
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close_rounded, size: height(28)
                // w_size * 0.08
                )),
      ),

      //  SizedBox(height: 1,),

      Image.asset(zszlogo,
          // color: Colors.blue,

          width: width(180),
          //  MediaQuery.of(context).size.width * 0.4,
          height: height(43)
          // MediaQuery.of(context).size.height * 0.1,
          ),
      Material(
        color: Colors.transparent,
        shape: CircleBorder(),
        clipBehavior: Clip.hardEdge,
        //  color: theme.,
        child: IconButton(
            onPressed: null,
            icon: Icon(
              Icons.close_rounded, size: width(28), color: Colors.transparent,
              // w_size * 0.08
            )),
      ),
    ],
  );
}
