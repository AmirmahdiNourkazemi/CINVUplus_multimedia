import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MetaContainer extends StatelessWidget {
  const MetaContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var snackBar = SnackBar(
            backgroundColor: Color(0xff313F6B),
            content: const Text(
              'Comming soon....',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.white,
              ),
            ));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Container(
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
              top: 20,
              left: 110,
              child: SvgPicture.asset(
                'assets/images/cinvu-logo.svg',
                height: 70,
                width: 70,
              ),
            ),
          const  Center(
              child: Text(
                'Meta',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
