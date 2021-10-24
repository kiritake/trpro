
/*

class PartListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // Providerから値を受け取る
    final event = watch(eventProvider).state;
    final AsyncValue<QuerySnapshot> asyncEventQuery = watch(eventQueryProvider);

    return Scaffold(
      // タイトルの表示
      appBar: AppBar(
        title: Text('トレーニング種目一覧'),
      ),

      body: Column(
        children: [
          Expanded(
            child: asyncEventQuery.when(
              // 値が取得できたとき
              data: (QuerySnapshot query) {
                return ListView(
                  children: query.docs.map((document) {
                    return Card(
                      // 種目を表示する
                        child: ListTile(
                            title: Text(document['text']),
                            trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () async {
                                  // トレーニング種目削除
                                  await FirebaseFirestore.instance
                                      .collection('event')
                                      .doc('chest')
                                      .collection('bench press')
                                      .doc(document.id)
                                      .delete();
                                }
                            )
                        )
                    );
                  }).toList(),
                );
              },
              // 値が読込中のとき
              loading: () {
                return Center(
                  child: Text('読込中...'),
                );
              },
              // 値の取得に失敗したとき
              error: (e, stackTrace) {
                return Center(
                  child: Text(e.toString()),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // AddPostPageに遷移する
              return AddPostPage();
            }),
          );
        },
      ),
    );
  }
}

// ConsumerWidgetでProviderから値を受け渡す
class AddPostPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // Providerから値を受け取る
    final event = watch(eventProvider).state;
    final messageText = watch(messageTextProvider).state;

    return Scaffold(
      appBar: AppBar(
        title: Text('種目登録'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // 投稿メッセージ入力
              TextFormField(
                decoration: InputDecoration(labelText: '種目名'),
                // 複数行のテキスト入力
                keyboardType: TextInputType.multiline,
                // 最大1行
                maxLines: 1,
                onChanged: (String value) {
                  // Providerから値を更新
                  context.read(messageTextProvider).state = value;
                },
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('登録'),
                  onPressed: () async {
                    final date = DateTime.now().toLocal().toIso8601String();
                    await FirebaseFirestore.instance
                        .collection('event')
                        .doc('chest')
                        .collection('bench press')
                        .doc()
                        .set({
                      'text': messageText,
                      'date': date
                    });
                    // 1つ前の画面に戻る
                    Navigator.of(context).pop();
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

*/