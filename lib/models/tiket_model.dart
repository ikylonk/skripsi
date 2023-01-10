import 'package:equatable/equatable.dart';

class TiketModel extends Equatable {
  final String id, from, destination, imageUrl, about;
  final int price;
  final List<dynamic> photos;

  const TiketModel({
    required this.id,
    this.from = "",
    this.destination = "",
    this.imageUrl = "",
    this.about = "",
    this.price = 0,
    this.photos = const [],
  });

  factory TiketModel.fromJson(String id, Map<String, dynamic> json) =>
      TiketModel(
        id: id,
        from: json['from'],
        destination: json['destination'],
        imageUrl: json['imageUrl'],
        about: json['about'],
        price: json['price'],
        photos: json['photos'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'from': from,
        'destination': destination,
        'imageUrl': imageUrl,
        'about': about,
        'price': price,
        'photos': photos,
      };

  @override
  List<Object?> get props =>
      [id, from, destination, imageUrl, about, price, photos];
}
