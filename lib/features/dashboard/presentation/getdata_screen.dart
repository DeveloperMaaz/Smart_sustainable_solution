import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class GetDataScreen extends StatefulWidget {
  const GetDataScreen({Key? key}) : super(key: key);

  @override
  State<GetDataScreen> createState() => _GetDataScreenState();
}

class _GetDataScreenState extends State<GetDataScreen> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Expanded(
                child: StreamBuilder(
              stream: ref.onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                return ListView(
                  children: [
                    ListTile(
                      title: Text(snapshot.data!.snapshot
                          .child('Manual_open')
                          .value
                          .toString()),
                    ),
                    const Text("sds"),
                  ],
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
