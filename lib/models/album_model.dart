class ShowModel {
  final String name;
  final String thumbnailUrl;

  ShowModel({required this.name, required this.thumbnailUrl});

  factory ShowModel.fromJson(Map<String, dynamic> json) {
    return ShowModel(
      name: json['name'],
      thumbnailUrl: json['image_thumbnail_path'],
    );
  }
}