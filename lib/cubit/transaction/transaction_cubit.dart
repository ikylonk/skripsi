import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:skripsi/models/transaction_model.dart';
import 'package:skripsi/services/transaction_service.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> createTransaction(TransactionModel transactionModel) async {
    try {
      emit(TransactionLoading());
      await TransactionService().createTransaction(transactionModel);
      emit(const TransactionSuccess([]));
      debugPrint('create transaction success');
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  Future<void> fetchTransaction() async {
    try {
      emit(TransactionLoading());
      List<TransactionModel> transactions =
          await TransactionService().fetchTransaction();
      emit(TransactionSuccess(transactions));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  Future<void> filter(String userId) async {
    try {
      emit(TransactionLoading());
      List<TransactionModel> transactions =
          await TransactionService().filter(userId);
      emit(TransactionSuccess(transactions));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  Future<void> delete(String id) async {
    try {
      emit(TransactionLoading());
      await TransactionService().delete(id);
      List<TransactionModel> transactions =
          await TransactionService().fetchTransaction();
      emit(TransactionSuccess(transactions));
      debugPrint('delete transaction success');
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }
}
