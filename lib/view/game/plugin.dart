import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/resource/responsive.dart';
import 'package:portfolio/view/game/pluginMobile.dart';
import 'package:portfolio/view/game/pluginTab.dart';
import 'package:portfolio/view/game/pluginWeb.dart';

class Plugin extends StatefulWidget {
  const Plugin({Key? key}) : super(key: key);

  @override
  State<Plugin> createState() => _WorkState();
}

class _WorkState extends State<Plugin> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      tabView: PluginTab(),
      webView: PluginWeb(),
      mobileView: PluginMobile(),
    );
  }
}
