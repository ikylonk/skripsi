part of 'payment_cubit.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();
}

class PaymentInitial extends PaymentState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class PaymentLoading extends PaymentState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class PaymentSuccess extends PaymentState {
  final List<PaymentModel> payments;
  const PaymentSuccess(this.payments);

  @override
  List<Object> get props => [payments];
}

class PaymentFailed extends PaymentState {
  final String error;
  const PaymentFailed(this.error);

  @override
  List<Object> get props => [error];
}
