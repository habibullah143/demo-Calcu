import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int firstnum;
  late int secondnum;
  String texttodisplay = "";
  late String res;
  late String operatorform;

  void btnclicked(String btnval) {
    if (btnval == "C") {
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = "0";
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "*" ||
        btnval == "/") {
      firstnum = int.parse(texttodisplay);
      res = "";
      operatorform = btnval;
    } else if (btnval == "=") {
      secondnum = int.parse(texttodisplay);
      if (operatorform == "+") {
        res = (firstnum + secondnum).toString();
      }
      if (operatorform == "-") {
        res = (firstnum - secondnum).toString();
      }
      if (operatorform == "/") {
        res = (firstnum / secondnum).toString();
      }
      if (operatorform == "*") {
        res = (firstnum * secondnum).toString();
      }
    } else {
      res = int.parse(texttodisplay + btnval).toString();
    }
    setState(() {
      texttodisplay = res;
    });
  }

  Widget custombutton(String btnval) {
    return Expanded(
        child: OutlineButton(
      padding: const EdgeInsets.all(25.0),
      onPressed: () => btnclicked(btnval),
      child: Text(
        "$btnval",
        style: const TextStyle(fontSize: 25.0),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Container(
          child: Column(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.bottomRight,
            child: Text(
              "$texttodisplay",
              style:
                  const TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
            ),
          )),
          Row(
            children: [
              custombutton("7"),
              custombutton("8"),
              custombutton("9"),
              custombutton("*"),
            ],
          ),
          Row(
            children: [
              custombutton("4"),
              custombutton("5"),
              custombutton("6"),
              custombutton("-"),
            ],
          ),
          Row(
            children: [
              custombutton("1"),
              custombutton("2"),
              custombutton("3"),
              custombutton("+"),
            ],
          ),
          Row(
            children: [
              custombutton("C"),
              custombutton("0"),
              custombutton("="),
              custombutton("/"),
            ],
          ),
        ],
      )),
    );
  }
}
