import 'package:equatable/equatable.dart';

import '../bloc_exports.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends HydratedBloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchInitial(switchValue: false)) {
    on<SwitchOnEvent>(_switchOn);
    on<SwitchOffEvent>(_switchOff);
  }

  _switchOn(SwitchOnEvent event, Emitter emit) {
    emit(const SwitchState(switchValue: true));
  }

  _switchOff(SwitchOffEvent event, Emitter emit) {
    emit(const SwitchState(switchValue: false));
  }

  @override
  SwitchState? fromJson(Map<String, dynamic> json) {
    return SwitchState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SwitchState state) {
    return state.toMap();
  }
}
