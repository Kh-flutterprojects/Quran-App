import 'package:audioplayer/appSetting/ScreenDimension.dart';
import 'package:flutter/material.dart';

class HeartWidget extends StatefulWidget {
  @override
  _HeartWidgetState createState() => _HeartWidgetState();
}

class _HeartWidgetState extends State<HeartWidget> {
  @override
  Widget build(BuildContext context) {
    return  CustomPaint(
          size: Size(210, 200),
          painter: HeartPainter(),
          child: Container(
            height: SD.screenHeight/1.2,
              width: SD.screenWidth,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40,),
                  Text("Raneem",style: TextStyle(color: Colors.white,fontSize: 20)),
                  Text("You Are My All",style: TextStyle(color: Colors.white,fontSize: 15)),
                  Text("You Are My Happiness",style: TextStyle(color: Colors.white,fontSize: 13)),
                  Text("You Are My Hope",style: TextStyle(color: Colors.white,fontSize: 13)),
                  Text("Love You",style: TextStyle(color: Colors.white,fontSize: 13)),
                  Text("So So..Much",style: TextStyle(color: Colors.white,fontSize: 13)),

                ],
              ))

    );
  }
}

class HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint();
    paint
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    Paint paint1 = Paint();
    paint1
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;

    double width = size.width;
    double height = size.height;

    Path path = Path();
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
        0.5 * width, height);
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
        0.5 * width, height);

    canvas.drawPath(path, paint1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}