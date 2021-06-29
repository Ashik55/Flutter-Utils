import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';

class LottiePage extends HookWidget {
  const LottiePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final animationController = useAnimationController();

    return Scaffold(
      body: ListView(
        children: [
          // Load a Lottie file from your assets
          Lottie.asset('assets/lottie/search.json',
          controller: animationController,
          onLoaded: (composition){


            animationController.addStatusListener((status) {
              print(status);

              if(status == AnimationStatus.completed){
                print("complete");
                animationController.forward();

              }

            });


            animationController
            .. duration = composition.duration
                .. forward();
          }
          ),

          // Load a Lottie file from a remote url
          Lottie.network(
              'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),

        ],
      ),
    );

  }
}
