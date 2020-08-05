import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe/domain/repository/myrecipes_repository.dart';
import 'package:food_recipe/domain/usecases/my_recipe_usecases/remove_recipe.dart';
import 'package:mockito/mockito.dart';

class MockMyRecipesRepository extends Mock implements MyRecipesRepository {}

main() {
  RemoveRecipe usecase;
  MockMyRecipesRepository repository;

  setUp(() {
    repository = MockMyRecipesRepository();
    usecase = RemoveRecipe(repository: repository);
  });

  final id1 = '3214';
  final id2 = '2ada';

  test('return if remove successfully', () async {
    when(repository.removeRecipe(id1)).thenAnswer((_) async => true);
    when(repository.removeRecipe(id2)).thenAnswer((_) async => false);

    final result1 = await usecase(RemoveRecipeParams(id: id1));
    final result2 = await usecase(RemoveRecipeParams(id: id2));

    expect(result1, true);
    expect(result2, false);
  });
}
