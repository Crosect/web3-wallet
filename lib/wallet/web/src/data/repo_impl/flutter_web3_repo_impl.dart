import 'package:flutter_web3/ethereum.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:wallet_proxy_pattern/wallet/web/src/domain/repo/flutter_web3_repository.dart';

class FlutterWeb3RepoImpl implements FlutterWeb3Repository {
  static String address = '';

  @override
  Future<void> autoAddChain() async {
    await ethereum!.walletSwitchChain(97, () async {
      await ethereum!.walletAddChain(
        chainId: 97,
        chainName: 'Binance MainNet',
        nativeCurrency:
            CurrencyParams(name: 'BNB', symbol: 'BNB', decimals: 18),
        rpcUrls: ['https://data-seed-prebsc-1-s1.binance.org:8545/'],
      );
    });
  }

  @override
  dynamic onChainChanged(void Function(int chainId) listener) async {
    if (Ethereum.isSupported) {
      return ethereum!.onChainChanged(listener);
    }
  }

  @override
  Future<String> disconnect() {
    // TODO: implement disconnect
    throw UnimplementedError();
  }

  @override
  Future<String> requestConnect() async {
    if (Ethereum.isSupported) {
      final accs = await ethereum!.requestAccount();
      if (accs.isNotEmpty) {
        address = accs.first;
        if (address.isEmpty) {
          requestConnect();
        }

        return address;
      }
    }
    return address;
  }

  @override
  Future<String> wcConnect() async {
    final wc = WalletConnectProvider.binance();
    await wc.connect();
    if (wc.connected) {
      address = wc.accounts.first;
    }
    return address;
  }

  @override
  dynamic onAccountsChanged(void Function(List<String> accounts) listener) {
    if (Ethereum.isSupported) {
      return ethereum!.onAccountsChanged(listener);
    }
  }

  @override
  Future<String> signMessage({String? param}) async {
    final signature =
        await ethereum!.request('personal_sign', [address, param ?? 'ABC']);
    return signature;
  }

  @override
  Future<int> getChainId() => ethereum!.getChainId();

  @override
  Future<String> sendTransaction({
    String? to,
    String? from,
    BigInt? value,
    BigInt? gasLimit,
    BigInt? gasPrice,
    int? nounce,
    String? data,
    BigInt? maxFeePerGas,
    BigInt? maxPriorityFeePerGas,
  }) async {
    // Get signer from provider
    final signer = provider!.getSigner();
    final tx = await signer.sendTransaction(
      TransactionRequest(
        from: from,
        to: to,
        value: value,
        gasLimit: gasLimit,
        gasPrice: gasPrice,
        nounce: nounce,
        data: data,
        maxFeePerGas: maxFeePerGas,
        maxPriorityFeePerGas: maxPriorityFeePerGas,
      ),
    );

    return tx.hash;
  }
}
