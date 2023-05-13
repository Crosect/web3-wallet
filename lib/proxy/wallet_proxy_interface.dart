import 'wallet_proxy_stub.dart'
    if (dart.library.html) 'package:wallet_proxy_pattern/proxy/wallet_proxy_web.dart'
    if (dart.library.io) 'package:wallet_proxy_pattern/proxy/wallet_proxy_other.dart';

abstract class WalletProxy {
  /// Only Web
  Future<String> requestConnect();

  Future<String> wcConnect();

  /// Only Web
  Future requestETH();

  Future<String> signMessage({String? param});

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
  });

  Future statusTransaction();

  Future<int> getChainId();

  /// Only Web
  dynamic onChainChanged(void Function(int chainId) listener);

  /// Only Web
  dynamic onAccountsChanged(void Function(List<String> accounts) listener);

  /// Only Web
  Future<void> autoAddChain();

  factory WalletProxy() => getWalletProxy();
}
