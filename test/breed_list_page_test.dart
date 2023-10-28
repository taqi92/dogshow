import 'package:dog_show/controller/dogs_controller.dart';
import 'package:dog_show/model/breed_model.dart';
import 'package:dog_show/ui/breed_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

import 'mock_controller.dart';

void main() {

  testWidgets('BreedListPage should have a correct app bar title', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      GetMaterialApp(
        home: BreedListPage(),
      ),
    );

    // Wait for all pending timers and animations to complete
    await tester.pumpAndSettle();

    // Find the AppBar widget
    final appBar = find.byType(AppBar);
    final titleText = find.text('Breed List');

    // Verify the AppBar and its title
    expect(appBar, findsOneWidget);
    expect(titleText, findsOneWidget);
  });

  testWidgets('BreedListPage should display data from the API', (WidgetTester tester) async {
    // Create a mock repository
    final mockRepo = MockDogRepository();

    // Define the data you want to return from the API call
    final mockBreedList = BreedModel(message: {'affenpinscher': [], 'african': [], 'airedale': []}, status: '');

    // Mock the API call behavior
    //when(mockRepo.getBreedModel()).thenAnswer((_) => mockBreedList);

    // // Mock the API call behavior
    when(mockRepo.getBreedModel()).thenAnswer((realInvocation) {
      final Function callback = realInvocation.positionalArguments[0];
      callback(mockBreedList, null);
    });

    // Create the DogController with the mock repository
    final controller = DogController();

    // Build the widget with the DogController
    await tester.pumpWidget(
      GetMaterialApp(
        home: BreedListPage(),
      ),
    );

    // Wait for the widget to settle
    await tester.pumpAndSettle();

    // Verify that the BreedListPage is displaying the data from the API
    for (final breed in mockBreedList.message.keys) {
      expect(find.text(breed), findsOneWidget);
    }
  });


  /*testWidgets('Tapping on "Show Random" should navigate to PreviewImageScreen', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      GetMaterialApp(
        home: BreedListPage(),
      ),
    );

    // Find the "Show Random" chip and tap it
    final showRandomChip = find.text('Show Random');
    await tester.tap(showRandomChip);

    // Wait for navigation to complete
    await tester.pumpAndSettle();

    // Verify that we are on the PreviewImageScreen
    expect(find.byType(PreviewImageScreen), findsOneWidget);
  });

  testWidgets('Tapping on "Show List by breed" should navigate to BreedImageListPage', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      GetMaterialApp(
        home: BreedListPage(),
      ),
    );

    // Find the "Show List by breed" chip and tap it
    final showListByBreedChip = find.text('Show List by breed');
    await tester.tap(showListByBreedChip);

    // Wait for navigation to complete
    await tester.pumpAndSettle();

    // Verify that we are on the BreedImageListPage
    expect(find.byType(BreedImageListPage), findsOneWidget);
  });

  testWidgets('Tapping on "Show sub-breed list" should navigate to SubBreedListPage', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      GetMaterialApp(
        home: BreedListPage(),
      ),
    );

    // Find the "Show sub-breed list" chip and tap it
    final showSubBreedListChip = find.text('Show sub-breed list');
    await tester.tap(showSubBreedListChip);

    // Wait for navigation to complete
    await tester.pumpAndSettle();

    // Verify that we are on the SubBreedListPage
    expect(find.byType(SubBreedListPage), findsOneWidget);
  });*/
}
