import 'package:alchemy/alchemy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PlaygroundScreen extends StatefulWidget {
  const PlaygroundScreen({Key? key}) : super(key: key);

  @override
  State<PlaygroundScreen> createState() => _PlaygroundScreenState();
}

class _PlaygroundScreenState extends State<PlaygroundScreen> {
  // Instantiate Object
  final alchemy = Alchemy();

  // Result TextEditingController
  final resultAreaController = TextEditingController();

  // Generic API call function
  void call(Future function) async {
    debugPrint('requesting...');
    resultAreaController.text = 'requesting...';

    final result = await function;

    result.fold(
      (error) {
        final text = error is String ? error : error.toJson().toString();
        resultAreaController.text = text;
        debugPrint(text);
      },
      (response) {
        final text =
            response is String ? response : response.toJson().toString();
        resultAreaController.text = text;
        debugPrint(text);
      },
    );

    debugPrint('request done');
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
                label: const Text('balance'),
                onPressed: () => call(alchemy.polygon.getBalance(
                  address: '0x2355Dc1f1eEAfFE537535B7B7B410E5dCCBAC3b8',
                )),
              ),
              const Divider(),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('blockNumber'),
                onPressed: () => call(alchemy.polygon.blockNumber()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
