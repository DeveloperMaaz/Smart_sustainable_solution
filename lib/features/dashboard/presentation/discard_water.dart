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
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
          title: const Text("Smart Sustainable Solution"),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/discard_water.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: StreamBuilder(
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
                          const SizedBox(
                            height: 180,
                          ),
                          const Text(
                            "Discard Water",
                            style: TextStyle(
                                color: Colors.lightGreen,
                                fontSize: 44,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                snapshot.data!.snapshot
                                    .child('Discard_water_in_day')
                                    .value
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 10,),
                              const Text(
                                "Litters",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
