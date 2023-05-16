part of 'home_bloc.dart';

class HomeInitial extends Equatable {
  const HomeInitial({
    this.counter = 0,
    this.nameList = const [],
    this.status = RequestStatus.loading,
  });

  final int counter;
  final List<dynamic> nameList;
  final RequestStatus status;

  HomeInitial copyWith({
    int? counter,
    List<dynamic>? nameList,
    RequestStatus? status,
  }) {
    return HomeInitial(
      counter: counter ?? this.counter,
      nameList: nameList ?? this.nameList,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [counter, nameList, status];
}

class HomeLoading extends HomeInitial {}
