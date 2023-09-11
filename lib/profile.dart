import 'package:flutter/material.dart';

class profil extends StatefulWidget {
  const profil({super.key});

  @override
  State<profil> createState() => _profilState();
}

class _profilState extends State<profil> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Container(
        height: 200,
        width: 200,
        child: ElevatedButton(onPressed: () {}, child: Text("Total interview")),
      )),
    ));
  }
}
