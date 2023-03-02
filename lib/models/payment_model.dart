import 'package:equatable/equatable.dart';

class PaymentModel extends Equatable {
  final String id, name, bankName, imageUrl, number;

  const PaymentModel({
    required this.id,
    this.name = "",
    this.bankName = "",
    this.imageUrl = "",
    this.number = "",
  });

  factory PaymentModel.fromJson(String id, Map<String, dynamic> json) =>
      PaymentModel(
          id: id,
          name: json['name'],
          bankName: json['bankName'],
          imageUrl: json['imageUrl'],
          number: json['number']);

  @override
  List<Object?> get props => [id, name, bankName, imageUrl, number];
}
