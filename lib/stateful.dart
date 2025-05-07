import 'package:flutter/material.dart';

class StateFullClass extends StatefulWidget {
  const StateFullClass({super.key});

  @override
  State<StateFullClass> createState() => _StateFullClassState();
}

class _StateFullClassState extends State<StateFullClass> {
  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful Class"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            Text(
              counter.toString(),
              style: TextStyle(
                fontSize: 50,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    minimumSize: Size(100, 60),
                  ),
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter--;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    minimumSize: Size(100, 60),
                  ),
                  child: Text(
                    '-',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
