import 'package:flutter/material.dart';
import '../functions/functions.dart';

class PhotoDetailScreen extends StatelessWidget {
  final Photo photo;

  const PhotoDetailScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(photo.url),
              const SizedBox(height: 15,),
              Text('Title: ${photo.title}'),
              Text('ID: ${photo.id}'),
            ],
          ),
        ),
      ),
    );
  }
}
