import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:portfolio/model/experienceModel.dart';
import 'package:portfolio/resource/styles.dart';
import 'package:url_launcher/url_launcher.dart';

enum ScreenType { mobile, tab, web }

class AppClass {
  static final AppClass _mAppClass = AppClass._internal();
  static BuildContext? lastContext;
  ScrollController controller = ScrollController();

  /* URL */
  static final resumeDownloadURL =
      '''https://jeeva-portfolio.s3.amazonaws.com/JEEVANANDHAM's+Resume.pdf''';

  static final gitSafeC19 = '''https://github.com/jeeva-HBK/SafeC19''';

  // static final gitHermarts = '''https://github.com/jeeva-HBK/SafeC19''';
  static final gitWtIot = '''https://github.com/jeeva-HBK/AutoChem''';
  static final gitAutoStabilizer =
      '''https://github.com/jeeva-HBK/AutoStabilizer''';
  static final gitPAT = '''https://github.com/jeeva-HBK/PAT''';

  // static final gitAVM = '''https://github.com/jeeva-HBK/SafeC19''';

  List<WorkModel> projectList = [
    WorkModel(
      projectTitle: "Selfe Loans",
      projectContent:
          "Hassle-free gateway to a spectrum of financial solutions. Seamlessly access a range of loan offerings, including home loans, loan against property, car loans (both new and used), commercial vehicle finance (new and used), merchant overdraft, gold loans, microfinance and personal loan. This platform ensures a convenient and straightforward process, making it easier than ever to address your financial needs with precision and efficiency. Experience the simplicity of securing the right loan for you with SelfeLoans.",
      tech1: "Flutter",
      tech2: "Android,IOS",
      tech3: "Web (DPL)",
    ),
    WorkModel(
      projectTitle: "Source.One Buyer App",
      projectContent:
          "Developed a one-stop polymer procurement solution allowing users to select location, polymer type, process technique, and explore offers.",
      tech1: "Flutter",
      tech2: "Android,IOS",
      tech3: "Firebase",
    ),
    WorkModel(
      projectTitle: "Letstow - User",
      projectContent:
          '''Letstow is a company of Road side assistance by mobile application.''',
      tech1: "Flutter",
      tech2: "Android,IOS",
    ),
    WorkModel(
      projectTitle: "Letstow - Provider",
      projectContent:
          '''Letstow is a company of Road side assistance by mobile application.''',
      tech1: "Flutter",
      tech2: "Android,IOS",
    ),
    WorkModel(
      projectTitle: "Viola Black",
      projectContent:
          '''ViolaBlack is a banking application in uk. ViolaBlack seem keen to emphasize the multi-currency uses of the account, offering the capability of making card payments abroad without fees.''',
      tech1: "Flutter",
      tech2: "Android,IOS",
      tech3: "Firebse",
    ),
    WorkModel(
      projectTitle: "CviewSurvey",
      projectContent:
          '''CViewSurvey is a SaaS-based Web & Mobile application that provides digital transformation to traditional paper surveys.''',
      tech1: "Flutter",
      tech2: "Android,IOS",
    ),
    WorkModel(
      projectTitle: "Viola business",
      projectContent:
          '''Viola Business is a trading style of Violacard Limited. The Viola Business The current account is operated by Viola Money (Europe) Limited, which is Authorized by the Financial Conduct''',
      tech1: "Flutter",
      tech2: "Android,IOS",
    ),
  ];
  List<PluginModel> pluginList = [
    PluginModel(
      projectTitle: "custom_field_package:",
      projectContent:
          "Custom Field Package is a Flutter package for creating customizable text input fields with advanced validation and styling.",
      link: 'https://pub.dev/packages/custom_field_package',
    ),
    PluginModel(
      projectTitle: "dropify:",
      projectContent:
          "Dropify is a highly customizable dropdown menu button for Flutter, designed to handle both static and dynamic data. It features various design styles such as Material, Fancy, Cappuccino, and Simple, and comes with advanced features like searchability, multi-selection, and customizable item labels.",
      link: 'https://pub.dev/packages/dropify',
    ),
    PluginModel(
      projectTitle: "size_configurator:",
      projectContent:
          '''A Flutter package for responsive UI design. It provides utilities to scale UI components like text, images, and containers based on screen size and orientation.''',
      link: 'https://pub.dev/packages/size_configurator',
    ),
  ];
  factory AppClass() {
    return _mAppClass;
  }

  AppClass._internal();

  getMqWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  getMqHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  showSnackBar(String msg, {BuildContext? context}) {
    ScaffoldMessenger.of(
      context ?? lastContext!,
    ).showSnackBar(SnackBar(content: Text(msg)));
  }

  ScreenType getScreenType(BuildContext context) {
    double scrWidth = getMqWidth(context);
    if (scrWidth > 915) {
      return ScreenType.web;
    } else if (scrWidth < 650) {
      return ScreenType.mobile;
    }
    return ScreenType.tab;
  }

  downloadResume(context) async {
    await launchUrl(Uri.parse(AppClass.resumeDownloadURL));
  }

  alertDialog(context, title, msg) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(title, style: TxtStyle().boldWhite(context)),
            content: Text(msg),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () => Navigator.pop(context),
                child: Text('Okay'),
              ),
            ],
          ),
    );
  }

  Future<bool> sendEmail(name, contact, msg) async {
    var url = Uri.https('hbk-portfolio-mailer.web.app', '/sendMail');
    var response = await post(
      url,
      body: {"name": name, "contactInfo": contact, "message": msg},
    ).timeout(Duration(seconds: 10));
    print(response.body);
    return response.statusCode == 200;
  }
}
