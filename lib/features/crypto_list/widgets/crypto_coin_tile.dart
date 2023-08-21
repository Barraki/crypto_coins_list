import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    Key? key,
    required this.coinName,
  }) : super(key: key);

  final String coinName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
  }
}
