import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RemainingWaterScreen extends StatefulWidget {
  const RemainingWaterScreen({Key? key}) : super(key: key);

  @override
  State<RemainingWaterScreen> createState() => _RemainingWaterScreenState();
}

class _RemainingWaterScreenState extends State<RemainingWaterScreen> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
          title: const Text("Smart Sustainable Solution"),
        ),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/lamp.jpg'),
                  fit: BoxFit.cover)),
          child: Expanded(
              child: StreamBuilder(
            stream: ref.onValue,
            builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
              return !snapshot.hasData
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        const SizedBox(
                          height: 280,
                        ),
                        const Text(
                          "Remaining Water",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 29,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const SizedBox(
                              width: 140,
                              height: 140,
                              child: CircularProgressIndicator(
                                  color: Colors.green,
                                  value: 0.6,
                                  backgroundColor: Colors.white,
                                  strokeWidth: 7),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50, top: 55),
                              child: Text(
                                "${snapshot.data!.snapshot.child('Remaining_Water').value} %",
                                style: const TextStyle(
                                  color: Colors.tealAccent,
                                  fontSize: 26,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
            },
          )),
        ),
      ),
    );
  }
}
