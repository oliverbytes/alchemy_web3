import 'package:alchemy_web3/alchemy_web3.dart';
import 'package:console_mixin/console_mixin.dart';
import 'package:flutter/material.dart';

class ChainAPIsScreen extends StatefulWidget {
  const ChainAPIsScreen({Key? key}) : super(key: key);

  @override
  State<ChainAPIsScreen> createState() => _ChainAPIsScreenState();
}

class _ChainAPIsScreenState extends State<ChainAPIsScreen> with ConsoleMixin {
  final alchemy = Alchemy();

  // Result TextEditingController
  final resultAreaController = TextEditingController();
  Color? resultColor;

  // Generic API call function
  void call(Future function) async {
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
        final text = response is String ? response : response.toJson().toString();
        resultAreaController.text = text;
        resultColor = null;
      },
    );

    setState(() {});
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
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 20,
            spacing: 20,
            children: [
              ElevatedButton(
                child: const Text('blockNumber'),
                onPressed: () => call(alchemy.polygon.blockNumber()),
              ),
              ElevatedButton(
                child: const Text('getBlockByHash'),
                onPressed: () => call(
                  alchemy.polygon.getBlockByHash(
                    hash: '0xd679a083f7d33c6f47f900ccc77ec58ef8e1c503d6d781e05f4af4f910c5e310',
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('getBlockByNumber'),
                onPressed: () => call(
                  alchemy.polygon.getBlockByNumber(
                    block: '0x1b4',
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('getTransactionByHash'),
                onPressed: () => call(
                  alchemy.polygon.getTransactionByHash(
                    hash: '0x4ddadd65225424331a4116bcb1462275deb89ec4990519ef48679333b75653f0',
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('getTransactionCount'),
                onPressed: () => call(
                  alchemy.polygon.getTransactionCount(
                    address: '0x2355Dc1f1eEAfFE537535B7B7B410E5dCCBAC3b8',
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('getTransactionReceipt'),
                onPressed: () => call(
                  alchemy.polygon.getTransactionReceipt(
                    hash: '0x4ddadd65225424331a4116bcb1462275deb89ec4990519ef48679333b75653f0',
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('getBlockTransactionCountByHash'),
                onPressed: () => call(
                  alchemy.polygon.getBlockTransactionCountByHash(
                    hash: '0xd679a083f7d33c6f47f900ccc77ec58ef8e1c503d6d781e05f4af4f910c5e310',
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('getBlockTransactionCountByNumber'),
                onPressed: () => call(
                  alchemy.polygon.getBlockTransactionCountByNumber(
                    block: 'latest',
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('getTransactionByBlockNumberAndIndex'),
                onPressed: () => call(
                  alchemy.polygon.getTransactionByBlockNumberAndIndex(
                    block: 'latest',
                    index: '0x0',
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('getRootHash'),
                onPressed: () => call(
                  alchemy.polygon.getRootHash(
                    from: 1000000,
                    to: 1032767,
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('getSignersAtHash'),
                onPressed: () => call(
                  alchemy.polygon.getSignersAtHash(
                    hash: '0xd679a083f7d33c6f47f900ccc77ec58ef8e1c503d6d781e05f4af4f910c5e310',
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('getTransactionReceiptsByBlock'),
                onPressed: () => call(
                  alchemy.polygon.getTransactionReceiptsByBlock(
                    block: 'latest',
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('getTransactionByBlockHashAndIndex'),
                onPressed: () => call(
                  alchemy.polygon.getTransactionByBlockHashAndIndex(
                    hash: '0xd679a083f7d33c6f47f900ccc77ec58ef8e1c503d6d781e05f4af4f910c5e310',
                    index: '0x0',
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('sendRawTransaction'),
                onPressed: () => call(
                  alchemy.polygon.sendRawTransaction(
                    signedData:
                        '0x29adbbaf99a3f97b2baefa11e865cf9d74435716ef8618caaa388619f5ae7d8e5d2cadab0cd2f5becd4ebf7d48f5584c9e414c2a4a6ea2bc6ea8f02dbf5675cd01',
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('getBalance'),
                onPressed: () => call(alchemy.polygon.getBalance(
                  address: '0x2355Dc1f1eEAfFE537535B7B7B410E5dCCBAC3b8',
                )),
              ),
              ElevatedButton(
                child: const Text('getCode'),
                onPressed: () => call(
                  alchemy.polygon.getCode(
                    address: '0x2355Dc1f1eEAfFE537535B7B7B410E5dCCBAC3b8',
                    block: 'latest',
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('getStorageAt'),
                onPressed: () => call(
                  alchemy.polygon.getStorageAt(
                    address: '0x2355Dc1f1eEAfFE537535B7B7B410E5dCCBAC3b8',
                    index: '0x0',
                    block: 'latest',
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('accounts'),
                onPressed: () => call(alchemy.polygon.accounts()),
              ),
              ElevatedButton(
                child: const Text('getProof'),
                onPressed: () => call(
                  alchemy.polygon.getProof(
                    address: '0x2355Dc1f1eEAfFE537535B7B7B410E5dCCBAC3b8',
                    storageKeys: ['0x0000000000000000000000000000000000000000000000000000000000000000'],
                    block: 'latest',
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('call'),
                onPressed: () => call(
                  alchemy.polygon.call(
                    call: EthTransactionCall(
                      from: '0xb60e8dd61c5d32be8058bb8eb970870f07233155',
                      to: '0xd46e8dd67c5d32be8058bb8eb970870f07244567',
                      gas: '0x76c0',
                      gasPrice: '0x9184e72a000',
                      value: '0x9184e72a',
                      data: '0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675',
                    ),
                    block: 'latest',
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('getLogs'),
                onPressed: () => call(
                  alchemy.polygon.getLogs(
                    options: [
                      EthFilterOptions(
                        fromBlock: '0x1',
                        toBlock: '0x2',
                        address: '0x8888f1f195afa192cfee860698584c030f4c9db1',
                        topics: [
                          "0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b",
                          null,
                          [
                            "0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b",
                            "0x0000000000000000000000000aff3454fce5edbc8cca8697c15331677e6ebccc",
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // works for Ethereum only
              ElevatedButton(
                child: const Text('protocolVersion'),
                onPressed: () => call(alchemy.eth.protocolVersion()),
              ),
              ElevatedButton(
                child: const Text('gasPrice'),
                onPressed: () => call(alchemy.polygon.gasPrice()),
              ),
              ElevatedButton(
                child: const Text('estimateGas'),
                onPressed: () => call(
                  alchemy.polygon.estimateGas(
                    call: EthTransactionCall(
                      from: '0xb60e8dd61c5d32be8058bb8eb970870f07233155',
                      to: '0xd46e8dd67c5d32be8058bb8eb970870f07244567',
                      gas: '0x76c0',
                      gasPrice: '0x9184e72a000',
                      value: '0x9184e72a',
                      data: '0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675',
                    ),
                    block: 'latest',
                  ),
                ),
              ),
              // works for Ethereum only
              ElevatedButton(
                child: const Text('feeHistory'),
                onPressed: () => call(
                  alchemy.eth.feeHistory(
                    blockCount: 4,
                    block: 'latest',
                    rewardPercentiles: [25, 75],
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('getTokenBalance'),
                onPressed: () => call(
                  alchemy.erc20.getTokenBalance(
                    address: 'tokenAddress',
                    contractAddress: '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984',
                  ),
                ),
              ),

              ElevatedButton(
                child: const Text('chainId'),
                onPressed: () => call(alchemy.polygon.chainId()),
              ),
              ElevatedButton(
                child: const Text('getUncleByBlockNumberAndIndex'),
                onPressed: () => call(
                  alchemy.polygon.getUncleByBlockNumberAndIndex(
                    index: '0x0',
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('getUncleByBlockHashAndIndex'),
                onPressed: () => call(
                  alchemy.polygon.getUncleByBlockHashAndIndex(
                    block: '0xd679a083f7d33c6f47f900ccc77ec58ef8e1c503d6d781e05f4af4f910c5e310',
                    index: '0x0',
                  ),
                ),
              ),

              ElevatedButton(
                child: const Text('getUncleCountByBlockHash'),
                onPressed: () => call(
                  alchemy.polygon.getUncleCountByBlockHash(
                    hash: '0xd679a083f7d33c6f47f900ccc77ec58ef8e1c503d6d781e05f4af4f910c5e310',
                  ),
                ),
              ),

              ElevatedButton(
                child: const Text('getUncleCountByBlockNumber'),
                onPressed: () => call(
                  alchemy.polygon.getUncleCountByBlockNumber(
                    block: '0x0',
                  ),
                ),
              ),

              ElevatedButton(
                child: const Text('getFilterChanges'),
                onPressed: () => call(
                  alchemy.polygon.getFilterChanges(
                    filterId: '0xfe704947a3cd3ca12541458a4321c869',
                  ),
                ),
              ),

              ElevatedButton(
                child: const Text('newBlockFilter'),
                onPressed: () => call(alchemy.polygon.newBlockFilter()),
              ),

              ElevatedButton(
                child: const Text('newFilter'),
                onPressed: () => call(
                  alchemy.polygon.newFilter(
                    options: [
                      EthFilterOptions(
                        fromBlock: '0x1',
                        toBlock: '0x2',
                        address: '0x8888f1f195afa192cfee860698584c030f4c9db1',
                        topics: [
                          "0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b",
                          null,
                          [
                            "0x000000000000000000000000a94f5374fce5edbc8e2a8697c15331677e6ebf0b",
                            "0x0000000000000000000000000aff3454fce5edbc8cca8697c15331677e6ebccc",
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              ElevatedButton(
                child: const Text('newPendingTransactionFilter'),
                onPressed: () => call(alchemy.polygon.newPendingTransactionFilter()),
              ),

              ElevatedButton(
                child: const Text('uninstallFilter'),
                onPressed: () => call(
                  alchemy.polygon.uninstallFilter(
                    filterId: '0xfe704947a3cd3ca12541458a4321c869',
                  ),
                ),
              ),

              ElevatedButton(
                child: const Text('uninstallFilter'),
                onPressed: () => call(
                  alchemy.polygon.uninstallFilter(
                    filterId: '0xfe704947a3cd3ca12541458a4321c869',
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
