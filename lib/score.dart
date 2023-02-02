import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  const Score({super.key, required this.score, required this.round});

  final int score;
  final int round;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
            child:
                const Text('Start Over', 
                style: TextStyle(color: Colors.blue)),
            onPressed: () {
              print('Start Over');
            }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: const <Widget>[
              Text('Score: '),
              Text('9999'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:  Row(
            children: const <Widget>[
              Text('Round: '),
              Text('99'),
            ],
          ),
        ),
        
        TextButton(
            child: const Text('Info', 
            style: TextStyle(color: Colors.blue)),
            onPressed: () {
              print('Info');
            }),
      ],
    );
  }
}
