import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

	Map data = {};

	@override
  Widget build(BuildContext context) {

		if (data.isEmpty)
			data = ModalRoute.of(context).settings.arguments;
//		print(data);

		String dayNight = data['isDay'] ? 'day.jpeg' : 'night.jpeg';
		Color textColor = data['isDay'] ? Colors.black : Colors.white;
		Color barColor = data['isDay'] ? Colors.lightBlueAccent : Colors.indigo[900];


    return Scaffold(
			backgroundColor: barColor,
			body: SafeArea(
			  child: Container(
					decoration: BoxDecoration(
						image: DecorationImage(
							image: AssetImage('images/$dayNight'),
							fit: BoxFit.cover,
						),
					),
			    child: Padding(
			      padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
			      child: Column(
					children: <Widget>[
						FlatButton.icon(
							onPressed: () async{
								dynamic result = await Navigator.pushNamed(context, '/location');
								setState(() {
								  data = {
								  	'time' : result['time'],
										'location' : result['location'],
										'isDay' : result['isDay'],
										'flag' : result['flag'],
									};
								});
								},
							icon: Icon(
									Icons.edit_location,
									color: textColor,
							),
							label: Text(
									"Edit location",
									style: TextStyle(
										fontSize: 15,
										color: textColor,
									),
							),
						),
						SizedBox(height: 20,),
						Row(
							mainAxisAlignment: MainAxisAlignment.center,
							children: <Widget>[
								Text(
										data['location'],
									style: TextStyle(
										fontSize: 28,
										letterSpacing: 2,
										color: textColor,
									),
								),
							],
						),
						SizedBox(height: 20,),
						Text(
							data['time'],
							style: TextStyle(
								fontSize: 50,
								fontStyle: FontStyle.italic,
								color: textColor,
							),
						)
					],
				),
			    ),
			  ),
			),
		);
  }
}
