import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_infotech/providers/CategoryProvider.dart';
import 'package:flutter_infotech/views/detailnews.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final categoryNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showMaterialDialog();
          },
          child: Icon(Icons.add),
        ),
        body: RefreshIndicator(
          onRefresh: () => Provider.of<CategoryProvider>(context, listen: false)
              .getCategory(),
          child: FutureBuilder(
            future: Provider.of<CategoryProvider>(context, listen: false)
                .getCategory(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Consumer<CategoryProvider>(
                builder: (context, dataCategory, _) {
                  return ListView.builder(
                    itemCount: dataCategory.category.data.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => DetailNews(
                                id: dataCategory.category.data[i].id,
                              ),
                            ),
                          );
                        },
                        onLongPress: () {
                          // print(dataCategory.category.data[i].id);
                          _deleteCategory(dataCategory.category.data[i].id);
                        },
                        onDoubleTap: () {
                          _updateCategory(dataCategory.category.data[i].id,
                              dataCategory.category.data[i].titleNewsCategory);
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(
                              16,
                            ),
                            child: Text(
                              dataCategory.category.data[i].titleNewsCategory,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  _showMaterialDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Tambah Kategori"),
        content: TextField(
          controller: categoryNameController,
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Submit'),
            onPressed: () {
              Provider.of<CategoryProvider>(context, listen: false)
                  .addCategory(categoryNameController.text)
                  .then((value) => {
                        if (value == 200)
                          {print('yeay')}

                        else
                          {print('Something wrong')}
                      });
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  _deleteCategory(int id) {
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: new Text("Konfirmasi"),
        content: new Text("Anda yakin mau menghapus ?"),
        actions: <Widget>[
          FlatButton(
            child: Text('Delete'),
            onPressed: () {
              Provider.of<CategoryProvider>(context, listen: false)
                  .deleteCategory(id.toString())
                  .then((value) => {
                        if (value == 200)
                          {
                            print('berhasil dihapus')

                          }
                        else
                          {print('Something wrong')}
                      });
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  _updateCategory(int id, String titleNewsCategory) {
    categoryNameController.text = titleNewsCategory;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Update Kategori"),
        content: TextField(
          controller: categoryNameController,
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Submit'),
            onPressed: () {
              Provider.of<CategoryProvider>(context, listen: false)
                  .updateCategory(id.toString(), categoryNameController.text)
                  .then((value) => {
                        if (value == 200)
                          {print('Berhasil diupdate')}
                        else
                          {print('Something wrong')}
                      });
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
