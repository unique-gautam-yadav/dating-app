// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StoryModel {
  String name;
  String image;
  StoryModel({
    required this.name,
    required this.image,
  });

  StoryModel copyWith({
    String? name,
    String? image,
  }) {
    return StoryModel(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
    };
  }

  factory StoryModel.fromMap(Map<String, dynamic> map) {
    return StoryModel(
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoryModel.fromJson(String source) => StoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StoryModel(name: $name, image: $image)';

  @override
  bool operator ==(covariant StoryModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode;
}
