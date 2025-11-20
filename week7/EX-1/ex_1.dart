import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ButtonListScreen(),
    ));

class ButtonListScreen extends StatelessWidget {
  const ButtonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom buttons"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SelectableButton(),
            SizedBox(height: 20),
            SelectableButton(),
            SizedBox(height: 20),
            SelectableButton(),
          ],
        ),
      ),
    );
  }
}

class SelectableButton extends StatefulWidget {
  const SelectableButton({super.key});

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;

  // getters for button properties
  String get buttonText => isSelected ? "Selected" : "Not Selected";

  Color get textColor => isSelected ? Colors.white : Colors.black;

  Color get backgroundColor =>
      isSelected ? Colors.blue[500]! : Colors.blue[50]!;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            isSelected = !isSelected; // Toggle the state
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
