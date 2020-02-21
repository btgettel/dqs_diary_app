import 'package:flutter/material.dart';

const categories = <String>[
  'Fruits',
  'Vegetables',
  'Lean Meat',
  'Nuts and Seeds',
  'Whole Grains',
  'Dairy',
  'Refined Grains',
  'Sweets',
  'Fried Foods',
  'Fatty Proteins'
];

Widget buildCategories() {

  return ListView.builder(
    padding: const EdgeInsets.all(16.0),
    itemCount: categories.length*2,
    itemBuilder: (context, i){
      if(i.isOdd) return Divider();

      final index = i ~/ 2;
      return FoodCategory(title: categories[index]);
      //return FoodCategory();
    },
  );
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Diet Quality Diary',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Diet Quality Diary'),
          ),
          body: buildCategories(),
          //body: ListView(
          //  children: List.generate(5, (i) => FoodCategory(title: categories[i])),
        )
    );
  }
}

class FoodCategoryState extends State<FoodCategory> {
  int _categoryCount = 0;
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(widget.title, style: _biggerFont,),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _categoryCount!=0? IconButton(icon: Icon(Icons.remove), onPressed: () =>setState(()=> _categoryCount--),):Container(),
          Text(_categoryCount.toString()),
          IconButton(icon: Icon(Icons.add), onPressed: () => setState(()=> _categoryCount++)),
        ],
      ),
    );
  }
}


class FoodCategory extends StatefulWidget {
  final String title;
  FoodCategory({this.title});
  @override
  FoodCategoryState createState() => FoodCategoryState();
}
