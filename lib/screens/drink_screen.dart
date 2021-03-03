import 'package:flutter/material.dart';

class DrinkScreen extends StatelessWidget {
  final drink;
  final txtStyle = TextStyle(color: Colors.white, fontSize: 25);
  DrinkScreen({@required this.drink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.pinkAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: drink['idDrink'],
              child: CircleAvatar(
                backgroundImage: NetworkImage(drink['strDrinkThumb']),
                radius: 100,
              ),
            ),
            SizedBox(height: 30),
            Text('${drink['idDrink']}'),
            SizedBox(height: 30),
            Text(
              '${drink['strDrink']}',
              style: txtStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
