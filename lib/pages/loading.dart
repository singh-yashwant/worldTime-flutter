import 'package:flutter/material.dart';
import 'package:world_time_app/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}


class _LoadingState extends State<Loading> {

	String time = "loading...";

	void setupWorldTime() async {
		WorldTime instance = WorldTime(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata');
		await instance.getTime();
		Navigator.pushReplacementNamed(context, '/home', arguments: {
			'location': instance.location,
			'flag': instance.flag,
			'time': instance.time,
			'isDay': instance.isDay,
		});
	}

	@override
	void initState(){
		super.initState();
		setupWorldTime();
	}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			body: Center(
				child: SpinKitFadingCube(
					color: Colors.orange,
					size: 70,
				),
			),
		);
  }
}
