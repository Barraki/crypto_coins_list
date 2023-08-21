part of 'crypto_coins_list_bloc.dart';

class CryptoListState {}

class CryptoListInitial extends CryptoListState {}

class CryptoListLoaded extends CryptoListState {
  CryptoListLoaded({required this.coinsList});

  final List<CryptoCoin> coinsList;
}

class CryptoListError extends CryptoListState {
  CryptoListError({required this.exception});

  final Object? exception;
}
