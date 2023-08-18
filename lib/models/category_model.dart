// To parse this JSON data, do
//
//     final myCategory = myCategoryFromJson(jsonString);

import 'dart:convert';

List<CategoryModels> CategoryModelsFromJson(String str) => List<CategoryModels>.from(json.decode(str).map((x) => CategoryModels.fromJson(x)));

String CategoryModelsToJson(List<CategoryModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModels {
  int id;
  String name;
  String image;
  String createdAt;
  String updatedAt;

  CategoryModels({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryModels.fromJson(Map<String, dynamic> json) => CategoryModels(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
