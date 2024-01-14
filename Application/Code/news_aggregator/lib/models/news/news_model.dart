class NewsModel {
  final String? title,
      description,
      thumbnailImage,
      newsLink,
      channelLink,
      channelLogo,
      videoUrl,
      category;
  final List<String>? images;

  NewsModel({
    this.title,
    this.description,
    this.thumbnailImage,
    this.newsLink,
    this.channelLink,
    this.channelLogo,
    this.videoUrl,
    this.category,
    this.images,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'thumbnailImage': thumbnailImage,
      'newsLink': newsLink,
      'channelLink': channelLink,
      'channelLogo': channelLogo,
      'videoUrl': videoUrl,
      'category': category,
      'images': images,
    };
  }

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'],
      description: json['description'],
      thumbnailImage: json['thumbnailImage'],
      newsLink: json['newsLink'],
      channelLink: json['channelLink'],
      channelLogo: json['channelLogo'],
      videoUrl: json['videoUrl'],
      category: json['category'],
      images: List<String>.from(json['images']),
    );
  }

  static List<NewsModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => NewsModel.fromJson(json)).toList();
  }
}
