part of 'crypto_coins_list_bloc.dart';

abstract class CryptoListEvent extends Equatable {
  const CryptoListEvent();

  @override
  List<Object?> get props => [];
}

class LoadCryptoList extends CryptoListEvent {
  const LoadCryptoList({this.completer});
  final Completer? completer;
  
  @override
  List<Object?> get props => [completer];
}
