part of 'transaction_cubit.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();
}

class TransactionInitial extends TransactionState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class TransactionLoading extends TransactionState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class TransactionSuccess extends TransactionState {
  final List<TransactionModel> transactions;

  const TransactionSuccess(this.transactions);

  @override
  List<Object?> get props => [transactions];
}

class TransactionFailed extends TransactionState {
  final String error;

  TransactionFailed(this.error);

  @override
  List<Object?> get props => [error];
}
