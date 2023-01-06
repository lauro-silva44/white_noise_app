import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
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
                      const AnimatedIconsSound()
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

class AnimatedIconsSound extends StatefulWidget {
  const AnimatedIconsSound({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedIconsSound> createState() => _AnimatedIconsSoundState();
}

class _AnimatedIconsSoundState extends State<AnimatedIconsSound>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
      ..forward()
      ..repeat(reverse: true);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('assets/images/mount.png'))),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Lottie.asset(
                    'assets/lottie/soundwave.json',
                    height: 24,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            child: Lottie.asset(
              'assets/lottie/soundwave.json',
              height: 34,
            ),
          )
        ],
      ),
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
