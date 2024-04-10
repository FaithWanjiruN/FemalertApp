// ignore_for_file: must_be_immutable

import 'package:femalert2/utils/colors.dart';
import 'package:flutter/material.dart';

class HelpLineCards extends StatelessWidget {
  String title;
  String number;
  String assetImg;

  HelpLineCards({
    super.key,
    required this.title,
    required this.number,
    required this.assetImg,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 110,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    assetImg,
                    height: 30,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: ColorsValue.h1,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),

                  // Text(
                  //   "call $number",
                  //   style: TextStyle(
                  //     color: Color(ColorsValue().h5),
                  //     fontSize: 16,
                  //   ),
                  // ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.red,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
