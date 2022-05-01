import 'package:alchemy/alchemy.dart';
import 'package:example/chain_apis.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'enhanced_apis.screen.dart';

void main() async {
  await dotenv.load(fileName: 'assets/.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final alchemy = Alchemy();

    alchemy.client.init(
      subDomain: 'polygon-mumbai.g',
      apiKey: dotenv.env['API_KEY']!, // YOUR API KEY
      verbose: true,
    );

    const tabs = [
      Tab(
        text: 'Chain APIs',
        icon: Icon(Icons.code),
      ),
      Tab(
        text: 'Enhanced APIs',
        icon: Icon(Icons.rocket),
      ),
    ];

    const screens = [
      ChainAPIsScreen(),
      EnhancedAPIsScreen(),
    ];

    return MaterialApp(
      theme: ThemeData.dark(),
      home: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          body: const TabBarView(children: screens),
          appBar: AppBar(
            title: const Text('Alchemy Playground'),
            bottom: const TabBar(
              tabs: tabs,
            ),
          ),
        ),
      ),
    );
  }
}
