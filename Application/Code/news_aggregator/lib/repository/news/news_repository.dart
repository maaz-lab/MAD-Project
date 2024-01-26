import '../../data/network/base_api_service.dart';
import '../../data/network/network_api_service.dart';
import '../../models/news/news_model.dart';
import '../../resources/url/app_url.dart';

class NewsRepository {
  BaseApiServices apiServices = NetworkApiService();

  Future<List<NewsModel>> getAllNews(String url) async {
    try {
      List<NewsModel> newsList = [];

      dynamic response1 =
          await apiServices.getApiResponse(AppUrl.expressEndPoint);

      dynamic response2 = await apiServices.getApiResponse(AppUrl.geoEndPoint);

      dynamic response3 = await apiServices.getApiResponse(AppUrl.bolEndPoint);

      newsList.addAll(NewsModel.fromJsonList(response1));
      newsList.addAll(NewsModel.fromJsonList(response2));
      newsList.addAll(NewsModel.fromJsonList(response3));

      return newsList;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<NewsModel>> getNews(String url) async {
    try {
      dynamic response = await apiServices.getApiResponse(url);

      return response = NewsModel.fromJsonList(response);
    } catch (e) {
      rethrow;
    }
  }
}
