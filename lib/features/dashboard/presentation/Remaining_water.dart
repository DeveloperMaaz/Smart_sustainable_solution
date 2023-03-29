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
  final ref = FirebaseDatabase.instance.ref('post');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/lamp.jpg'),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
              Expanded(
                  child: StreamBuilder(
                stream: ref.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  return !snapshot.hasData
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const SizedBox(
                              width: 140,
                              height: 140,
                              child: CircularProgressIndicator(
                                  color: Colors.tealAccent,
                                  value: 0.3,
                                  backgroundColor: Colors.red,
                                  strokeWidth: 7),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50, top: 55),
                              child: Text(
                                "${snapshot.data!.snapshot.child('Manual_open').value} %",
                                style: const TextStyle(
                                  color: Colors.tealAccent,
                                  fontSize: 26,
                                ),
                              ),
                            ),
                          ],
                        );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
