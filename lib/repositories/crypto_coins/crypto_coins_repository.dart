import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:crypto_coins_list/repositories/models/models.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({required this.dio});

  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,AID,IMX&tsyms=USD');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final USDData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = USDData['PRICE'] as double;
      final imageURL = USDData['IMAGEURL'] as String;
      return CryptoCoin(
          name: e.key,
          priceInUSD: price,
          imageURL: 'https://www.cryptocompare.com/$imageURL');
    }).toList();

    return cryptoCoinsList;
  }

  @override
  Future<CryptoCoinDetails> getCoinDetails(String currencyCode) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final USDData = coinData['USD'] as Map<String, dynamic>;
    final price = USDData['PRICE'];
    final imageURL = USDData['IMAGEURL'];
    final toSymbol = USDData['TOSYMBOL'];
    final lastUpdate = USDData['LASTUPDATE'];
    final high24Hour = USDData['HIGH24HOUR'];
    final low24Hour = USDData['LOW24HOUR'];

    return CryptoCoinDetails(
        name: currencyCode,
        priceInUSD: price,
        imageURL: 'https://www.cryptocompare.com/$imageURL',
        toSymbol: toSymbol,
        lastUpdate: DateTime.fromMillisecondsSinceEpoch(lastUpdate),
        high24Hour: high24Hour,
        low24Hour: low24Hour);
  }
}
