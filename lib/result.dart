import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'Þvílíkur snillingur ertu!';
    } else if (resultScore <= 12) {
      resultText = 'Vá þú ert mega cool!';
    } else if (resultScore <= 16) {
      resultText = 'Sælir gefðu hinum smá séns!';
    } else {
      resultText = 'Þú ert algjör stjarna!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Text(
              resultPhrase,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          TextButton(
            child: Text(
              'Taka próf aftur',
              style: TextStyle(color: Colors.pink, fontSize: 20),
            ),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
