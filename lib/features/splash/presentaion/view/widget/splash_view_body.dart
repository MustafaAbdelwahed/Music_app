import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/features/home/presentation/view/home_view.dart';

// import 'package:fruit_ecommerce_app/constants.dart';
// import 'package:fruit_ecommerce_app/core/services/shared_prefrences_singletone.dart.dart';
// import 'package:fruit_ecommerce_app/core/utils/app_images.dart';
// import 'package:fruit_ecommerce_app/features/auth/Presentation/view/login_view.dart';
// import 'package:fruit_ecommerce_app/features/onboarding/presentaion/view/onboarding_view.dart';
// import 'package:svg_flutter/svg.dart';
// import 'package:intl/intl.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    executeNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Image.asset(
          "assets/images/logo.png",
          color: const Color.fromARGB(255, 99, 97, 97),
          scale: 3,
        )),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Music App",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 99, 97, 97),
          ),
        )
      ],
    );
  }

  executeNavigation() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, HomeView.routeName);
    });
  }
}
