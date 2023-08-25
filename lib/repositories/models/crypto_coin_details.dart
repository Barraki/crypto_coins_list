import 'package:equatable/equatable.dart';

class CryptoCoinDetails extends Equatable {
  const CryptoCoinDetails(
      {required this.name,
      required this.priceInUSD,
      required this.imageURL,
      required this.toSymbol,
      required this.lastUpdate,
      required this.high24Hour,
      required this.low24Hour});

  final String name;
  final double priceInUSD;
  final String imageURL;
  final String toSymbol;
  final DateTime lastUpdate;
  final double high24Hour;
  final double low24Hour;

  @override
  List<Object?> get props => props
    ..addAll([
      name,
      priceInUSD,
      imageURL,
      toSymbol,
      lastUpdate,
      high24Hour,
      low24Hour
    ]);
}
