import 'package:alchemy/alchemy.dart';
import 'package:console_mixin/console_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PlaygroundScreen extends StatefulWidget {
  const PlaygroundScreen({Key? key}) : super(key: key);

  @override
  State<PlaygroundScreen> createState() => _PlaygroundScreenState();
}

class _PlaygroundScreenState extends State<PlaygroundScreen> with ConsoleMixin {
  // Instantiate Object
  final alchemy = Alchemy();

  // Result TextEditingController
  final resultAreaController = TextEditingController();

  // Generic API call function
  void call(Future function) async {
    console.info('requesting...');
    resultAreaController.text = 'requesting...';

    final result = await function;

    result.either(
      (error) {
        final text = error is String ? error : error.toJson().toString();
        resultAreaController.text = text;
        console.error(text);
      },
      (response) {
        final text =
            response is String ? response : response.toJson().toString();
        resultAreaController.text = text;
        console.info(text);
      },
    );

    console.info('request done');
  }

  @override
  void initState() {
    alchemy.client.init(
      apiKey: dotenv.env['API_KEY']!, // YOUR API KEY
      verbose: true,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Alchemy Playground",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: resultAreaController,
            minLines: 2,
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: 'Result Area',
              enabled: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(alchemy.client.baseUrl),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('blockNumber'),
                onPressed: () => call(alchemy.polygon.blockNumber()),
              ),
              const Divider(),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('getBlockByHash'),
                onPressed: () => call(
                  alchemy.polygon.getBlockByHash(
                    hash:
                        '0xd679a083f7d33c6f47f900ccc77ec58ef8e1c503d6d781e05f4af4f910c5e310',
                  ),
                ),
              ),
              const Divider(),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('getBlockByNumber'),
                onPressed: () => call(
                  alchemy.polygon.getBlockByNumber(
                    block: '0x1b4',
                  ),
                ),
              ),
              const Divider(),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('getTransactionByHash'),
                onPressed: () => call(
                  alchemy.polygon.getTransactionByHash(
                    hash:
                        '0x4ddadd65225424331a4116bcb1462275deb89ec4990519ef48679333b75653f0',
                  ),
                ),
              ),
              const Divider(),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('getTransactionCount'),
                onPressed: () => call(
                  alchemy.polygon.getTransactionCount(
                    address: '0x2355Dc1f1eEAfFE537535B7B7B410E5dCCBAC3b8',
                  ),
                ),
              ),
              const Divider(),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('getTransactionReceipt'),
                onPressed: () => call(
                  alchemy.polygon.getTransactionReceipt(
                    hash:
                        '0x4ddadd65225424331a4116bcb1462275deb89ec4990519ef48679333b75653f0',
                  ),
                ),
              ),
              const Divider(),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('getBlockTransactionCountByHash'),
                onPressed: () => call(
                  alchemy.polygon.getBlockTransactionCountByHash(
                    hash:
                        '0xd679a083f7d33c6f47f900ccc77ec58ef8e1c503d6d781e05f4af4f910c5e310',
                  ),
                ),
              ),
              const Divider(),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('getBlockTransactionCountByNumber'),
                onPressed: () => call(
                  alchemy.polygon.getBlockTransactionCountByNumber(
                    block: 'latest',
                  ),
                ),
              ),
              const Divider(),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('getTransactionByBlockNumberAndIndex'),
                onPressed: () => call(
                  alchemy.polygon.getTransactionByBlockNumberAndIndex(
                    block: 'latest',
                    index: '0x0',
                  ),
                ),
              ),
              const Divider(),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('getRootHash'),
                onPressed: () => call(
                  alchemy.polygon.getRootHash(
                    from: 1000000,
                    to: 1032767,
                  ),
                ),
              ),
              const Divider(),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('getTransactionReceiptsByBlock'),
                onPressed: () => call(
                  alchemy.polygon.getTransactionReceiptsByBlock(
                    block: 'latest',
                  ),
                ),
              ),
              const Divider(),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('getTransactionByBlockHashAndIndex'),
                onPressed: () => call(
                  alchemy.polygon.getTransactionByBlockHashAndIndex(
                    hash:
                        '0xd679a083f7d33c6f47f900ccc77ec58ef8e1c503d6d781e05f4af4f910c5e310',
                    index: '0x0',
                  ),
                ),
              ),
              const Divider(),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('sendRawTransaction'),
                onPressed: () => call(
                  alchemy.polygon.sendRawTransaction(
                    signedData:
                        '0x29adbbaf99a3f97b2baefa11e865cf9d74435716ef8618caaa388619f5ae7d8e5d2cadab0cd2f5becd4ebf7d48f5584c9e414c2a4a6ea2bc6ea8f02dbf5675cd01',
                  ),
                ),
              ),
              const Divider(),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('getBalance'),
                onPressed: () => call(alchemy.polygon.getBalance(
                  address: '0x2355Dc1f1eEAfFE537535B7B7B410E5dCCBAC3b8',
                )),
              ),
              const Divider(),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('getCode'),
                onPressed: () => call(
                  alchemy.polygon.getCode(
                    address: '0x2355Dc1f1eEAfFE537535B7B7B410E5dCCBAC3b8',
                    block: 'latest',
                  ),
                ),
              ),
              const Divider(),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('getStorageAt'),
                onPressed: () => call(
                  alchemy.polygon.getStorageAt(
                    address: '0x2355Dc1f1eEAfFE537535B7B7B410E5dCCBAC3b8',
                    index: '0x0',
                    block: 'latest',
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
