import 'package:flutter/material.dart';
import 'package:flutter_infotech/models/Category.dart';
import 'package:flutter_infotech/models/CategoryDetail.dart';
import 'package:flutter_infotech/providers/CategoryProvider.dart';
import 'package:provider/provider.dart';

class DetailNews extends StatefulWidget {
  int id;

  DetailNews({@required this.id});

  @override
  _DetailNewsState createState() => _DetailNewsState(id: id);
}

class _DetailNewsState extends State<DetailNews> {
  int id;

  _DetailNewsState({@required this.id});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () => Provider.of<CategoryProvider>(context, listen: false)
              .getCategoryDetail(
            id.toString(),
          ),
          child: FutureBuilder(
            future: Provider.of<CategoryProvider>(context, listen: false)
                .getCategoryDetail(
              id.toString(),
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Consumer<CategoryProvider>(
                builder: (context, dataCategory, _) {
                  return ListView.builder(
                    itemCount: dataCategory.categoryDetail.data.news.length,
                    itemBuilder: (context, i) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(
                            16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dataCategory.categoryDetail.data.news[i].titleNews,
                              ),
                              Text(
                                dataCategory.categoryDetail.data.news[i].content,
                              ),
                            ],
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
