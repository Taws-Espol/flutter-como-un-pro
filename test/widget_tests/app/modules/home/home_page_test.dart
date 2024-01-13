import 'package:flutter/material.dart';
import 'package:flutter_como_un_pro/app/modules/modules.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../base_tests.dart';

void main() {
  group('Home Page Widget Test', () {
    testWidgets(
      "It should render",
      (WidgetTester tester) async {
        const HomePage homePage = HomePage();
        await tester.pumpWidget(BaseTest.testApp(homePage));

        final Finder homePageFinder = find.byType(HomePage);
        expect(homePageFinder, findsOneWidget);
      },
    );

    testWidgets(
      "It should a title",
      (WidgetTester tester) async {
        const HomePage homePage = HomePage();
        await tester.pumpWidget(BaseTest.testApp(homePage));

        final Finder appBarFinder = find.byType(AppBar);
        expect(appBarFinder, findsOneWidget);

        final AppBar appBar =
            appBarFinder.first.evaluate().single.widget as AppBar;

        final Text appBarTitle = appBar.title as Text;

        expect(appBarTitle.data, 'Caramel Coffee');
      },
    );

    testWidgets(
      "It should a bottom navigation bar",
      (WidgetTester tester) async {
        const HomePage homePage = HomePage();
        await tester.pumpWidget(BaseTest.testApp(homePage));

        final Finder bottomNavigationBarFinder =
            find.byType(BottomNavigationBar);
        expect(bottomNavigationBarFinder, findsOneWidget);

        final BottomNavigationBar bottomNavigationBar =
            bottomNavigationBarFinder.first.evaluate().single.widget
                as BottomNavigationBar;

        expect(bottomNavigationBar.items.length, 3);

        expect(bottomNavigationBar.currentIndex, 1);
      },
    );
  });
}
