// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../models/puzzle_bloc.dart';
// import '../../models/puzzle_event.dart';
// import '../../models/puzzle_state.dart';
//
// class PuzzleWidget extends StatelessWidget {
//   const PuzzleWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PuzzleBloc, PuzzleState>(
//       builder: (context, state) {
//         return GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 4,
//           ),
//           itemCount: state.tiles.length,
//           itemBuilder: (context, index) {
//             final tile = state.tiles[index];
//             return GestureDetector(
//               onTap: () {
//                 if (!tile.isEmpty) {
//                   context.read<PuzzleBloc>().add(
//                         TileTapped(tile.value),
//                       );
//                 }
//               },
//               child: Container(
//                 margin: const EdgeInsets.all(4),
//                 color: tile.isEmpty ? Colors.grey : Colors.blue,
//                 child: Center(
//                   child: tile.isEmpty
//                       ? null
//                       : Text(
//                           tile.value.toString(),
//                           style: const TextStyle(
//                             fontSize: 24,
//                             color: Colors.white,
//                           ),
//                         ),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
