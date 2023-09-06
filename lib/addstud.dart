import 'package:appointment/add.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class addstud extends StatefulWidget {
  String currentItem;

  addstud(this.currentItem);

  @override
  State<addstud> createState() => _addstudState();
}

class _addstudState extends State<addstud> {
  TextEditingController studentname = TextEditingController();
  TextEditingController Behavioral = TextEditingController();
  TextEditingController Communication = TextEditingController();
  TextEditingController Problem_solving = TextEditingController();
  TextEditingController Strategic_thinking = TextEditingController();
  TextEditingController Personality = TextEditingController();
  TextEditingController Remark = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Scaffold(
            body: Column(children: [
              Container(
                padding: EdgeInsets.all(8.0),
                color: CupertinoColors.systemGrey,
                width: double.infinity,
                height: 50,
                child: TextField(
                  controller: studentname,
                  decoration: InputDecoration(
                      hintText: "Full Name", border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                color: CupertinoColors.systemGrey,
                width: double.infinity,
                height: 50,
                child: TextField(
                  controller: Behavioral,
                  decoration: InputDecoration(
                      hintText: "Behavioral", border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                color: CupertinoColors.systemGrey,
                width: double.infinity,
                height: 50,
                child: TextField(
                  controller: Communication,
                  decoration: InputDecoration(
                      hintText: "Communication", border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                color: CupertinoColors.systemGrey,
                width: double.infinity,
                height: 50,
                child: TextField(
                  controller: Problem_solving,
                  decoration: InputDecoration(
                      hintText: "Problem_solving", border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                color: CupertinoColors.systemGrey,
                width: double.infinity,
                height: 50,
                child: TextField(
                  controller: Strategic_thinking,
                  decoration: InputDecoration(
                      hintText: "Strategic_thinking", border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                color: CupertinoColors.systemGrey,
                width: double.infinity,
                height: 50,
                child: TextField(
                  controller: Personality,
                  decoration: InputDecoration(
                      hintText: "Personality", border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                color: CupertinoColors.systemGrey,
                width: double.infinity,
                height: 50,
                child: TextField(
                  controller: Remark,
                  decoration: InputDecoration(
                      hintText: "Remark", border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    DatabaseReference ref = FirebaseDatabase.instance
                        .ref("Data/${widget.currentItem}")
                        .push();
                    await ref.set({
                      "Studentname": studentname.text,
                      "Behavioral": Behavioral.text,
                      "Communication": Communication.text,
                      "Problem_solving": Problem_solving.text,
                      "Strategic_thinking": Strategic_thinking.text,
                      "Personality": Personality.text,
                      "Remark": Remark.text,
                    }).then((value) {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return homepage();
                        },
                      ));
                    });
                  },
                  child: Text("Sumbit"))
            ]),
          ),
        ),
      ),
    );
  }
}
