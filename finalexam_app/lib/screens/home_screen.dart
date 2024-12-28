import 'package:finalexam_app/blocs/juice_bloc.dart';
import 'package:finalexam_app/models/juice_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'juice_card.dart';

class HomeScreen extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<JuiceBloc, JuiceState>(
          builder: (context, state) {
            if (state is InitialState) {
              context.read<JuiceBloc>().add(LoadJuices());
              return Center(child: CircularProgressIndicator());
            }

            if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is LoadedState) {
              return Column(
                children: [
                  _buildJuiceCard(state.juices),
                ],
              );
            }

            if (state is ErrorState) {
              return Center(child: Text('Error: ${state.message}'));
            }

            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildJuiceCard(List<JuiceModel> juices) {
  return Expanded(
    child: ListView.builder(
      itemCount: juices.length,
      itemBuilder: (context, index) {
        final juice = juices[index];
        return JuiceCard(juice: juice);
      },
    ),
  );
}

  

}