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
}
