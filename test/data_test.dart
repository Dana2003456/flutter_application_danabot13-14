import 'package:flutter/material.dart';
import 'package:flutter_application_danabot/data/models/page.dart';
import 'package:flutter_application_danabot/presentation/blocs/bloc/data_bloc.dart';

import 'package:flutter_application_danabot/presentation/blocs/bloc/data_state.dart';
import 'package:flutter_application_danabot/presentation/pages/data.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDataBloc extends Mock implements DataBloc {}

void main() {
  late DataBloc dataBloc;

  setUp(() {
    dataBloc = MockDataBloc();
  });

  testWidgets('DataPage should render correctly', (WidgetTester tester) async {
    when(dataBloc.state).thenReturn(DataLoading());

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<DataBloc>(
          create: (context) => dataBloc,
          child: DataPage(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    final comments = [
      Comment(
          id: 1, name: 'Name 1', email: 'email1@example.com', body: 'Body 1'),
      Comment(
          id: 2, name: 'Name 2', email: 'email2@example.com', body: 'Body 2'),
    ];
    when(dataBloc.state).thenReturn(DataLoaded(comments: comments));

    await tester.pump();

    final errorMessage = 'Error message';
    when(dataBloc.state).thenReturn(DataError(message: errorMessage));

    await tester.pump();

    expect(find.text(errorMessage), findsOneWidget);
  });
}
