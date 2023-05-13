import 'dart:typed_data';

import 'package:web3dart/src/crypto/secp256k1.dart' as secp256k1;
import 'package:web3dart/web3dart.dart';

import '../wallet_connect_lib/src/providers/ethereum_walletconnect_provider.dart';

class WalletConnectEthereumCredentials extends CustomTransactionSender {
  WalletConnectEthereumCredentials({required this.provider});

  final EthereumWalletConnectProvider provider;

  @override
  Future<EthereumAddress> extractAddress() {
    // TODO: implement extractAddress
    throw UnimplementedError();
  }

  @override
  Future<String> sendTransaction(Transaction transaction) async {
    return await provider.sendTransaction(
      from: transaction.from!.hex,
      to: transaction.to?.hex,
      data: transaction.data,
      gas: transaction.maxGas,
      gasPrice: transaction.gasPrice?.getInWei,
      value: transaction.value?.getInWei,
      nonce: transaction.nonce,
    );
  }

  @override
  Future<secp256k1.MsgSignature> signToSignature(
    Uint8List payload, {
    int? chainId,
    bool isEIP1559 = false,
  }) {
    // TODO: implement signToSignature
    throw UnimplementedError();
  }
}
