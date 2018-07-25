import 'package:flutter/material.dart';
import 'package:cocktails/screens/cocktailsList.dart';
import 'package:cocktails/model/category.Class.dart';

class Categories extends StatefulWidget {
  Categories({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CategoriesList createState() => new _CategoriesList();
}

class _CategoriesList extends State<Categories> {
  List<Category> names = new List<Category>();

  initState() {
    super.initState();
    _getCategories();
  }

  _getCategories() async{
    var result = await Category.fetchCategory();
    setState(() { names = result; });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body:ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
            new Card(
                  child: new ListTile(
                      title: new Center(child: Text(names[index].name)),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Cocktail(title:names[index].name)),
                        );
                  },
                ),
             ),
          itemCount: names.length,
        ),
    );
  }
}

