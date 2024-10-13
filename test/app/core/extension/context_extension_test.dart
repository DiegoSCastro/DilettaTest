import 'package:diletta_test/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should return theme data from context',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            final theme = context.theme;
            expect(theme, isA<ThemeData>());
            return Container();
          },
        ),
      ),
    );
  });

  testWidgets('should return text theme from context',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            final textTheme = context.textTheme;
            expect(textTheme, isA<TextTheme>());
            return Container();
          },
        ),
      ),
    );
  });

  testWidgets('should return color scheme from context',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            final colorScheme = context.colorScheme;
            expect(colorScheme, isA<ColorScheme>());
            return Container();
          },
        ),
      ),
    );
  });

  testWidgets('should detect if light theme is used',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.light(),
        home: Builder(
          builder: (context) {
            final isLightTheme = context.isLightTheme;
            expect(isLightTheme, true);
            return Container();
          },
        ),
      ),
    );
  });

  testWidgets('should detect if dark theme is used',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.dark(),
        home: Builder(
          builder: (context) {
            final isLightTheme = context.isLightTheme;
            expect(isLightTheme, false);
            return Container();
          },
        ),
      ),
    );
  });

  testWidgets('should return screen width and height',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            final screenWidth = context.screenWidth;
            final screenHeight = context.screenHeight;
            expect(screenWidth, isNonZero);
            expect(screenHeight, isNonZero);
            return Container();
          },
        ),
      ),
    );
  });

  testWidgets('should navigate to another route when pushNamed is called',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/': (context) => const HomePage(),
          '/next': (context) => const NextPage(),
        },
      ),
    );

    await tester.tap(find.text('Go to Next Page'));
    await tester.pumpAndSettle();

    expect(find.text('Next Page'), findsOneWidget);
  });
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => context.pushNamed('/next'),
          child: const Text('Go to Next Page'),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => context.pop(),
          child: const Text('Back'),
        ),
      ),
    );
  }
}
