// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exploring UI widgets',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Long ListView Page'),
        ),
        body: getLIstView(),
        // body: getListView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint('Floating Action Button Pressed');
          },
          child: Icon(Icons.add),
          tooltip: "Add mote Item",
        ),
      ),
    );
  }
}

// Widget getListView() {
//   var listView = ListView(
//     children: <Widget>[
//       ListTile(
//         leading: Icon(Icons.landscape),
//         title: Text('Landscape'),
//         subtitle: Text('Beautiful View'),
//         trailing: Icon(Icons.wb_sunny),
//       ),
//       ListTile(
//         leading: Icon(Icons.laptop_mac),
//         title: Text('Macbook Pro'),
//         subtitle: Text('Macbook Pro is a laptop'),
//         trailing: Icon(Icons.keyboard_arrow_right),
//       ),
//       ListTile(
//         leading: Icon(Icons.phone),
//         title: Text('Phone'),
//         subtitle: Text('Phone is a device'),
//         trailing: Icon(Icons.keyboard_arrow_right),
//       ),
//       Container(
//         margin: EdgeInsets.only(left: 40),
//         child: Text("Yet Another List Item",
//             style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20.0,
//                 fontFamily: "Roboto")),
//       ),
//       Container(
//         margin: EdgeInsets.all(30.0),
//         color: Colors.red,
//         height: 40.0,
//         width: 40.0,
//         child: Center(
//           child: Text("Another Item",
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20.0,
//                   fontFamily: "Roboto",
//                   color: Colors.white)),
//         ),
//       ),
//       Image(image: AssetImage('images/fbook.png'), height: 100.0, width: 100),
//     ],
//   );
//   return listView;
// }

List<String> getListElements() {
  var items = List<String>.generate(1000, (counter) => "Item $counter");
  return items;
}

Widget getLIstView() {
  var listItem = getListElements();

  var listView = ListView.builder(
    itemBuilder: (context, index) {
      return Container(
        color: Color.fromARGB(255, 238, 112, 74),
        margin: EdgeInsets.all(5.0),
        child: ListTile(
          // leading:Icon(Icons.laptop_mac, color: Color.fromARGB(255, 39, 233, 32)),
          leading: Image(
            image: AssetImage('images/fbook.png'),
            height: 40.0,
            width: 40.0,
          ),
          title: Text(listItem[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: "Roboto",
                  color: Color.fromARGB(255, 247, 242, 244))),
          trailing: Icon(Icons.keyboard_arrow_right,
              color: Color.fromARGB(255, 88, 20, 247), size: 30.0),
          onTap: () {
            // debugPrint('${listItem[index]} was tapped');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${listItem[index]} was tapped'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    // debugPrint('Undoing the process');
                  },
                ),
              ),
            );
          },
        ),
      );
    },
  );
  return listView;
}
