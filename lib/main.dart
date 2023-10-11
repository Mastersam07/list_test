import 'package:flutter/material.dart';

import 'name_vm.dart';

List<String> sampleNames = [
  'Alice',
  'Bob',
  'Charlie',
  'David',
  'Eve',
  'Frank',
  'Grace',
  'Hannah',
  'Isaac',
  'Jack',
  'Katie',
  'Liam',
  'Mia',
  'Nathan',
  'Olivia',
  'Paul',
  'Quinn',
  'Rachel',
  'Steve',
  'Tina',
  'Ulysses',
  'Vera',
  'Will',
  'Xena',
  'Yara',
  'Zane',
  'Anna',
  'Brian',
  'Catherine',
  'Derek',
  'Elaine',
  'Freddie',
  'Gina',
  'Howard',
  'Ivy',
  'Justin',
  'Karen',
  'Larry',
  'Monica',
  'Nick',
  'Oscar',
  'Patty',
  'Quincy',
  'Rebecca',
  'Sam',
  'Tiffany',
  'Ursula',
  'Victor',
  'Wendy',
  'Xander',
  'Yvonne',
  'Zach',
  'Amber',
  'Brad',
  'Chloe',
  'Dominic',
  'Ellen',
  'Felix',
  'Gloria',
  'Ian',
  'Jasmine',
  'Kyle',
  'Laura',
  'Mike',
  'Nancy',
  'Otto',
  'Pamela',
  'Quinton',
  'Rita',
  'Shawn',
  'Tracy',
  'Upton',
  'Valerie',
  'Walter',
  'Xiomara',
  'Yasmine',
  'Zeus',
  'Amy',
  'Blake',
  'Cindy',
  'Dexter',
  'Emma',
  'Flynn',
  'Gwen',
  'Hugo',
  'Irene',
  'Jake',
  'Kelly',
  'Leo',
  'Mandy',
  'Ned',
  'Opal',
  'Priscilla',
  'Quest',
  'Randy',
  'Stella',
  'Tom',
  'Uma',
  'Vincent',
  'Whitney',
  'Xerxes',
  'Yolanda',
  'Zelda'
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NameVm vm = NameVm();

  @override
  void initState() {
    super.initState();
    vm.addListener(() {
      setState(() {});
    });
    vm.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        key: const Key('outerListView'),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: vm.nameList.length,
        itemBuilder: (context, index) {
          final entry = vm.nameList.entries.elementAt(index);
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(entry.key),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final name = entry.value.elementAt(index);
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.purple,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: Text(name)),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: entry.value.length,
              )
            ],
          );
        },
      ),
    );
  }
}
