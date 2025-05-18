import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'character_controller.dart';

class CharacterScreen extends StatelessWidget {
  final CharacterController characterController = Get.put(CharacterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rick and Morty Characters')),
      body: Obx(() {
        if (characterController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: characterController.characters.length,
          itemBuilder: (context, index) {
            final character = characterController.characters[index];
            return Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(character.image),
                ),
                title: Text(character.name),
                subtitle: Text('Status: ${character.status}'),
              ),
            );
          },
        );
      }),
    );
  }
}
