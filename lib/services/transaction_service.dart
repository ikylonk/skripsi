import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skripsi/models/transaction_model.dart';

class TransactionService {
  // insiasi collection transaction
  final _transactionFirestore =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(TransactionModel transactionModel) async {
    try {
      // menambahkan data transaction ke collection transaction
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
        'date': transactionModel.date,
      });
    } catch (e) {
      // jika terjadi error maka akan menampilkan error
      rethrow;
    }
  }

  // mengambil seleurh data transaction
  Future<List<TransactionModel>> fetchTransaction() async {
    try {
      // mengambil seluruh data transaction
      QuerySnapshot result = await _transactionFirestore.get();

      // menampilkan data list transaction dalam bentuk model json
      List<TransactionModel> transactions = result.docs
          .map((e) =>
              TransactionModel.fromJson(e.id, e.data() as Map<String, dynamic>))
          .toList();

      return transactions;
    } catch (e) {
      // jika terjadi error maka akan menampilkan error
      rethrow;
    }
  }

  // mengambil data transaction berdasarkan id
  Future<List<TransactionModel>> filter(String userId) async {
    try {
      // mengambil data transaction berdasarkan id
      QuerySnapshot result =
          await _transactionFirestore.where("userId", isEqualTo: userId).get();

      // menampilkan data list transaction dalam bentuk model json
      List<TransactionModel> transactions = result.docs
          .map((e) =>
              TransactionModel.fromJson(e.id, e.data() as Map<String, dynamic>))
          .toList();

      return transactions;
    } catch (e) {
      // jika terjadi error maka akan menampilkan error
      rethrow;
    }
  }

  // menghapus data transaction berdasarkan id
  Future<void> delete(String id) async {
    try {
      // menghapus data transaction berdasarkan id
      return _transactionFirestore.doc(id).delete();
    } catch (e) {
      // jika terjadi error maka akan menampilkan error
      rethrow;
    }
  }
}
