part of 'crypto_coins_list_bloc.dart';

abstract class CryptoListState extends Equatable {}

class CryptoListInitial extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoading extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoaded extends CryptoListState {
  CryptoListLoaded({required this.coinsList});

  final List<CryptoCoin> coinsList;
  
  @override
  List<Object?> get props => [coinsList];
}

class CryptoListError extends CryptoListState {
  CryptoListError({required this.exception});

  final Object? exception;
  
  @override
  List<Object?> get props => [exception];
}
