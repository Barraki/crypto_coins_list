import 'package:crypto_coins_list/features/crypto_list/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
          itemCount: 30,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, i) {
            const coinName = 'Bitcoin';

            return const CryptoCoinTile(coinName: coinName);
          }),
    );
  }
}
