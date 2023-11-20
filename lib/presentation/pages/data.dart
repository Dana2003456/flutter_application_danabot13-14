import 'package:flutter/material.dart';
import 'package:flutter_application_danabot/presentation/blocs/bloc/data_bloc.dart';
import 'package:flutter_application_danabot/presentation/blocs/bloc/data_event.dart';
import 'package:flutter_application_danabot/presentation/blocs/bloc/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataBloc = BlocProvider.of<DataBloc>(context);
    dataBloc.add(FetchCommentsEvent());

    return BlocBuilder<DataBloc, DataState>(
      builder: (context, state) {
        if (state is DataLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is DataLoaded) {
          return ListView.builder(
            itemCount: state.comments.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.comments[index].name),
                subtitle: Text(
                    'Email: ${state.comments[index].email}\nBody: ${state.comments[index].body}'),
              );
            },
          );
        } else if (state is DataError) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text('Unknown state'));
        }
      },
    );
  }
}
