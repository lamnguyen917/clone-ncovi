// part of home_view;

// class _HomeMobile extends StatelessWidget {
//   final HomeViewModel viewModel;

//   _HomeMobile(this.viewModel);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(S.of(context).mobile),
//         backgroundColor: Colors.black,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               S.of(context).message,
//               style: TextStyle(fontSize: 14),
//             ),
//             Text(
//               '${viewModel.counter}',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: viewModel.increment,
//         backgroundColor: Colors.black,
//       ),
//     );
//   }
// }
