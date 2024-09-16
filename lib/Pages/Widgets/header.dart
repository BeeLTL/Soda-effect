import 'package:flutter/material.dart';
import 'package:soda_effect/Utils/constants/text_strings.dart';
import 'package:soda_effect/Utils/device/size_config.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 250, right: 250),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title1,
                  style: TextStyle(
                      fontFamily: "Karantina",
                      fontSize: SizeConfig.blockSizeHorizontal * 14,
                      fontWeight: FontWeight.bold,
                      height: 0.8),
                ),
                Image.asset(
                  "Assets/Images/2.png",
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: SizedBox(
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      creator,
                      style: TextStyle(
                          fontFamily: "Karantina",
                          fontSize: SizeConfig.blockSizeHorizontal * 4,
                          fontWeight: FontWeight.w700),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Designed by",
                          style: TextStyle(),
                        ),
                        Text(
                          designedBy,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Code by",
                          style: TextStyle(),
                        ),
                        Text(
                          creator,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Image.asset(
                      "Assets/Images/code.png",
                      width: 250,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
