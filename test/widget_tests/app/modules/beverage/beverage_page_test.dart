import 'package:flutter/material.dart';
import 'package:flutter_como_un_pro/app/modules/modules.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:badges/badges.dart' as badges;

import '../../../../base_tests.dart';

void main() {
  group('Beverage Page Widget Test - beverageCategoryName: Frio ', () {
    const String beverageCategoryName = 'Frío';

    const BeveragePage beveragePage =
        BeveragePage(beverageCategoryName: beverageCategoryName);

    testWidgets(
      "It should render",
      (WidgetTester tester) async {
        await tester.pumpWidget(BaseTest.testApp(beveragePage));

        final Finder beveragePageFinder = find.byType(BeveragePage);
        expect(beveragePageFinder, findsOneWidget);
      },
    );

    testWidgets(
      "It should not have a bottom navigation bar",
      (WidgetTester tester) async {
        await tester.pumpWidget(BaseTest.testApp(beveragePage));

        final Finder listViewFinder = find.byType(ListView);

        expect(listViewFinder, findsOneWidget);

        final Finder productItemFinder =
            find.byKey(const Key('Frappuccino de Vainilla'));

        expect(productItemFinder, findsOneWidget);

        await tester.ensureVisible(productItemFinder);
        await tester.pumpAndSettle();

        await tester.fling(
          productItemFinder,
          const Offset(0.0, -1000.0),
          100,
        );

        await tester.pumpAndSettle();

        final Finder lastProductItemFinder =
            find.byKey(const Key('Caramel Latte'));

        expect(lastProductItemFinder, findsOneWidget);
      },
    );

    testWidgets(
      "It should increment the elements in the cart",
      (WidgetTester tester) async {
        await tester.pumpWidget(BaseTest.testApp(beveragePage));

        final Finder badgeFinder = find.byType(badges.Badge);

        expect(badgeFinder, findsOneWidget);

        final badges.Badge badgeBeforeTap =
            badgeFinder.first.evaluate().single.widget as badges.Badge;

        final Text textValueBeforeTap = badgeBeforeTap.badgeContent as Text;

        expect(textValueBeforeTap.data, '0');

        final Finder iconButtonFinder = find.byKey(const Key('item_1'));
        expect(iconButtonFinder, findsOneWidget);

        await tester.tap(iconButtonFinder);
        await tester.pumpAndSettle();
        await tester.tap(iconButtonFinder);
        await tester.pumpAndSettle();

        final badges.Badge badgeAfterTap =
            badgeFinder.first.evaluate().single.widget as badges.Badge;

        final Text textValueAfterTap = badgeAfterTap.badgeContent as Text;

        expect(textValueAfterTap.data, '2');
      },
    );
  });
}
