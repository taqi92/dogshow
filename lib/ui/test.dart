import 'package:flutter/material.dart';


class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Curved Card Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.green],
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                width: 300,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Beautiful Curved Card',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            // Add functionality for the first button here
                          },
                          child: Text('Button 1'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Add functionality for the second button here
                          },
                          child: Text('Button 2'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
