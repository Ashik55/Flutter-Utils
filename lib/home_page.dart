import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<Offset>? offset;



  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();

    // controller =
    //     AnimationController(vsync: this, duration: Duration(seconds: 1));
    //
    // offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0))
    //     .animate(controller!);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: RaisedButton(
              child: Text('Show / Hide'),
              onPressed: () {
                // switch (controller?.status) {
                //   case AnimationStatus.completed:
                //     controller?.reverse();
                //     break;
                //   case AnimationStatus.dismissed:
                //     controller?.forward();
                //     break;
                //   default:
                // }
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: _offsetAnimation,
              child: Padding(
                padding: EdgeInsets.all(100.0),
                child: FlutterLogo(size: 150.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
