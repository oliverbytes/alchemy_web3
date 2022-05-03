import 'package:alchemy/alchemy.dart';
import 'package:console_mixin/console_mixin.dart';
import 'package:flutter/material.dart';

class EnhancedAPIsScreen extends StatefulWidget {
  const EnhancedAPIsScreen({Key? key}) : super(key: key);

  @override
  State<EnhancedAPIsScreen> createState() => _EnhancedAPIsScreenState();
}

class _EnhancedAPIsScreenState extends State<EnhancedAPIsScreen>
    with ConsoleMixin {
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
            // Text(alchemy.enhanced.client.url),
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
              ElevatedButton(
                child: const Text('getNFTs'),
                onPressed: () => call(
                  alchemy.enhanced.nft.getNFTs(
                    owner: '0x8888f1f195afa192cfee860698584c030f4c9db1',
                  ),
                ),
              ),
              const Divider(),
              ElevatedButton(
                child: const Text('getNFTMetadata'),
                onPressed: () => call(
                  alchemy.enhanced.nft.getNFTMetadata(
                    contractAddress:
                        '0x5180db8F5c931aaE63c74266b211F580155ecac8',
                    tokenId: '1590',
                  ),
                ),
              ),
              const Divider(),
              ElevatedButton(
                child: const Text('getNFTsForCollection'),
                onPressed: () => call(
                  alchemy.enhanced.nft.getNFTsForCollection(
                    contractAddress:
                        '0x61fce80d72363b731425c3a2a46a1a5fed9814b2',
                    withMetadata: true,
                    startToken: '0x1ea2',
                  ),
                ),
              ),
              const Divider(),
              ElevatedButton(
                child: const Text('getOwnersForToken'),
                onPressed: () => call(
                  alchemy.enhanced.nft.getOwnersForToken(
                    contractAddress:
                        '0x04b14e3383d42685ae16af3c47b21b2d5941d27e',
                    tokenId: '867',
                  ),
                ),
              ),
              const Divider(),
              ElevatedButton(
                child: const Text('getTokenAllowance'),
                onPressed: () => call(alchemy.enhanced.token.getTokenAllowance(
                  contract: '0xE41d2489571d322189246DaFA5ebDe1F4699F498',
                  owner: '0xe8095A54C83b069316521835408736269bfb389C',
                  spender: '0x3Bcc5bD4abBc853395eBE5103b7DbA20411E38db',
                )),
              ),
              const Divider(),
              ElevatedButton(
                child: const Text('getTokenBalances'),
                onPressed: () => call(alchemy.enhanced.token.getTokenBalances(
                  address: '0x3f5ce5fbfe3e9af3971dd833d26ba9b5c936f0be',
                )),
              ),
              const Divider(),
              ElevatedButton(
                child: const Text('getTokenMetadata'),
                onPressed: () => call(alchemy.enhanced.token.getTokenMetadata(
                  address: '0x1985365e9f78359a9B6AD760e32412f4a445E862',
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
