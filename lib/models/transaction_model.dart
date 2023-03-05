import 'package:equatable/equatable.dart';
import 'package:skripsi/models/tiket_model.dart';

class TransactionModel extends Equatable {
  final String id, name, userId;
  final TiketModel tiketModel;
  final int price, grandTotal;
  final int paketMakan, paketMotor, paketMobil, paketTruk, totalPerson;
  final String numberWA, date;
  final bool payOnTheSpot;

  const TransactionModel({
    this.userId = "",
    this.name = "",
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
    this.date = "",
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
        id: id,
        tiketModel: TiketModel.fromJson(json['tiket']['id'], json['tiket']),
        totalPerson: json['totalPerson'],
        userId: json['userId'],
        name: json['name'],
        grandTotal: json['grandTotal'],
        price: json['price'],
        paketMakan: json['paketMakan'],
        paketMotor: json['paketMotor'],
        paketMobil: json['paketMobil'],
        paketTruk: json['paketTruk'],
        numberWA: json['numberWA'],
        date: json['date'],
        payOnTheSpot: json['payOnTheSpot'],
      );

  @override
  List<Object?> get props => [
        id,
        userId,
        name,
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
        date,
      ];
}
