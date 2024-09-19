import 'package:flutter/material.dart';

class NeuBoxDecor extends StatelessWidget {
  const NeuBoxDecor({super.key, required this.child});
  final Widget child;
  // final String imageSong;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          width: double.infinity,
          // height: 400,
          // padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              // image:
              //     DecorationImage(image: AssetImage(imageSong), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(4, 4),
                  blurRadius: 15,
                  color: Color.fromARGB(255, 136, 133, 133),
                ),
                BoxShadow(
                  offset: Offset(-4, -4),
                  blurRadius: 15,
                  color: Color.fromARGB(255, 105, 104, 104),
                ),
              ],
              // color: Theme.of(context).colorScheme.secondary,

              color: Colors.white),
          child: child),
    );
  }
}
