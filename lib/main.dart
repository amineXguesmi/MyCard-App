import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MaterialApp(
    home: Amine(),
  ));
}

class Amine extends StatefulWidget {
  const Amine({Key? key}) : super(key: key);

  @override
  State<Amine> createState() => _AmineState();
}

class _AmineState extends State<Amine> {
  int age = 0;
  final String _url = 'https://www.facebook.com/amine.125.gasmi/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Amine Card'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/118152581_2712018789055030_1436693727787210158_n.jpg'),
                radius: 50,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[800],
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'FULL NAME :',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'Mohamed Amine Guesmi',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Center(
              child: Text(
                'AGE :',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (age <= 20) age += 1;
                    });
                  },
                  backgroundColor: Colors.grey[850],
                  child: Text(
                    '$age',
                    style: TextStyle(
                      color: Colors.amberAccent[200],
                      letterSpacing: 2.0,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'EDUCATION LEVEL :',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'software engineering',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Center(
              child: Text(
                'programming language  :',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            list(),
            SizedBox(height: 30.0),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10),
                Text(
                  'mohamedamine.guesmi@insat.ucar.tn',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 15,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.mail_outline),
                  label: Text('mail me '),
                  color: Colors.amber[400],
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
                  onPressed: () async {
                    if (await canLaunch(_url)) {
                      throw 'Could not launch $_url';
                    } else {
                      await launch(
                        _url,
                        forceSafariVC: true,
                        forceWebView: true,
                        enableJavaScript: true,
                      );
                    }
                  },
                  icon: Icon(
                    Icons.facebook,
                    color: Colors.blue,
                  ),
                  label: Text(''),
                  color: Colors.grey[400],
                ),
                FlatButton.icon(
                  onPressed: () async {
                    const number = '58877240'; //set the number here
                    var res = await FlutterPhoneDirectCaller.callNumber(number);
                  },
                  icon: Icon(
                    Icons.add_call,
                    color: Colors.green,
                  ),
                  label: Text(''),
                  color: Colors.grey[400],
                ),
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.voice_chat),
                  label: Text(''),
                  color: Colors.grey[400],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class list extends StatefulWidget {
  const list({Key? key}) : super(key: key);

  @override
  State<list> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<list> {
  String dropdownValue = 'C';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(
        Icons.arrow_downward,
        color: Colors.deepPurpleAccent,
      ),
      elevation: 16,
      iconSize: 40,
      style: const TextStyle(color: Colors.amber, fontSize: 24),
      underline: Container(
        height: 2,
        color: Colors.amber,
      ),
      isExpanded: true,
      dropdownColor: Colors.grey[850],
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['C', 'C++', 'JAVA', 'Python', 'JS', 'PHP', 'Dart']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Center(
              child: Text(
            value,
          )),
        );
      }).toList(),
    );
  }
}
