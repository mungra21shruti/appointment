import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class interview extends StatefulWidget {
  const interview({super.key});

  @override
  State<interview> createState() => _interviewState();
}

class _interviewState extends State<interview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // body: StreamBuilder(
      //   stream: FirebaseFirestore.instance.collection('data').snapshots(),
      //   builder: (context, snapshot) {
      //     // if (snapshot.hasData) {
      //     //   // <3> Retrieve `List<DocumentSnapshot>` from snapshot
      //     //   final List<DocumentSnapshot> documents = snapshot.data.docs;
      //     //   return ListView(
      //     //       children: documents
      //     //           .map((doc) => Card(
      //     //         child: ListTile(
      //     //           title: Text(doc['text']),
      //     //           subtitle: Text(doc['email']),
      //     //         ),
      //     //       ))
      //     //           .toList());
      //     // } else if (snapshot.hasError) {
      //     //   return Text('It's Error!');
      //     //   }
      //     if (snapshot.hasError) {
      //       return Text('Something went wrong');
      //     }
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Text("Loading");
      //     }
      //     return ListView.builder(
      //       itemCount: 5,
      //       itemBuilder: (context, index) {
      //         return Container(
      //           height: 100,
      //           margin: EdgeInsets.all(10),
      //           child: Text("data"),
      //         );
      //       },
      //     );
      //   },
      // ),
      body: FutureBuilder(
        future: ForgetttingDataFromFirebasde(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("==${snapshot.data}");
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  subtitle: Text("${snapshot.data![index]['currentItem']}"),
                  title: Text("${snapshot.data![index]['Studentname']}"),
                );
              },
            );
          }
          return CircularProgressIndicator();
        },
      ),
    ));
  }

  Future<List> ForgetttingDataFromFirebasde() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("data");
    DatabaseEvent de = await ref.once(DatabaseEventType.value);

    print(de.snapshot.value);

    Map map = de.snapshot.value as Map;
    List dataa = [];

    map.forEach((key, value) {
      // print("$key==========");
      dataa.add(value);
    });
    print("=======$dataa");
    print("====333===${dataa[1]}");

    return dataa;
  }
}
