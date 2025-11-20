import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false, // Hides the DEBUG banner in debug builds
    home: const ImageGallery(),
  ),
);

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int _currentIndex = 0; // index of the currently displayed image

  // Show previous image (circular)
  void _showPrevious() {
    setState(() {
      _currentIndex = (_currentIndex - 1) % images.length;
      if (_currentIndex < 0) _currentIndex += images.length;
    });
  }

  // Show next image (circular)
  void _showNext() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: _showPrevious,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: _showNext,
            ),
          ),
        ],
      ),
      body: Center(
        child: Image.asset(images[_currentIndex], fit: BoxFit.contain),
      ),
    );
  }
}
