abstract class FlutterWeb3Repository{
  Future<String> requestConnect();

  Future<String> wcConnect();

  dynamic onChainChanged(void Function(int chainId) listener);

  dynamic onAccountsChanged(void Function(List<String> accounts) listener);

  Future<void> autoAddChain();

  Future<void> disconnect();

  Future<String> signMessage({String? param});

  Future<int> getChainId();

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
}