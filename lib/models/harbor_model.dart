import 'package:equatable/equatable.dart';

class HarborModel extends Equatable {
  final String id, name, location, imageUrl, about;

  const HarborModel({
    required this.id,
    this.name = "",
    this.location = "",
    this.imageUrl = "",
    this.about = "",
  });

  factory HarborModel.fromJason(String id, Map<String, dynamic> json) =>
      HarborModel(
          id: id,
          name: json['name'],
          location: json['location'],
          imageUrl: json['imageUrl'],
          about: json['about']);

  @override
  List<Object?> get props => [id, name, location, imageUrl, about];
}
