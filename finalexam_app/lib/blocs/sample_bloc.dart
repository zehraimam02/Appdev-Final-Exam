import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/sample_model.dart';

// Events - an action (e.g: button presed etc.) that triggers a change in state
// ALTER
abstract class MyEvent {}

class FetchData extends MyEvent {}


// States
// ALTER
abstract class MyState {}

class InitialState extends MyState {}
class LoadingState extends MyState {}
class LoadedState extends MyState {
  final List<MyModel> items;
  LoadedState(this.items);
}
class ErrorState extends MyState {
  final String message;
  ErrorState(this.message);
}


// Bloc class
// ALTER
class MyBloc extends Bloc<MyEvent, MyState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  MyBloc() : super(InitialState()) {  // Initial state of the app when it opens
    on<FetchData>((event, emit) async { // Handler for the Load Event
      emit(LoadingState());
      try {
        // Fetch data logic
        // final items = await fetchData();
        
        // emit(LoadedState(items));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
  }
}
