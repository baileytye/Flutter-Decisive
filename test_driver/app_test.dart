// Imports the Flutter Driver API.
import 'package:decisive/resources/strings.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Decisive App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final titleTextFinder = find.byValueKey('logo');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('logo present', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      expect(await driver.getText(titleTextFinder), MyStrings.appTitle);
    });
  });
}