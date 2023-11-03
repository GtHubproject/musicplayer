import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

Widget AlbumsView() {
  return ListView.builder(
    itemCount: 3,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text('Album $index'),
        trailing: Icon(Icons.arrow_forward),
        leading: Icon(Icons.album),
      );
    },
  );
}