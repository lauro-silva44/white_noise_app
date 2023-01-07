import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:white_noise_app/helpers/soundslist.dart';
import 'package:white_noise_app/styles/text.style.dart';

import '../../styles/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 40, left: 20),
                  width: size.width * .8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'White noise',
                        style: WhiteNoiseTextStyles.menu,
                      ),
                      Text(
                        'Forest Collection',
                        style: WhiteNoiseTextStyles.title,
                      ),
                      MainSoundType(),
                      SingleChildScrollView(
                        child: SizedBox(
                          height: 250,
                          child: ListView(
                            children: sounds.map((item) {
                              return AnimatedIconsSound(
                                name: item[0],
                                duration: item[1],
                                picPath: item[2],
                              );
                            }).toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const VerticalDivider(
              width: 1,
              color: sideMenuColor,
            ),
            Container(
              width: size.width * .19,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/4dots.svg',
                      color: sideMenuColor,
                      width: 24,
                    ),
                    const SideMenu(name: 'RAIN'),
                    const SideMenu(name: 'FOREST'),
                    const SideMenu(name: 'NATURAL'),
                    const SideMenu(name: 'FLOW'),
                    const SideMenu(name: 'OUTHER'),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: sideMenuColor),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(100),
                          image: const DecorationImage(
                              image: AssetImage(
                            'assets/images/user.jpg',
                          ))),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}

class MainSoundType extends StatelessWidget {
  const MainSoundType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: 150,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 230,
            width: 150,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(5.0, 5.0),
                    blurRadius: 10.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
                color: Colors.red,
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(
                      'assets/images/forest.png',
                    ))),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('04',
                            style: WhiteNoiseTextStyles.menu
                                .copyWith(color: Colors.white)),
                        SizedBox(
                          width: 70,
                          child: Text(
                            'Being in the forest',
                            style: WhiteNoiseTextStyles.listMenu
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 105,
            top: 30,
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(-1.0, 2.0),
                  blurRadius: 10.0,
                ),
              ], color: Colors.white, shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SvgPicture.asset(
                  'assets/icons/tree.svg',
                  color: whiteNoiseGrey,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AnimatedIconsSound extends StatefulWidget {
  final String name, duration, picPath;
  const AnimatedIconsSound({
    Key? key,
    required this.name,
    required this.duration,
    required this.picPath,
  }) : super(key: key);

  @override
  State<AnimatedIconsSound> createState() => _AnimatedIconsSoundState();
}

class _AnimatedIconsSoundState extends State<AnimatedIconsSound>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: Stack(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(-1.0, 2.0),
                        blurRadius: 10.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(image: AssetImage(widget.picPath))),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Lottie.asset(
                    'assets/lottie/musicwave.json',
                    height: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
            height: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: WhiteNoiseTextStyles.listMenu
                      .copyWith(color: whiteNoiseGrey),
                ),
                Text(
                  widget.duration,
                  style: WhiteNoiseTextStyles.listMenu.copyWith(fontSize: 8),
                ),
              ],
            ))
      ],
    );
  }
}

class SideMenu extends StatefulWidget {
  final String name;
  const SideMenu({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1, // rotate 90 degrees
      child: TextButton(
        onPressed: () {
          setState(() {
            clicked = !clicked;
          });
        },
        child: Row(
          children: [
            (clicked
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.circle,
                      color: Colors.blue,
                      size: 10,
                    ),
                  )
                : const SizedBox(
                    width: 25,
                  )),
            Text(
              widget.name,
              style: clicked
                  ? WhiteNoiseTextStyles.sideMenu
                      .copyWith(fontWeight: FontWeight.w600)
                  : WhiteNoiseTextStyles.sideMenu,
            ),
          ],
        ),
      ),
    );
  }
}
