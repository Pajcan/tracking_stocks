
part of 'user_header_cubit.dart';

sealed class UserHeaderState extends Equatable {
  const UserHeaderState();

  @override
  List<Object> get props => [];
}

class UserHeaderInitial extends UserHeaderState {}

class UserHeaderLoaded extends UserHeaderState {
  final String languageCode;

  const UserHeaderLoaded({required this.languageCode});
}

