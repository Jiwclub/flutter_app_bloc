part of 'home_bloc.dart';

class HomeInitial extends Equatable {
  const HomeInitial({
    this.counter = 0,
    this.nameList = const [],
  });

  final int counter;
  final List<dynamic> nameList;

  HomeInitial copyWith({
    int? counter,
    List<dynamic>? nameList,
  }) {
    return HomeInitial(
      counter: counter ?? this.counter,
      nameList: nameList ?? this.nameList,
    );
  }

  @override
  List<Object> get props => [counter, nameList];
}
