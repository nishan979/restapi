import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'character_model.dart';

class CharacterController extends GetxController {
  var characters = <Character>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchCharacters();
    super.onInit();
  }

  void fetchCharacters() async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse('https://rickandmortyapi.com/api/character'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        var results = jsonData['results'] as List;
        characters.value = results.map((e) => Character.fromJson(e)).toList();
      } else {
        Get.snackbar("Error", "Failed to load characters");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
