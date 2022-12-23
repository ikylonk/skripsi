part of 'tiket_cubit.dart';

abstract class TiketState extends Equatable {
  const TiketState();
}

class TiketInitial extends TiketState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class TiketLoading extends TiketState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class TiketSuccess extends TiketState {
  final List<TiketModel> tikets;

  const TiketSuccess(this.tikets);

  @override
  List<Object?> get props => [tikets];
}

class TiketFailed extends TiketState {
  final String error;
  const TiketFailed(this.error);

  @override
  List<Object?> get props => [error];
}
