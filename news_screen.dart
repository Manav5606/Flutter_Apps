

import 'package:flutter/material.dart';

class ReadingNews extends StatelessWidget {
  const ReadingNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(backgroundColor: Colors.red,
          body: Container(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: ()=>Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios_sharp),)),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: size.width/1.1,
                    child: Text(
                      "News Title Here...",
                      style: TextStyle(

                          color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w500

                      ),),
                  ),

                  Container(
                    height: size.height / 4,
                    width: size.width / 1.05,
                    alignment: Alignment.center,
                    child: Text(
                      "Your Image Here",
                      style: TextStyle(

                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500

                      ),),
                  ),

                  Container(

                    width: size.width / 1.05,
                    alignment: Alignment.center,
                    child: Text(
                      "Your Content Here...",
                      style: TextStyle(

                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500

                      ),),
                  ),

                ],
              ),
            ),
          ),
      ),
    );
  }
}
