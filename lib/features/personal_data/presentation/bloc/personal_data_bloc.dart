import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:prueba_prix/core/constants/app_dictionary.dart';

part 'personal_data_event.dart';
part 'personal_data_state.dart';

@singleton
class PersonalDataBloc extends Bloc<PersonalDataEvent, PersonalDataState> {
  PersonalDataBloc() : super(PersonalDataInitial()) {
    on<PersonalDataInitializeEvent>(_onInitialize);
  }

  Future<void> _onInitialize(
    PersonalDataInitializeEvent event,
    Emitter<PersonalDataState> emit,
  ) async {
    emit(PersonalDataLoading());

    try {} catch (e) {
      emit(
        PersonalDataError('${AppDictionary.genericError}: $e'),
      );
    }
  }
}
