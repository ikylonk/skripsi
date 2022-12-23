part of 'harbor_cubit.dart';

abstract class HarborState extends Equatable {
  const HarborState();
}

class HarborInitial extends HarborState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class HarborLoading extends HarborState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class HarborSuccess extends HarborState {
  final List<HarborModel> harbors;
  const HarborSuccess(this.harbors);

  @override
  List<Object?> get props => [harbors];
}

class HarborFailed extends HarborState {
  final String error;
  const HarborFailed(this.error);

  @override
  List<Object?> get props => [error];
}
