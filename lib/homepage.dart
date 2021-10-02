import 'package:clock_app/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //Hour & Minute dekhanor jonno ei
    // pub.dev theke (intl) pubspec.yaml a add korte hobe

    var now = DateTime.now();
    var formattedtime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timexoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (timexoneString.startsWith('-')) offsetSign = '+';
    print(timexoneString);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF2D2F41),
        body: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlutterLogo(),
                        //Image.asset('assets/clock_icon.png'),
                        Text(
                          'Nizam',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    )),
              ],
            ),
            VerticalDivider(
              color: Colors.white54,
              width: 25,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Clock',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      formattedtime,
                      style: TextStyle(color: Colors.white, fontSize: 64),
                    ),
                    Text(
                      formattedDate,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ClockView(),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Timezone',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                        Text(
                          'UTC' + offsetSign + timexoneString,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
