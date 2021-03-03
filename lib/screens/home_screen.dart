import 'dart:convert';
import 'package:coctail/screens/drink_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var api = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail';
  var data;
  var txtStyle = TextStyle(color: Colors.white);

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    var res = await http.get(api);
    data = jsonDecode(res.body)['drinks'];

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orangeAccent, Colors.pinkAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Coctail App'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: data == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var drink = data[index];
                  return ListTile(
                    leading: Hero(
                      tag: drink['idDrink'],
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(drink['strDrinkThumb']),
                        radius: 22,
                      ),
                    ),
                    title: Text('${drink['strDrink']}', style: txtStyle),
                    subtitle: Text('${drink['idDrink']}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DrinkScreen(drink: drink),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
