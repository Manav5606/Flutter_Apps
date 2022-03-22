
import 'package:flutter/material.dart';
import 'package:flutter1/API_Calling/model1_api.dart';
import 'package:flutter1/API_Calling/news_api.dart';
import 'package:flutter1/API_Calling/news_screen.dart';


class Home_page_api_1 extends StatefulWidget {
  const Home_page_api_1({Key? key}) : super(key: key);

  @override
  _Home_page_api_1State createState() => _Home_page_api_1State();
}

class _Home_page_api_1State extends State<Home_page_api_1> {

  List<NewsApiModel>? newsList;
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews().then((value) {

          setState(() {
            if(value.isNotEmpty){
              newsList=value;
              _isLoading=false;
            }else{
              print("List is Empty");
            }
          });

      }

    );
  }

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange,
        body: Container(
          height: size.height,
          width: size.width ,
          child: Column(
            children: [
              Container(
                height: size.height/12,
                width: size.width / 1.1,

                child: Row(
                  children: [
                    Icon(
                      Icons.menu,
                    ),
                    SizedBox(
                      width: size.width / 4,
                    ),

                    Text("News App", style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                    ),
                  ],
                ),
              ),


             _isLoading?
             Align(
               alignment: Alignment.center,
               child: Container(
                 height: size.height/20,
                 width: size.width / 10,
                 child: CircularProgressIndicator(),
               ),
             ) : Expanded(
                  child: Container(
                      child: ListView.builder(
                          itemCount: newsList!.length,
                          itemBuilder: (context, index){
                            return listItems(size, newsList![index]);

                          }

                      ),
                  ),
              ),
            ],
          ),
        ),

      ),
    );
  }


  Widget listItems(Size size, NewsApiModel model){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
      
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
                builder: (_) => ReadingNews()
            ),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 0, bottom: 10),
          width: size.width / 1.15,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
          ),

          child: Column(
            children: [
              Container(
                height: size.height / 4,
                width: size.width / 1.05,
                 decoration: BoxDecoration(
                   border: Border.symmetric(horizontal: BorderSide(width: 1, color: Colors.black),
                   ),
                 ),
                 alignment: Alignment.center,
                child: model.imageUrl != ""
                    ? Image.network(
                  model.imageUrl,
                  fit: BoxFit.cover,
                )
                    : Text("Cant Load image"),
              ),

              Container(
                width: size.width / 1.1,
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "News title Here",
                  style: TextStyle(fontSize: 20),
                ),
              ),

              Container(
                width: size.width / 1.1,
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "News Description Here",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }

}
