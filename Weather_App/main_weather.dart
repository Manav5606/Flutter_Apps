import 'package:flutter/material.dart';
import 'package:flutter1/Weather_App/additional_information.dart';
import 'package:flutter1/Weather_App/current_Weather.dart';
import 'package:flutter1/weather_model/Weather_model.dart';
import 'package:flutter1/weather_services/weather_api_client.dart';

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  Future<void> getData() async{
    data = await client.getCurrentWeather("Georgia");
  }
  // @override
  // void initState(){
  //   super.initState();
  //   client.getCurrentWeather("London");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf9f9f9),
      appBar: AppBar(
        backgroundColor: Color(0xFFf9f9f9),
        elevation: 0.0,
        title: Text("Weather App", style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
      ),

      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot){

          if(snapshot.connectionState == ConnectionState.done){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                currentWeather(Icons.wb_sunny_rounded, "${data?.temp ?? 0}", "${data?.cityName ?? 0}"),

                SizedBox(
                  height: 60.0,
                ),

                Text(
                  "Additional Information",
                  style: TextStyle(
                    fontSize: 24.0, color: Color(0xdd212121),
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Divider(),
                SizedBox(
                  height: 20.0,
                ),

                additionalInformation("${data?.wind ?? 0}", "${data?.humidity ?? 0}",
                    "${data?.presure ?? 0}", "${data?.feels_like ?? 0}"),

              ],
            );
          }else if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          return Container();
        },
      ),

    );
  }
}
