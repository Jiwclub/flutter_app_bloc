import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'home_event.dart';
part 'home_state.dart';

var uuid = const Uuid();

class HomeBloc extends Bloc<HomeEvent, HomeInitial> {
  HomeBloc()
      : super(
          const HomeInitial(),
        ) {
    on<Increase>((event, emit) {
      log("Increase ${state.counter}");

      emit(state.copyWith(counter: state.counter + 1));
      log("Increase emit ${state.counter}");
    });
    on<Decrement>((event, emit) {
      if (state.counter == 0) return;
      emit(state.copyWith(counter: state.counter - 1));
    });

    on<AddName>((event, emit) {
      if (event.name.isEmpty) return;

      emit(
        state.copyWith(
          nameList: [
            {
              'id': uuid.v4(),
              'name': event.name,
            },
            ...state.nameList,
          ],
        ),
      );
    });
    on<EditName>((event, emit) {
      log('name Edit ${event.name}');
      if (event.name.isEmpty) return;
      final dataEit = state.nameList.map((e) {
        if (e['id'] == event.id) {
          log("item Edit ${e['name']}");
          e['name'] = event.name;
        }
        return e;
      }).toList();

      log("dataEit $dataEit");

      emit(
        state.copyWith(nameList: dataEit),
      );
    });

    on<RemoveName>((event, emit) {
      final itemDelete = state.nameList
          .where(
            (element) => element['id'] != event.id,
          )
          .toList();
      emit(state.copyWith(nameList: itemDelete));
    });
  }
}
