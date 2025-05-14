import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/controller/generalController.dart';
import 'package:portfolio/resource/appClass.dart';

import '../../resource/colors.dart';
import '../../resource/common_function.dart';

class PluginWeb extends ConsumerStatefulWidget {
  const PluginWeb({Key? key}) : super(key: key);

  @override
  ConsumerState<PluginWeb> createState() => _WorkWebState();
}

class _WorkWebState extends ConsumerState<PluginWeb> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                  fontSize: 25,
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
              fontSize: 15,
              fontFamily: 'sfmono',
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 30.0, bottom: 70.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              double screenWidth = constraints.maxWidth;
              double tileHeight = screenWidth > 800 ? 140 : 200;
              return StaggeredGrid.count(
                // crossAxisCount: 1,
                // mainAxisSpacing: 1,
                // crossAxisSpacing: 4,
                crossAxisCount: 1, // Adjust columns on screen size
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,

                children: List.generate(3, (index) {
                  return StaggeredGridTile.fit(
                    crossAxisCellCount: 1,
                    child: Container(
                      height: tileHeight,
                      width: double.infinity,
                      child: getTile(index: index),
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ],
    );
  }

  getTile({required int index}) {
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
              child: Card(
                color: AppColors().cardColor,
                elevation: 10,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 0.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
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
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                AppClass().pluginList[index].projectContent
                                    .toString(),
                                style: GoogleFonts.roboto(
                                  color: AppColors().textLight,
                                  letterSpacing: 1,
                                  height: 1.5,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),

                          InkWell(
                            onTap:
                                () => launchUrlFun(
                                  AppClass().pluginList[index].link.toString(),
                                ),

                            child: SvgPicture.asset(
                              'assets/svg/externalLink.svg',
                              width: 22,
                              height: 22,
                              color:
                                  isHovered
                                      ? AppColors().neonColor
                                      : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
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
