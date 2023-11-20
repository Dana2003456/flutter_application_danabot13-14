import 'package:flutter/material.dart';
import 'package:flutter_application_danabot/presentation/blocs/bloc/data_bloc.dart';

import 'package:flutter_application_danabot/data/api/api_sevice.dart';
import 'package:flutter_application_danabot/data/api/retdio.dart';
import 'package:flutter_application_danabot/presentation/pages/data.dart';
import 'package:flutter_application_danabot/presentation/pages/lottie.dart';
import 'package:flutter_application_danabot/presentation/pages/lottie2.dart';
import 'package:flutter_application_danabot/presentation/pages/qr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  int _currentIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      LottiePage(),
      BlocProvider(
        create: (context) => DataBloc(Controlapi(dio)),
        child: DataPage(),
      ),
      LottiePage2(),
      Qrcode()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Navigation App')),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Дом'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Работа'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Аккаунт'),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_2_outlined), label: 'QR'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
