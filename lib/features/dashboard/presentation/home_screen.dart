import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:s_s_s/features/dashboard/presentation/Remaining_water.dart';

import '../widgets/water_going_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textController = TextEditingController();

  final dataBaseRef = FirebaseDatabase.instance.ref('post');
  final ref = FirebaseDatabase.instance.ref();
  bool operation = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: ref.onValue,
          builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
            return !snapshot.hasData
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    children: [
                      const SizedBox(height: 80,),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Manual Switch",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Switch(
                                value: operation,
                                onChanged: (value) {
                                  setState(() {
                                    operation = value;
                                    if (operation == false) {
                                      dataBaseRef.set({'Manual_open': '0'});
                                    } else {
                                      dataBaseRef.set({'Manual_open': '1'});
                                    }
                                  });
                                }),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "OverFlow",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: snapshot.data!.snapshot
                                            .child('Overflow')
                                            .value ==
                                        0
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      const Text(
                        "Water Going by side",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          WaterGoingContainer(
                            text: 'left',
                            color: snapshot.data!.snapshot
                                        .child('Water_going_side')
                                        .value ==
                                    0
                                ? Colors.teal
                                : Colors.grey,
                          ),
                          WaterGoingContainer(
                            text: 'Close',
                            color: snapshot.data!.snapshot
                                        .child('Water_going_side')
                                        .value ==
                                    2
                                ? Colors.teal
                                : Colors.grey,
                          ),
                          WaterGoingContainer(
                            text: 'Right',
                            color: snapshot.data!.snapshot
                                        .child('Water_going_side')
                                        .value ==
                                    1
                                ? Colors.teal
                                : Colors.grey,
                          ),
                        ],
                      ),

                      // TextFormField(
                      //   controller: textController,
                      //   decoration: const InputDecoration(
                      //     hintText: "Enter Text",
                      //     fillColor: Colors.tealAccent,
                      //     filled: true,
                      //     border: OutlineInputBorder(),
                      //   ),
                      // ),
                      // const SizedBox(height: 30),
                      // ElevatedButton(
                      //   onPressed: () async {
                      //     dataBaseRef.set({'Manual_open': textController.text.toString()});
                      //     textController.clear();
                      //   },
                      //   child: const Text("Add"),
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(builder: (context) => RemainingWaterScreen()),
                      //     );
                      //   },
                      //   child: const Text("GO"),
                      // ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
