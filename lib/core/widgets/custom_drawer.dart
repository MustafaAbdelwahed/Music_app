import 'package:flutter/material.dart';
import 'package:music_app/core/utils/app_color.dart';
import 'package:music_app/features/home/presentation/view/setting_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      child: Column(
        children: [
          const DrawerHeader(
            child: Center(
              child: Icon(
                Icons.music_note_rounded,
                size: 40,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: const Text(
              " H O M E ",
              style: TextStyle(),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
            ),
            title: const Text(
              " S E T I N G S",
              style: TextStyle(),
            ),
            onTap: () {
              Navigator.of(context).pop();

              Navigator.pushNamed(context, SettingView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
