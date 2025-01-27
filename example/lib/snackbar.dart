import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:nt4f04unds_widgets/nt4f04unds_widgets.dart';

class SnackbarExamples extends StatelessWidget {
  const SnackbarExamples({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screen(
      name: 'snackbar',
      children: [
        Tile(
          name: 'snackbar',
          onTap: () => NFSnackbarController.showSnackbar(
              NFSnackbarEntry(
                child: NFSnackbar(
                  title: Text('test'),
                  trailing: NFButton(text: 'action', onPressed: () {}),
                  color: Colors.blue,
                  leading: Icon(Icons.animation),
                ),
              ),
            ),
        ),
        Tile(
          name: 'important snackbar',
          onTap: () => NFSnackbarController.showSnackbar(
              NFSnackbarEntry(
                important: true,
                child: NFSnackbar(
                  title: Text('test'),
                  trailing: NFButton(text: 'action', onPressed: () {}),
                  color: Colors.red,
                  leading: Icon(Icons.copy),
                ),
              ),
            ),
        ),
      ]
    );
  }
}