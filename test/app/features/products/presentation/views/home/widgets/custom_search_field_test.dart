import 'package:diletta_test/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomSearchField renders correctly and responds to input',
      (WidgetTester tester) async {
    String searchQuery = '';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomSearchField(
            onChanged: (value) {
              searchQuery = value;
            },
            labelText: 'Search products',
          ),
        ),
      ),
    );

    expect(find.byType(TextFormField), findsOneWidget);
    expect(find.text('Search products'), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'Test Search');
    expect(searchQuery, 'Test Search');
  });

  testWidgets('CustomSearchField uses controller if provided',
      (WidgetTester tester) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomSearchField(
            controller: controller,
            labelText: 'Search products',
          ),
        ),
      ),
    );

    controller.text = 'Controlled Search';
    await tester.pump();

    expect(find.text('Controlled Search'), findsOneWidget);
  });

  testWidgets('CustomSearchField unfocuses on tap outside',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: const [
              CustomSearchField(),
              Text('Outside widget'),
            ],
          ),
        ),
      ),
    );

    final textField = find.byType(TextFormField);
    final outsideWidget = find.text('Outside widget');

    await tester.tap(textField);
    await tester.pump();

    expect(FocusScope.of(tester.element(textField)).hasFocus, true);

    await tester.tap(outsideWidget);
    await tester.pump();

    expect(FocusScope.of(tester.element(textField)).hasFocus, false);
  });
}
