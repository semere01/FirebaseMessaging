// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:provider/provider.dart';

// class ChatsNewPage extends StatefulWidget {
//   ChatsNewPage({Key? key}) : super(key: key);

//   @override
//   State<ChatsNewPage> createState() => _ChatsNewPageState();
// }

// class _ChatsNewPageState extends State<ChatsNewPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(
//           autofocus: true,
//           decoration: InputDecoration(
//             hintText: ' Enter username',
//           ),
//         ),
//       ),
//       body: _messagingBody(),
//     );
//   }

//   _showDialog() {
//     showDialog<void>(
//       barrierColor: Color.fromARGB(100, 200, 200, 200),
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Success"),
//           titleTextStyle: TextStyle(
//               fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
//           actionsOverflowButtonSpacing: 20,
//           actions: [
//             ElevatedButton(onPressed: () {}, child: Text("Back")),
//             ElevatedButton(onPressed: () {}, child: Text("Next")),
//           ],
//           content: Text("Saved successfully"),
//         );
//       },
//       context: context,
//     );
//   }

//   _messagingBody() {
//     return TextButton(
//         onPressed: _showDialog,
//         child: Text("hi"));
//   }
// }
