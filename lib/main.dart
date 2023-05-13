import 'package:flutter/material.dart';
import 'package:wallet_proxy_pattern/proxy/wallet_proxy_interface.dart';

/// Test
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Demo Proxy wallet web/desktop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _counter = '';
  WalletProxy proxy = WalletProxy();

  @override
  void initState() {
    super.initState();
    proxy.onAccountsChanged((accounts) {
      print(accounts);
      setState(() {
        _counter = accounts.first;
      });
    });
    proxy.onChainChanged((chainId) {
      print(chainId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Address:',
            ),
            Text(
              _counter,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _counter = await proxy.requestConnect();
          setState(() {});
        },
        tooltip: 'Connect Wallet',
        child: const Icon(Icons.connect_without_contact),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
