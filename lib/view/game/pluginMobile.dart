import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/controller/generalController.dart';
import 'package:portfolio/resource/appClass.dart';

import '../../resource/colors.dart';
import '../../resource/common_function.dart';

class PluginMobile extends ConsumerStatefulWidget {
  const PluginMobile({Key? key}) : super(key: key);

  @override
  ConsumerState<PluginMobile> createState() => _WorkWebState();
}

class _WorkWebState extends ConsumerState<PluginMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppClass().getMqHeight(context) - 100,
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              text: "04.",
              style: TextStyle(
                color: AppColors().neonColor,
                fontSize: 20,
                fontFamily: 'sfmono',
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' Published packages',
                  style: GoogleFonts.roboto(
                    color: AppColors().textColor,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'View in Pub.dev',
              style: TextStyle(
                color: AppColors().neonColor,
                fontSize: AppClass().getMqWidth(context) * 0.035,
                fontFamily: 'sfmono',
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 30.0, bottom: 50.0),
              child: PageView(
                children: [
                  Tile(index: 0),
                  Tile(index: 1),
                  Tile(index: 2),
                  Tile(index: 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Tile({required int index}) {
    return InkWell(
      onHover: (bool) {
        if (bool) {
          ref.read(hoverProvider.notifier).state = "$index";
        } else {
          ref.read(hoverProvider.notifier).state = "";
        }
      },
      child: Consumer(
        builder: (context, ref, child) {
          String data = ref.watch(hoverProvider);
          bool isHovered = (data == "$index");
          return Container(
            margin: EdgeInsets.all(isHovered ? 0.0 : 4.0),
            child: Tooltip(
              message:
                  AppClass().pluginList[index].projectTitle.toString() +
                  "\n\n" +
                  AppClass().pluginList[index].projectContent.toString(),
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(AppClass().getMqWidth(context) * 0.1),
              waitDuration: Duration(seconds: 3),
              decoration: BoxDecoration(
                color: AppColors().primaryColor.withOpacity(0.9),
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
              textStyle: TextStyle(color: Colors.white24),
              preferBelow: true,
              verticalOffset: 20,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: AppColors().cardColor,
                  elevation: 10,
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap:
                                  () => launchUrlFun(
                                    AppClass().pluginList[index].link
                                        .toString(),
                                  ),
                              child: SvgPicture.asset(
                                'assets/svg/externalLink.svg',
                                width: 20,
                                height: 20,
                                color:
                                    isHovered
                                        ? AppColors().neonColor
                                        : Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            bottom: 8.0,
                          ),
                          child: Row(
                            children: [
                              Text(
                                AppClass().pluginList[index].projectTitle
                                    .toString(),
                                textAlign: TextAlign.left,
                                style: GoogleFonts.robotoSlab(
                                  color:
                                      isHovered
                                          ? AppColors().neonColor
                                          : Colors.white,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      AppClass().getMqWidth(context) * 0.06,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                              bottom: 8.0,
                            ),
                            child: Text(
                              AppClass().pluginList[index].projectContent
                                  .toString(),
                              style: GoogleFonts.roboto(
                                color: AppColors().textLight,
                                letterSpacing: 1,
                                height: 1.5,
                                fontSize: AppClass().getMqWidth(context) * 0.05,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
