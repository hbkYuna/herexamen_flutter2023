class Recipe {
  final String id;
  final String name;
  final String category;
  final String area;
  final String instructions;
  final String thumbnailUrl;

  Recipe({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.thumbnailUrl,
  });

// Constructor om Recipe instantie te maken van API data. 
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['idMeal'] as String,
      name: json['strMeal'] as String,
      category: json['strCategory'] as String,
      area: json['strArea'] as String,
      instructions: json['strInstructions'] as String,
      thumbnailUrl: json['strMealThumb'] as String,
    );
  }




// Haalt ingredienten met maten uit de API en voegt ze samen in een lijst
// Kijk naar voobeeld van een recipe om te begrijpen waarom dit nodig is. 
// www.themealdb.com/api/json/v1/1/random.php (ga naar deze link in browser)

// Verwijderd wegens issues!! 

/*static List<String> _extractIngredients(Map<String, dynamic> json) {
  final ingredients = <String>[];
  for (int i = 1; i <= 20; i++) {
    final ingredientKey = 'strIngredient$i';
    final measureKey = 'strMeasure$i';
    final ingredient = json[ingredientKey] as String?;
    final measure = json[measureKey] as String?;
    if (ingredient != null && ingredient.isNotEmpty) {
      final ingredientWithMeasure =
          measure != null && measure.isNotEmpty ? '$measure $ingredient' : ingredient;
      ingredients.add(ingredientWithMeasure);
    } else {
      break;
    }
  }
  return ingredients;
}
*/


// Aangezien er geen korte berschrijving van een recipe is maken we dit even zelf. 
  String getDescription() {
    return "This meal originates from $area and goes by the name of $name";
  }
}
