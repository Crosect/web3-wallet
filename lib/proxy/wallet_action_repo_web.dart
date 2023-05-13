abstract class WalletActionRepoWeb{

  Future<String> requestConnect({String? param});
  Future<String> connectUsingWalletConnect({String? param});
  Future<String> requestEth({String? param});
  Future<String> sendTransaction({String? param});
  Future<String> signMessage({String? param});
  Future<String> getChainId({String? param});
  Future<String> autoSwitchChain({String? param});
  Future<String> autoAddToken({String? param});
  Future<String> autoSwitchAccount({String? param});
}