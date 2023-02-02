import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'prompt.dart';
import 'control.dart';
import 'score.dart';
import 'game_model.dart';

void main() {
  runApp(const BulleEyeApp());
}

class BulleEyeApp extends StatelessWidget {
  const BulleEyeApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return const MaterialApp(
      title: 'Bullseye',
      home: GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  var _isAlertVisible = false;
  late GameModel _model;

  @override
  void initState() {
    super.initState();
    _model = GameModel(50);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Prompt(targetValue: 100),
            Control(model: _model),
            TextButton(
              child: const Text('Hit me', style: TextStyle(color: Colors.blue)),
              onPressed: () {
                _isAlertVisible = true;
                _showAlert(context);
              },
            ),
            const Score(round: 1, score: 0),
          ],
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    var okButton = TextButton(
        child: const Text('Awesome!'),
        onPressed: () {
          Navigator.of(context).pop();
          _isAlertVisible = false;
          print('Awesome presses! $_isAlertVisible');
        });
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Hello There'),
            content: Text('The slider\'s value is: ${_model.current}'),
            actions: [
              okButton,
            ],
            elevation: 5,
          );
        });
  }
}
