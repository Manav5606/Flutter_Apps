import 'package:flutter/material.dart';

    TextStyle titlefont =
          const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);

Widget additionalInformation(String wind, String humidity, String presure, String fells_like) {

  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                
                  children: [
                    Text("wind",
                      style: titlefont,
                    ),

                    SizedBox(height: 18.0,),

                    Text("Pressure",
                      style: titlefont,
                    ),

                  ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Text("$wind",
                    style: titlefont,
                  ),

                  SizedBox(height: 18.0,),

                  Text("$presure",
                    style: titlefont,
                  ),

                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text("Humidity",
                    style: titlefont,
                  ),

                  SizedBox(height: 18.0,),

                  Text("Feels Like",
                    style: titlefont,
                  ),

                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Text("$humidity",
                    style: titlefont,
                  ),

                  SizedBox(height: 18.0,),

                  Text("$fells_like",
                    style: titlefont,
                  ),

                ],
              ),
            ],

        ),
      ],
    ),
  );

}