part of 'personal_data_bloc.dart';

abstract class PersonalDataEvent extends Equatable {
  const PersonalDataEvent();

  @override
  List<Object> get props => [];
}

class PersonalDataInitializeEvent extends PersonalDataEvent {
  const PersonalDataInitializeEvent();

  @override
  List<Object> get props => [];
}
