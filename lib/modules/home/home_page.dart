import 'dart:ui';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Home',
          style: TextStyle(fontSize: 24),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
          child: Column(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Color(0xff908BDF),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      top: 22,
                      left: 22,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '23°',
                              style: TextStyle(
                                fontSize: 52,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Monday',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned.fill(
                      left: 22,
                      bottom: 22,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'São José do Cedro',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      right: 22,
                      bottom: 22,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child:Text(
                          'Céu limpo',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      right: 0,
                      top: 0,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Image(
                          image: AssetImage('assets/images/png/clear_sky.png'),
                          height: 150
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
