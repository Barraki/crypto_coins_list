part of 'crypto_coin_bloc.dart';

abstract class CryptoCoinDetailsEvent extends Equatable {
  const CryptoCoinDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadCryptoCoinDetails extends CryptoCoinDetailsEvent {
  const LoadCryptoCoinDetails({required this.currencyCode});
  final String currencyCode;
  // final Completer? completer;

  @override
  List<Object> get props => super.props..add(currencyCode);
}
