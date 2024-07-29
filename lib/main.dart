import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/route_page.dart';
import 'package:flutter_web/screen/company/company_screen.dart';
import 'package:flutter_web/screen/portfolio/portfolio_detail/portfolio_detail_screen.dart';
import 'package:flutter_web/screen/portfolio/portfolio_screen.dart';
import 'package:flutter_web/screen/question/question_screen.dart';
import 'package:flutter_web/screen/recruit/recruit_screen.dart';
import 'package:flutter_web/util/custom_scroll_behavior.dart';
import 'package:flutter_web/util/my_color.dart';
import 'package:flutter_web/util/text_util.dart';
import 'package:flutter_web/widgets/custom_constraints.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final routerDelegate = BeamerDelegate(
    transitionDelegate: const NoAnimationTransitionDelegate(),
    // 화면이 전환될때 나오는 애니메이션
    beamBackTransitionDelegate: const NoAnimationTransitionDelegate(),
    initialPath: RoutePage.company,
    notFoundRedirectNamed: RoutePage.company,
    locationBuilder: RoutesLocationBuilder(routes: {
      RoutePage.company: (context, state, data) {
        return const BeamPage(
          key: ValueKey('company'),
          title: 'Company',
          child: CompanyScreen(),
        );
      },
      RoutePage.portfolio: (context, state, data) {
        return const BeamPage(
          key: ValueKey('portfolio'),
          title: 'Portfolio',
          child: PortfolioScreen(),
        );
      },
      RoutePage.recruit: (context, state, data) {
        return const BeamPage(
          key: ValueKey('recruit'),
          title: 'Recruit',
          child: RecruitScreen(),
        );
      },
      RoutePage.question: (context, state, data) {
        return const BeamPage(
          key: ValueKey('question'),
          title: 'Question',
          child: QuestionScreen(),
        );
      },
      RoutePage.portfolioDetail: (context, state, data) {
        return const BeamPage(
          key: ValueKey('portfolio_detail'),
          title: 'PortfolioDetailScreen',
          child: PortfolioDetailScreen(),
        );
      },
    }).call,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Homepage",
      debugShowCheckedModeBanner: false,
      scrollBehavior: CustomScrollBehavior(),
      builder: (context, child) {
        return CustomConstraints(
            backgroundColor: Colors.white, maxWidth: 1920, child: child!);
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple.shade600),
        useMaterial3: true,
        fontFamily: 'pretendard',
        textTheme: TextUtil.setTExtTheme(),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: WidgetStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(WidgetState.disabled)) return Colors.grey;
              return null;
            },
          ), backgroundColor: WidgetStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(WidgetState.disabled)) return Colors.grey;
              return MyColor.blue40;
            },
          )),
        ),
      ),
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher:
          BeamerBackButtonDispatcher(delegate: routerDelegate),
    );
  }
}
