import 'package:flutter/material.dart';
import '../../data/responses/api_response.dart';
import '../../models/news/news_model.dart';
import '../../repository/news/news_repository.dart';
import '../../resources/url/app_url.dart';

class NewsViewModel with ChangeNotifier {
  final NewsRepository _newsRepo = NewsRepository();

  ApiResponse<List<NewsModel>> expressNewsList = ApiResponse.loading();

  setNewsList(ApiResponse<List<NewsModel>> data,
      {bool isExpress = false, bool isGeo = false, bool isBol = false}) {
    if (isExpress) {
      expressNewsList = data;
    }
    notifyListeners();
  }

  Future<void> getExpressNews() async {
    setNewsList(ApiResponse.loading(), isExpress: true);

    _newsRepo.getNews(AppUrl.expressEndPoint).then((value) {
      setNewsList(ApiResponse.completed(value), isExpress: true);
    }).onError((error, stackTrace) {
      setNewsList(ApiResponse.error(error.toString()), isExpress: true);
    });
  }

  Future<void> getGeoNews() async {
    setNewsList(ApiResponse.loading(), isGeo: true);

    _newsRepo.getNews(AppUrl.geoEndPoint).then((value) {
      setNewsList(ApiResponse.completed(value), isGeo: true);
    }).onError((error, stackTrace) {
      setNewsList(ApiResponse.error(error.toString()), isGeo: true);
    });
  }

  Future<void> getBolNews() async {
    setNewsList(ApiResponse.loading(), isBol: true);

    _newsRepo.getNews(AppUrl.bolEndPoint).then((value) {
      setNewsList(ApiResponse.completed(value), isBol: true);
    }).onError((error, stackTrace) {
      setNewsList(ApiResponse.error(error.toString()), isBol: true);
    });
  }
}
