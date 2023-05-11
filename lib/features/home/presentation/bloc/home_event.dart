part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class Increase extends HomeEvent {}

class Decrement extends HomeEvent {}

class AddName extends HomeEvent {
  final String name;

  const AddName(
    this.name,
  );
}

class EditName extends HomeEvent {
  final String id;
  final String name;

  const EditName(
    this.name,
    this.id,
  );
}

class EditNameItem extends HomeEvent {
  final String id;
  const EditNameItem(this.id);
}

class RemoveName extends HomeEvent {
  final String id;
  const RemoveName(this.id);
}
