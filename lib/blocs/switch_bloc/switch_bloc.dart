import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchInitial(switchValue: false)) {
    on<SwitchOnEvent>(
        (event, emit) => emit(const SwitchState(switchValue: true)));
    on<SwitchOffEvent>(_switchOff);
  }

  _switchOn(SwitchOnEvent event, Emitter emit) {
    emit(const SwitchState(switchValue: true));
  }

  _switchOff(SwitchOffEvent event, Emitter emit) {
    emit(const SwitchState(switchValue: false));
  }
}
