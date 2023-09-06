import 'package:appointment/addstud.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class add extends StatefulWidget {
  const add({super.key});

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  List<String> items = ["FLUTTER", "UI-UX", "WEBDESIGN", "ANDROID"];
  String currentItem = "";
  TextEditingController Name = TextEditingController();

  @override
  void initState() {
    currentItem = items[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
          body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.blueGrey.shade300,
              width: double.infinity,
              height: 50,
              child: DropdownButton(
                elevation: 15,
                borderRadius: BorderRadius.circular(20),
                value: currentItem,
                items: items
                    .map<DropdownMenuItem<String>>(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                onChanged: (String? value) => setState(
                  () {
                    if (value != null) currentItem = value;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.blueGrey.shade300,
              width: double.infinity,
              height: 50,
              child: TextField(
                controller: Name,
                decoration: InputDecoration(
                    hintText: "Full Name", border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  DatabaseReference ref =
                      FirebaseDatabase.instance.ref("Data/$currentItem").push();
                  String? id = ref.key;
                  await ref
                      .set({"id": id, "prof.Name": Name.text}).then((value) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return addstud(currentItem);
                      },
                    ));
                  });
                },
                child: Text("ADD STUDENT"))
          ],
        ),
      )),
    );
  }
}
