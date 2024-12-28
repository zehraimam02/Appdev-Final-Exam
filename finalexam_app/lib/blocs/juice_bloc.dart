import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/juice_model.dart';

// Events - an action (e.g: button presed etc.) that triggers a change in state
abstract class JuiceEvent {}

class LoadJuices extends JuiceEvent {}


// States
abstract class JuiceState {}

class InitialState extends JuiceState {}
class LoadingState extends JuiceState {}
class LoadedState extends JuiceState {
  final List<JuiceModel> juices;
  LoadedState(this.juices);
}
class ErrorState extends JuiceState {
  final String message;
  ErrorState(this.message);
}


// Bloc class
class JuiceBloc extends Bloc<JuiceEvent, JuiceState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  JuiceBloc() : super(InitialState()) {  // Initial state of the app when it opens
    on<LoadJuices>((event, emit) async { // Handler for the Load Event
      emit(LoadingState());
      try {
        final QuerySnapshot snapshot = await _firestore
            .collection('juices')
            .orderBy('name')
            .get();

        final juices = snapshot.docs
            .map((doc) => JuiceModel.fromFirestore(doc))
            .toList();

        emit(LoadedState(juices));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
  }
}
