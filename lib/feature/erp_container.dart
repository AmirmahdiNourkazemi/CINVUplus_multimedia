import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErpContainer extends StatelessWidget {
  const ErpContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: Color(0xff313F6B),
        ),
        borderRadius: BorderRadius.circular(30),
        shape: BoxShape.rectangle,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 30,
            left: 110,
            child: SvgPicture.asset(
              'assets/images/cinvu-logo.svg',
              height: 70,
              width: 70,
            ),
          ),
          Center(
            child: Text(
              'ERP',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
