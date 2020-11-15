import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_infotech/config/globalConfig.dart';
import 'package:flutter_infotech/models/Category.dart';
import 'package:flutter_infotech/models/CategoryDetail.dart';
import 'package:http/http.dart' as http;

class CategoryProvider extends ChangeNotifier {
  Category _category;

  Category get category => _category;

  CategoryDetail _categoryDetail;

  CategoryDetail get categoryDetail => _categoryDetail;

  Future<int> getCategory() async {
    String url = GlobalConfig.CATEGORY_API;

    final response = await http.get(url);

    if (response.statusCode == 200) {
      _category = Category.fromJson(jsonDecode(response.body));

      notifyListeners();

      return 200;
    } else if (response.statusCode == 400) {
      return 400;
    }
  }

  Future<int> getCategoryDetail(String id) async {
    String url = GlobalConfig.CATEGORY_API + "/" + id;

    final response = await http.get(url);

    if (response.statusCode == 200) {
      _categoryDetail = CategoryDetail.fromJson(jsonDecode(response.body));

      notifyListeners();

      return 200;
    } else if (response.statusCode == 400) {
      return 400;
    }
  }

  Future<int> addCategory(String name) async {
    String url = GlobalConfig.CATEGORY_API + "/";

    var body = json.encode({
      'TitleNewsCategory': name
    });

    final response =
        await http.post(url, body: body);

    print(response.statusCode);
    if (response.statusCode == 200) {

      notifyListeners();

      return 200;
    } else if (response.statusCode == 400) {
      return 400;
    }
  }

  Future<int> updateCategory(String id, String name) async {
    String url = GlobalConfig.CATEGORY_API + "/" + id;

    var body = json.encode({
      'TitleNewsCategory': name
    });

    final response =
    await http.put(url, body: body);

    print(response.statusCode);
    if (response.statusCode == 200) {

      notifyListeners();

      return 200;
    } else if (response.statusCode == 400) {
      return 400;
    }
  }

  Future<int> deleteCategory(String id) async {
    String url = GlobalConfig.CATEGORY_API + "/" + id;

    final response = await http.delete(url);

    if (response.statusCode == 200) {

      notifyListeners();

      return 200;
    } else if (response.statusCode == 400) {
      return 400;
    }
  }


}
