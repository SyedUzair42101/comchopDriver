import 'package:flutter/material.dart';

class notifications extends StatelessWidget {
  const notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
              child: Text(
            'Notification',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 27),
          )),
          for (var i = 0; i < 5; i++)    Container(
            margin: EdgeInsets.all(5),

            height: 120,
            width: MediaQuery.of(context).size.width,
            decoration: new BoxDecoration(
                color: Color.fromRGBO(244, 244, 244, 1),
                borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text('Julie Andrews',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),),
              leading: Container(
                height: 100,
                width: 100,
                child: Center(child: Image.asset('images/person.png')),
              ),
              subtitle: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18,color: Color.fromRGBO(104, 113, 122, 1)),),

            ),
          )
        ],
      ),
    );
  }
}
