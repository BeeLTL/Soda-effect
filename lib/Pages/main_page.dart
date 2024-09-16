import 'package:flutter/material.dart';
import 'package:soda_effect/Pages/Widgets/header.dart';
import 'package:soda_effect/Pages/Widgets/rocks.dart';
import 'package:soda_effect/Pages/Widgets/soda.dart';
import 'package:soda_effect/Utils/device/size_config.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Assets/Images/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 13,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 0.4,
                      color: const Color(0xff1E1E1E)), // Border for grid cells
                ),
              );
            },
            itemCount: 90, // Total number of grid cells
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Color(0x00ff0001)],
                stops: [0.0, 150.0 / 151.0],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                tileMode: TileMode.repeated,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Color(0x00ff0001)],
                stops: [0.0, 150.0 / 151.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.repeated,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffcdcdcdcc), Color(0xffcdcdcdcc)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          const Header(),
          const Rocks(),
          const Center(child: Soda()),
        ],
      ),
    );
  }
}
