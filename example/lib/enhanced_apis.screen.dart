import 'package:alchemy/alchemy.dart';
import 'package:console_mixin/console_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnhancedAPIsScreen extends StatefulWidget {
  const EnhancedAPIsScreen({Key? key}) : super(key: key);

  @override
  State<EnhancedAPIsScreen> createState() => _EnhancedAPIsScreenState();
}

class _EnhancedAPIsScreenState extends State<EnhancedAPIsScreen>
    with ConsoleMixin {
  // Instantiate Object
  final alchemy = Alchemy();

  // Result TextEditingController
  final resultAreaController = TextEditingController();
  Color? resultColor;

  // Generic API call function
  void call(Future function) async {
    console.debug('requesting...');
    resultAreaController.text = 'requesting...';

    dynamic result;

    try {
      result = await function;
    } catch (e) {
      resultAreaController.text = e.toString();
      resultColor = Colors.red;
      console.error('Exception: $e}');
      rethrow;
    }

    result.either(
      (error) {
        final text = error is String ? error : error.toJson().toString();
        resultAreaController.text = text;
        resultColor = Colors.red;
        console.error(text);
      },
      (response) {
        final text =
            response is String ? response : response.toJson().toString();
        resultAreaController.text = text;
        resultColor = null;
        console.debug(text);
      },
    );

    setState(() {});
    console.debug('request done');
  }

  @override
  void initState() {
    alchemy.client.init(
      subDomain: 'eth-mainnet.g',
      apiKey: dotenv.env['API_KEY']!, // YOUR API KEY
      verbose: true,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: resultAreaController,
              minLines: 2,
              maxLines: 5,
              style: TextStyle(color: resultColor),
              decoration: const InputDecoration(
                hintText: 'Result Area',
                border: OutlineInputBorder(),
                label: Text('Response'),
              ),
            ),
            const SizedBox(height: 15),
            Text(alchemy.client.baseUrl),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('getNFTs'),
                onPressed: () => call(
                  alchemy.enhanced.getNFTs(
                    owner: '0x8888f1f195afa192cfee860698584c030f4c9db1',
                  ),
                ),
              ),
              const Divider(),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('getNFTMetadata'),
                onPressed: () => call(
                  alchemy.enhanced.getNFTMetadata(
                    contractAddress:
                        '0x5180db8F5c931aaE63c74266b211F580155ecac8',
                    tokenId: '1590',
                  ),
                ),
              ),
              const Divider(),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('getNFTsForCollection'),
                onPressed: () => call(
                  alchemy.enhanced.getNFTsForCollection(
                    contractAddress:
                        '0x61fce80d72363b731425c3a2a46a1a5fed9814b2',
                    withMetadata: true,
                    startToken: '0x1ea2',
                  ),
                ),
              ),
              const Divider(),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('getOwnersForToken'),
                onPressed: () => call(
                  alchemy.enhanced.getOwnersForToken(
                    contractAddress:
                        '0x04b14e3383d42685ae16af3c47b21b2d5941d27e',
                    tokenId: '867',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
