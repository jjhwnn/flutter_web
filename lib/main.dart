import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/route_page.dart';
import 'package:flutter_web/screen/company/company_screen.dart';
import 'package:flutter_web/screen/portfolio/portfolio_screen.dart';
import 'package:flutter_web/screen/question/question_screen.dart';
import 'package:flutter_web/screen/recruit/recruit_screen.dart';
import 'package:flutter_web/util/text_util.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final routerDelegate = BeamerDelegate(
      transitionDelegate: const NoAnimationTransitionDelegate(), // 화면이 전환될때 나오는 애니메이션
      beamBackTransitionDelegate: const NoAnimationTransitionDelegate(),
      initialPath: RoutePage.company,
      notFoundRedirectNamed: RoutePage.company,
      locationBuilder: RoutesLocationBuilder(
      routes: {
        RoutePage.company : (context, state, data) {
          return const BeamPage(
            key: ValueKey('company'),
            title: 'Company',
            child: CompanyScreen(),
          );
        },
        RoutePage.portfolio : (context, state, data) {
          return const BeamPage(
            key: ValueKey('portfolio'),
            title: 'Portfolio',
            child: PortfolioScreen(),
          );
        },
        RoutePage.recruit : (context, state, data) {
          return const BeamPage(
            key: ValueKey('recruit'),
            title: 'Recruit',
            child: RecruitScreen(),
          );
        },
        RoutePage.question : (context, state, data) {
          return const BeamPage(
            key: ValueKey('question'),
            title: 'Question',
            child: QuestionScreen(),
          );
        },
      }
    ).call,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Homepage",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple.shade600),
            useMaterial3: true,
            fontFamily: 'pretendard',
            textTheme: TextUtil.setTExtTheme()
      ),
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(delegate: routerDelegate),
    );
  }
}
