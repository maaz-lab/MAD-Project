class NewsModel {
  String? title;
  String? time;
  String? featuredImg;
  String? description;
  String? category;

  NewsModel(
      {this.title,
      this.time,
      this.featuredImg,
      this.description,
      this.category});

  NewsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    time = json['time'];
    featuredImg = json['featured_img'];
    description = json['description'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['time'] = time;
    data['featured_img'] = featuredImg;
    data['description'] = description;
    data['category'] = category;
    return data;
  }

  static List<NewsModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => NewsModel.fromJson(json)).toList();
  }
}
