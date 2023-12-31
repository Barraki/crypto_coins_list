import 'package:crypto_coins_list/repositories/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Image.network(coin.imageURL),
      title: Text(coin.name, style: theme.textTheme.bodyMedium),
      subtitle:
          Text('${coin.priceInUSD} \$', style: theme.textTheme.labelSmall),
      trailing: const Icon(
        Icons.arrow_forward_ios,
      ),
      onTap: () => {
        Navigator.pushNamed(context, '/coin', arguments: coin),
      },
    );
  }
}
