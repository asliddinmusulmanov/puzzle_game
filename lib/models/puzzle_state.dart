import 'package:equatable/equatable.dart';
import 'package:learn_puzzle/models/tile_model.dart';

class PuzzleState extends Equatable {
  final List<Tile> tiles;

  const PuzzleState(this.tiles);

  @override
  List<Object> get props => [tiles];
}
