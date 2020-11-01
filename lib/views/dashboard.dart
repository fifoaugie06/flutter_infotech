import 'package:flutter/material.dart';
import 'package:flutter_infotech/providers/CategoryProvider.dart';
import 'package:flutter_infotech/views/detailnews.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
}
