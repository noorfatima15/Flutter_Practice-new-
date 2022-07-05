import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api extends StatefulWidget {
  const Api({Key? key}) : super(key: key);

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  // get http => null;

  getuser() async {
    var users = [];
    var response =
        http.get(await Uri.https('jsonplaceholder.typicode.com', 'users'));
    var jsonData = jsonDecode(response.body);
    for (var i in jsonData) {
      UserModel user = UserModel(
        i['name'],
        i['username'],
        i['company']['name'],
      ); //api variables
      users.add(users);
    }

    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getuser(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Container(
            child: Text('nothing'),
          );
        } else
          return ListView.builder(
              itemCount: snapshot.data.lenght,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(snapshot.data[i].name),
                  subtitle: Text(snapshot.data[i].company),
                );
              });
      },
    ));
  }
}

class UserModel {
  var username;
  var company;
  var name;

  UserModel(this.company, this.name, this.username);
}

//https://jsonplaceholder.typicode.com/users
