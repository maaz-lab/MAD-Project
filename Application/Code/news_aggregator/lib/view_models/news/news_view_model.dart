import 'package:flutter/material.dart';
import '../../data/responses/api_response.dart';
import '../../models/news/news_model.dart';
import '../../repository/news/news_repository.dart';
import '../../resources/constants/logos.dart';
import '../../resources/url/app_url.dart';
import '../../view/home/home_screen.dart';
import '../../view/news/news_screen.dart';

class NewsViewModel with ChangeNotifier {
  final NewsRepository _newsRepo = NewsRepository();

  int currentIndex = 0;

  updateIndex(int value) {
    currentIndex = value;
    notifyListeners();
  }

  final List<String> newsTabs = [
    "Home",
    "Express News",
    "Geo News",
    "Bol News",
  ];

  final List<Widget> screens = [
    const HomeScreen(),
    NewsScreen(
      isExpress: true,
      title: "Express News",
      logo: MyLogos.expressNewsLogo,
    ),
    NewsScreen(
      isGeo: true,
      title: "Geo News",
      logo: MyLogos.geoNewsLogo,
    ),
    NewsScreen(
      isBol: true,
      title: "Bol News",
      logo: MyLogos.bolNewsLogo,
    ),
  ];

  bool isExpressSubscribed = false;
  bool isGeoSubscribed = false;
  bool isBolSubscribed = false;

  // void updateTabOrder() {
  //   List<String> updatedTabs = ["Home"];

  //   if (isExpressSubscribed) updatedTabs.add("Express News");
  //   if (isGeoSubscribed) updatedTabs.add("Geo News");
  //   if (isBolSubscribed) updatedTabs.add("Bol News");

  //   newsTabs.clear();
  //   newsTabs.addAll(updatedTabs);
  // }

  // void updateScreenOrder() {
  //   List<Widget> updatedScreens = [screens[0]];

  //   if (isExpressSubscribed) {
  //     updatedScreens.add(screens[1]);
  //   }
  //   if (isGeoSubscribed) {
  //     updatedScreens.add(screens[2]);
  //   }
  //   if (isBolSubscribed) {
  //     updatedScreens.add(screens[3]);
  //   }

  //   screens.clear();
  //   screens.addAll(updatedScreens);
  // }

  setSubscribe(
      {bool isExpress = false, bool isGeo = false, bool isBol = false}) {
    if (isExpress) {
      isExpressSubscribed = !isExpressSubscribed;
    }
    if (isGeo) {
      isGeoSubscribed = !isGeoSubscribed;
    }
    if (isBol) {
      isBolSubscribed = !isBolSubscribed;
    }
    // updateTabOrder();
    // updateScreenOrder();
    notifyListeners();
  }

  String getSubscribeText(
      {bool isExpress = false, bool isGeo = false, bool isBol = false}) {
    if (isExpress) {
      return isExpressSubscribed ? "Subscribed" : "Subscribe";
    }
    if (isGeo) {
      return isGeoSubscribed ? "Subscribed" : "Subscribe";
    }
    if (isBol) {
      return isBolSubscribed ? "Subscribed" : "Subscribe";
    }
    notifyListeners();
    return "Subscribe";
  }

  ApiResponse<List<NewsModel>> expressNewsList = ApiResponse.loading();
  ApiResponse<List<NewsModel>> geoNewsList = ApiResponse.loading();
  ApiResponse<List<NewsModel>> bolNewsList = ApiResponse.loading();

  setNewsList(ApiResponse<List<NewsModel>> data,
      {bool isExpress = false, bool isGeo = false, bool isBol = false}) {
    if (isExpress) {
      expressNewsList = data;
    }
    if (isGeo) {
      geoNewsList = data;
    }
    if (isBol) {
      bolNewsList = data;
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
