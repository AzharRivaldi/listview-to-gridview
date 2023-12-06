import 'package:flutter/material.dart';

import 'model/model_data.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Switch List to Grid",
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var status = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Switch List to Grid"),
          actions: [
            IconButton(
              icon: status == 0
                  ? const Icon(
                      Icons.list,
                      color: Colors.white,)
                  : const Icon(
                      Icons.grid_view,
                      color: Colors.white,),
              onPressed: () {
                setState(() {
                  if (status == 0) {
                    status = 1;
                  } else {
                    status = 0;
                  }
                });
              },
            ),
          ],
        ),
        body: status == 0
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    clipBehavior: Clip.antiAlias,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    child: ListTile(
                      leading: Image.network(data[index]['image']),
                      title: Text(data[index]['title']),
                      subtitle: Text(data[index]['desc']),
                      trailing:
                          const Icon(Icons.bookmark_border, color: Colors.red),
                    ),
                  );
                },
                itemCount: data.length)
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    elevation: 5,
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Image.network(data[index]['image'],
                                height: 160, fit: BoxFit.cover)),
                        const SizedBox(
                          height: 6,
                        ),
                        ListTile(
                          title: Text(data[index]['title']),
                          subtitle: Text(data[index]['desc']),
                          trailing: const Icon(Icons.bookmark_border,
                              color: Colors.red),
                        )
                      ],
                    ),
                  );
                }));
  }
}
