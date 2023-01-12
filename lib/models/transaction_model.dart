import 'package:equatable/equatable.dart';
import 'package:skripsi/models/tiket_model.dart';

class TransactionModel extends Equatable {
  final String id;
  final TiketModel tiketModel;
  final int price, grandTotal;
  final int paketMakan, paketMotor, paketMobil, paketTruk, totalPerson;
  final String numberWA;
  final bool payOnTheSpot;

  const TransactionModel({
    this.id = "",
    required this.tiketModel,
    this.totalPerson = 0,
    this.price = 0,
    this.grandTotal = 0,
    this.paketMakan = 0,
    this.paketMotor = 0,
    this.paketMobil = 0,
    this.paketTruk = 0,
    this.numberWA = "",
    this.payOnTheSpot = true,
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
        id: id,
        tiketModel: TiketModel.fromJson(json['tiket']['id'], json['tiket']),
        totalPerson: json['totalPerson'],
        grandTotal: json['grandTotal'],
        price: json['price'],
        paketMakan: json['paketMakan'],
        paketMotor: json['paketMotor'],
        paketMobil: json['paketMobil'],
        paketTruk: json['paketTruk'],
        numberWA: json['numberWA'],
        payOnTheSpot: json['payOnTheSpot'],
      );

  @override
  List<Object?> get props => [
        id,
        tiketModel,
        price,
        grandTotal,
        paketMakan,
        paketMotor,
        paketMobil,
        paketTruk,
        totalPerson,
        numberWA,
        payOnTheSpot,
      ];
}
