import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PuzzlePage extends StatefulWidget {
  @override
  _PuzzlePageState createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {
  late List<int> tiles;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _shuffleTiles();
  }

  void _shuffleTiles() {
    tiles = List.generate(16, (index) => index + 1);
    tiles[tiles.length - 1] = 0; // Set the last tile to be the empty tile (0)
    tiles.shuffle();
    setState(() {});
  }

  void _onTileTap(int index) {
    int emptyIndex = tiles.indexOf(0);
    if (_isAdjacent(index, emptyIndex)) {
      setState(() {
        tiles[emptyIndex] = tiles[index];
        tiles[index] = 0;
      });
    }
  }

  bool _isAdjacent(int index1, int index2) {
    int row1 = index1 ~/ 4;
    int col1 = index1 % 4;
    int row2 = index2 ~/ 4;
    int col2 = index2 % 4;

    return (row1 == row2 && (col1 - col2).abs() == 1) ||
        (col1 == col2 && (row1 - row2).abs() == 1);
  }

  bool _isInCorrectPosition(int index) {
    return tiles[index] == index + 1;
  }

  void _onRefresh() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(Duration(seconds: 3));

    _shuffleTiles();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('15 Puzzle'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _onRefresh,
          )
        ],
      ),
      body: Center(
        child: _isLoading
            ? Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: 16,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    );
                  },
                ),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: tiles.length,
                itemBuilder: (context, index) {
                  final tileValue = tiles[index];
                  final correctPosition = _isInCorrectPosition(index);

                  return GestureDetector(
                    onTap: () {
                      if (tileValue != 0) {
                        _onTileTap(index);
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: tileValue == 0
                            ? Colors.grey
                            : (correctPosition ? Colors.green : Colors.blue),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: tileValue == 0
                            ? null
                            : Text(
                                tileValue.toString(),
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
