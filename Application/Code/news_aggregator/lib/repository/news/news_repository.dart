import '../../data/network/base_api_service.dart';
import '../../data/network/network_api_service.dart';
import '../../models/news/news_model.dart';

class NewsRepository {
  BaseApiServices apiServices = NetworkApiService();

  Future<List<NewsModel>> getNews(String url) async {
    try {
      dynamic response =
          await apiServices.getApiResponse(url);

      return response = NewsModel.fromJsonList(response);
    } catch (e) {
      rethrow;
    }
  }
}
