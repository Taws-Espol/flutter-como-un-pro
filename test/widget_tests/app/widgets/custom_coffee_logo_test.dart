import 'package:flutter/material.dart';
import 'package:flutter_como_un_pro/app/widgets/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../base_tests.dart';

void main() {
  group('Custom Coffee Logo Widget Test', () {
    testWidgets(
      "It should render the CustomCoffeeLogo widget",
      (WidgetTester tester) async {
        const CustomCoffeeLogo coffeeLogo = CustomCoffeeLogo(
          beverageCategoryName: 'Caramel',
        );
        await tester.pumpWidget(BaseTest.testApp(coffeeLogo));

        final Finder imageFinder = find.byKey(const Key('coffee_logo'));

        expect(imageFinder, findsOneWidget);
      },
    );

    testWidgets(
      "It should have a semantic label",
      (WidgetTester tester) async {
        const CustomCoffeeLogo coffeeLogo = CustomCoffeeLogo(
          beverageCategoryName: 'Caramel',
        );
        await tester.pumpWidget(BaseTest.testApp(coffeeLogo));

        final Finder imageFinder = find.byKey(const Key('coffee_logo'));

        // final SizedBox imageContainer =
        //     imageFinder.first.evaluate().single.widget as SizedBox;

        final Image image = imageFinder.first.evaluate().single.widget as Image;

        expect(image.semanticLabel, 'Caramel coffee');
      },
    );
  });
}
