import 'package:flutter/material.dart';

import 'result.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final textController = TextEditingController();
  late FocusNode focusNode;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.requestFocus();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    focusNode.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Icon(
              Icons.business,
              size: 100.0,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                focusNode: focusNode,
                controller: textController,
                decoration: const InputDecoration(
                    icon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    labelText: 'Enter Company name'),
              ),
            ),
            LinearProgressIndicator(
              value: animationController.value,
              semanticsLabel: "Loading",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _searchValue,
        tooltip: 'Search',
        label: const Text('Search'),
        enableFeedback: true,
        icon: const Icon(Icons.search),
      ),
    );
  }

  void _searchValue() {
    if (textController.text.isNotEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Result(value: textController.text)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 7),
        content: const Text('Enter company name to start searching'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            focusNode.requestFocus();
          },
        ),
      ));
    }
  }
}
