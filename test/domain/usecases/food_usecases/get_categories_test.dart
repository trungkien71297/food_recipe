import 'package:flutter_test/flutter_test.dart';
import 'package:jokes/domain/models/food_category.dart';
import 'package:jokes/domain/repository/food_repository.dart';
import 'package:jokes/domain/usecases/food_usecases/get_categories.dart';
import 'package:jokes/domain/usecases/usecase.dart';
import 'package:mockito/mockito.dart';

class MockFoodRepository extends Mock implements FoodRepository {}

main() {
  GetCategories usecase;
  MockFoodRepository repository;

  setUp(() {
    repository = MockFoodRepository();
    usecase = GetCategories(repository: repository);
  });

  final List<FoodCategory> list = [
    FoodCategory(
        id: 1,
        description:
            'Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.',
        name: 'Beef',
        thumb: "https://www.themealdb.com/images/category/beef.png"),
    FoodCategory(
        id: 2,
        description:
            'Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.',
        name: 'Chicken',
        thumb: "https://www.themealdb.com/images/category/beef.png"),
    FoodCategory(
        id: 3,
        description:
            'Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.',
        name: 'Dessert',
        thumb: "https://www.themealdb.com/images/category/beef.png"),
    FoodCategory(
        id: 4,
        description:
            'Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.',
        name: 'Lamb',
        thumb: "https://www.themealdb.com/images/category/beef.png"),
    FoodCategory(
        id: 5,
        description:
            'Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.',
        name: 'Miscellaneous',
        thumb: "https://www.themealdb.com/images/category/beef.png"),
    FoodCategory(
        id: 6,
        description:
            'Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.',
        name: 'Pasta',
        thumb: "https://www.themealdb.com/images/category/beef.png"),
  ];

  test('get list of categories', () async {
    when(repository.getCategories()).thenAnswer((_) async => list);
    final result = await usecase(NoParams());

    expect(result, list);
    verify(repository.getCategories());
  });
}
