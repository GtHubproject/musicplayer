import 'package:flutter/material.dart';

void showPlaylistDialog(BuildContext context) {
   showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(backgroundColor: Colors.white12,
                      title: Text(
                        'Creating New Playlist',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              //labelText: 'Playlist',
                              filled: true,
                              fillColor: Colors.yellow.shade50,
                            ),
                            controller: TextEditingController(text: 'Playlist1'),
                          ),
                        SizedBox(height: 20),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); 
                          },
                          child: Text('Cancel',style: TextStyle(color: Colors.amberAccent)),
                        ),
                        TextButton(
                          onPressed: () {
                             Navigator.pop(context); 
                           },
                          child: Text('OK',style: TextStyle(color: Colors.amberAccent),),
                        ),
                      ],
                    );
                  },
                );
}

