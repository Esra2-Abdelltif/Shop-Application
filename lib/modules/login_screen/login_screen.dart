import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        flex: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: List.generate(
            //     contents.length,
            //         (int index) => _buildDots(index: index),
            //   ),
            // ),
            // _currentPage + 1 == contents.length
            //     ? Padding(
            //   padding: const EdgeInsets.all(30),
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     child: Text("START"),
            //     style: ElevatedButton.styleFrom(
            //       primary: Colors.black,
            //       shape: new RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(50),
            //       ),
            //       padding: (width <= 550)
            //           ? EdgeInsets.symmetric(
            //           horizontal: 100, vertical: 20)
            //           : EdgeInsets.symmetric(
            //           horizontal: width * 0.2, vertical: 25),
            //       textStyle:
            //       TextStyle(fontSize: (width <= 550) ? 13 : 17),
            //     ),
            //   ),
            // )
            //     : Padding(
            //   padding: const EdgeInsets.all(30),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       TextButton(
            //         onPressed: () {
            //           _controller.jumpToPage(2);
            //         },
            //         child: Text(
            //           "SKIP",
            //           style: TextStyle(color: Colors.black),
            //         ),
            //         style: TextButton.styleFrom(
            //           elevation: 0,
            //           textStyle: TextStyle(
            //             fontWeight: FontWeight.w600,
            //             fontSize: (width <= 550) ? 13 : 17,
            //           ),
            //         ),
            //       ),
            //       ElevatedButton(
            //         onPressed: () {
            //           _controller.nextPage(
            //             duration: Duration(milliseconds: 200),
            //             curve: Curves.easeIn,
            //           );
            //         },
            //         child: Text("NEXT"),
            //         style: ElevatedButton.styleFrom(
            //           primary: Colors.black,
            //           shape: new RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(50),
            //           ),
            //           elevation: 0,
            //           padding: (width <= 550)
            //               ? EdgeInsets.symmetric(
            //               horizontal: 30, vertical: 20)
            //               : EdgeInsets.symmetric(
            //               horizontal: 30, vertical: 25),
            //           textStyle: TextStyle(
            //               fontSize: (width <= 550) ? 13 : 17),
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
