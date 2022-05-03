import 'package:alchemy_web3/alchemy.dart';
import 'package:console_mixin/console_mixin.dart';
import 'package:example/chain_apis.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'enhanced_apis.screen.dart';

void main() async {
  await dotenv.load(fileName: 'assets/.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget with ConsoleMixin {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final alchemy = Alchemy();
    // obtain yours at https://alchemy.com
    alchemy.init(
      httpRpcUrl: dotenv.env['HTTP_URL']!,
      wsRpcUrl: dotenv.env['WS_URL']!,
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

    final actions = [
      IconButton(
        onPressed: () {
          // SWITCH NETWORK
          alchemy.init(
            httpRpcUrl: dotenv.env['HTTP_URL2']!,
            wsRpcUrl: dotenv.env['WS_URL2']!,
            verbose: true,
          );
        },
        icon: const Icon(Icons.bug_report),
      ),
    ];

    return MaterialApp(
      theme: ThemeData.dark(),
      home: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          body: const TabBarView(children: screens),
          appBar: AppBar(
            title: const Text('Alchemy Playground'),
            actions: actions,
            bottom: const TabBar(tabs: tabs),
          ),
        ),
      ),
    );
  }
}
