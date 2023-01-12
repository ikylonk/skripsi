import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skripsi/models/transaction_model.dart';

class TransactionService {
  final _transactionFirestore =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(TransactionModel transactionModel) async {
    try {
      await _transactionFirestore.add({
        'tiket': transactionModel.tiketModel.toJson(),
        'grandTotal': transactionModel.grandTotal,
        'name': transactionModel.name,
        'userId': transactionModel.userId,
        'price': transactionModel.price,
        'paketMakan': transactionModel.paketMakan,
        'paketMotor': transactionModel.paketMotor,
        'paketMobil': transactionModel.paketMobil,
        'paketTruk': transactionModel.paketTruk,
        'totalPerson': transactionModel.totalPerson,
        'numberWA': transactionModel.numberWA,
        'payOnTheSpot': transactionModel.payOnTheSpot,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TransactionModel>> fetchTransaction() async {
    try {
      QuerySnapshot result = await _transactionFirestore.get();

      List<TransactionModel> transactions = result.docs
          .map((e) =>
              TransactionModel.fromJson(e.id, e.data() as Map<String, dynamic>))
          .toList();

      return transactions;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TransactionModel>> filter(String userId) async {
    try {
      QuerySnapshot result = await _transactionFirestore.where("userId", isEqualTo: userId).get();

      List<TransactionModel> transactions = result.docs
          .map((e) =>
          TransactionModel.fromJson(e.id, e.data() as Map<String, dynamic>))
          .toList();

      return transactions;
    } catch (e) {
      rethrow;
    }
  }
}
