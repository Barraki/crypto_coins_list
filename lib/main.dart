import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const CryptoCurrenciesListApp());
}

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
            bodyMedium: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
            labelSmall: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
                fontWeight: FontWeight.w500)),
        scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
        primarySwatch: Colors.yellow,
        dividerColor: Colors.white.withOpacity(0.2),
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 31, 31, 31),
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700)),
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
      ),
      routes: {
        '/': (context) =>
            const CryptoListScreen(title: 'Crypto Currencies List'),
        '/coin': (context) => const CryptoCoinScreen(),
      },
    );
  }
}

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
          itemCount: 30,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, i) {
            const coinName = 'Bitcoin';

            return ListTile(
              leading: SvgPicture.asset('assets/svg/bitcoin-logo.svg',
                  width: 30, height: 30),
              // trailing: '',
              title: Text(coinName, style: theme.textTheme.bodyMedium),
              subtitle: Text('2000 \$', style: theme.textTheme.labelSmall),
              trailing: const Icon(
                Icons.arrow_forward_ios,
              ),
              onTap: () => {
                Navigator.pushNamed(context, '/coin', arguments: coinName),
              },
            );
          }),
    );
  }
}

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({Key? key}) : super(key: key);

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide String args');

    coinName = args as String;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coinName ?? '...'),
      ),
    );
  }
}
