import 'package:flutter/material.dart';


import 'package:flutter/material.dart';

Widget ArtistsView() {
  return ListView.builder(
    itemCount: 5,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text('Artist $index'),
        trailing: Icon(Icons.arrow_forward),
        leading: Icon(Icons.person),
      );
    },
  );
}
