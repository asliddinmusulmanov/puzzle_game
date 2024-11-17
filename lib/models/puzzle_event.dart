import 'package:equatable/equatable.dart';

abstract class PuzzleEvent extends Equatable {
  const PuzzleEvent();

  @override
  List<Object> get props => [];
}

class TileTapped extends PuzzleEvent {
  final int tileValue;

  const TileTapped(this.tileValue);

  @override
  List<Object> get props => [tileValue];
}
