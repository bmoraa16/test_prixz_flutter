part of 'personal_data_bloc.dart';

abstract class PersonalDataState extends Equatable {
  const PersonalDataState();

  @override
  List<Object> get props => [];
}

class PersonalDataInitial extends PersonalDataState {}

class PersonalDataLoading extends PersonalDataState {}

class PersonalDataError extends PersonalDataState {
  final String message;
  const PersonalDataError(this.message);
}
