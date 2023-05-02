import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExhibitionContainer extends StatelessWidget {
  const ExhibitionContainer({super.key});

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
            top: 15,
            left: 120,
            child: SvgPicture.asset(
              'assets/images/cinvu-logo.svg',
              height: 70,
              width: 70,
            ),
          ),
          const Center(
            child: Text(
              'Exhibition',
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
