import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:s_s_s/features/dashboard/presentation/getdata_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  TextEditingController textController = TextEditingController();

  final dataBaseRef = FirebaseDatabase.instance.ref('post');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("SSS"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: textController,
            decoration: const InputDecoration(
              hintText: "Enter Text",
              fillColor: Colors.tealAccent,
              filled: true,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async {
              dataBaseRef.set({'Manual_open': textController.text.toString()});
              textController.clear();
            },
            child: const Text("Add"),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GetDataScreen()),
              );
            },
            child: const Text("GO"),
          ),
        ],
      ),
    );
  }
}
