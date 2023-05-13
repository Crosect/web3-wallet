import 'package:wallet_proxy_pattern/proxy/wallet_proxy_interface.dart';
import 'package:wallet_proxy_pattern/wallet/web/src/data/repo_impl/flutter_web3_repo_impl.dart';

class WalletProxyWeb implements WalletProxy {
  late FlutterWeb3RepoImpl flutterWeb3RepoImpl;

  WalletProxyWeb() {
    flutterWeb3RepoImpl = FlutterWeb3RepoImpl();
  }

  @override
  Future<String> requestConnect() => flutterWeb3RepoImpl.requestConnect();

  @override
  Future<String> wcConnect() => flutterWeb3RepoImpl.wcConnect();

  @override
  Future requestETH() async {
    // TODO: Implement case ...
  }

  @override
  Future<String> signMessage({String? param}) =>
      flutterWeb3RepoImpl.signMessage(param: param);

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
  }) =>
      flutterWeb3RepoImpl.sendTransaction(
        from: from,
        to: to,
        value: value,
        gasLimit: gasLimit,
        gasPrice: gasPrice,
        nounce: nounce,
        data: data,
        maxFeePerGas: maxFeePerGas,
        maxPriorityFeePerGas: maxPriorityFeePerGas,
      );

  @override
  Future statusTransaction() async {
    // TODO: Implement case ...
  }

  @override
  Future<int> getChainId() => flutterWeb3RepoImpl.getChainId();

  @override
  Future<void> autoAddChain() => flutterWeb3RepoImpl.autoAddChain();

  @override
  dynamic onAccountsChanged(void Function(List<String> accounts) listener) =>
      flutterWeb3RepoImpl.onAccountsChanged(listener);

  @override
  dynamic onChainChanged(void Function(int chainId) listener) =>
      flutterWeb3RepoImpl.onChainChanged(listener);
}

WalletProxy getWalletProxy() => WalletProxyWeb();
