import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DiscardWaterScreen extends StatefulWidget {
  const DiscardWaterScreen({Key? key}) : super(key: key);

  @override
  State<DiscardWaterScreen> createState() => _DiscardWaterScreenState();
}

class _DiscardWaterScreenState extends State<DiscardWaterScreen> {
  final ref = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: ref.onValue,
          builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
            return !snapshot.hasData
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Discard Water",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          snapshot.data!.snapshot
                              .child('Discard_water_in_day')
                              .value
                              .toString(),
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
