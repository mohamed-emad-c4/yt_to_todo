class VideoInfoModel {
  final String title;
  final String url;
  final String description;
  final String id;
  final String duration;
  final String image;

  VideoInfoModel({
    required this.title,
    required this.url,
    required this.description,
    required this.id,
    required this.duration,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'url': url,
      'description': description,
      'id': id,
      'duration': duration,
      'image': image,
    };
  }

  static VideoInfoModel fromMap(Map<String, dynamic> map) {
    return VideoInfoModel(
      title: map['title'],
      url: map['url'],
      description: map['description'],
      id: map['id'],
      duration: map['duration'],
      image: map['image'],
    );
  }
}
