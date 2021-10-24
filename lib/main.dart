import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:trpro_app/eventMain.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    // Riverpodでデータを受け渡しできる状態にする
    ProviderScope(
      child: TrProApp(),
    ),
  );
}

class TrProApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'トレプロ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

// ホーム画面
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('トレプロ'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('トレーニング種目登録'),
                  onPressed: () async {
                    await Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          // PartListPageに遷移する
                          return PartListPage();
                        }),
                      );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}