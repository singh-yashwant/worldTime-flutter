import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

	String location;     // location name for the UI
	String time;
	String flag; 				 // URL to assest flag image
  String url;          // location url for api endpoint
	bool isDay;

	WorldTime({this.location, this.flag, this.url});

	Future <void> getTime() async{

		try {
		  Response response = await get("http://worldtimeapi.org/api/timezone/$url");
		  Map data = jsonDecode(response.body);
		  
		  // extracting properties from the data
		  String datetime = data['datetime'];
		  String offset = data['utc_offset'].substring(1, 3);
		  DateTime now = DateTime.parse(datetime);
		  now = now.add(Duration(hours: int.parse(offset)));
		  
		  // set the time property
		  time = DateFormat.jm().format(now);

		  isDay = now.hour > 6 && now.hour < 20 ? true : false;
		}
		catch (e) {
		  print("error in fetching data");
		  print(e);
		  time = 'could not get time data';
		}

	}

}


