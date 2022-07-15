// req.query({
// 	"limit": "24",
// 	"start": "0"
// });

// req.headers({
// 	"X-RapidAPI-Key": "b6b80d7282mshce02c7f57f3a4eap1831d1jsnbe810a84585e",
// 	"X-RapidAPI-Host": "yummly2.p.rapidapi.com",
// 	"useQueryString": true
// });

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipe_app/widgets/recipe.dart';


class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https("yummly2.p.rapidapi.com", '/feeds/list', {
      "limit": "24",
	    "start": "0", "tag": "list.recipe.popular"},
      );

     final response = await http.get(uri, headers: {
      // 	"X-RapidAPI-Key": "b6b80d7282mshce02c7f57f3a4eap1831d1jsnbe810a84585e",
// 	"X-RapidAPI-Host": "yummly2.p.rapidapi.com",
// 	"useQueryString": true
     }); 

     Map data = jsonDecode(response.body);
     List _temp = [];

     for (var i in data['feed']) {
      _temp.add(i['context']['details']);
     }

     return Recipe.recipesFromSnapShot(_temp);
  }
}