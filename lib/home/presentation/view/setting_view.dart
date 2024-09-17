import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class SettingView extends StatelessWidget {
//   const SettingView({super.key});
//   static const routeName = "setting";
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class SettingView extends StatelessWidget {
  const SettingView({super.key});
  static const routeName = "setting";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(
          "S E T T I N G",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark Mode",
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                CupertinoSwitch(
                  // activeColor: Colors.blue,
                  value: true,
                  onChanged: (value) {},
                )
                // Consumer(builder: (context, ref, _) {
                //   final themeProv = ref.watch(themeProvider);
                //   return CupertinoSwitch(
                //     // activeColor: Colors.blue,
                //     value: themeProv.isDarkMode,
                //     onChanged: (value) {
                //       themeProv.toogleTheme();
                //     },
                //   );
                // })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
