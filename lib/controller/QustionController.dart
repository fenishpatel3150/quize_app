import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:quize_app/utils/QustionList.dart';

class QuizController extends GetxController {
  RxInt questionIndex = 0.obs;
  RxInt total = 0.obs;

  void question() {
    if (questionIndex.value < questions.length - 1) {
      questionIndex.value++;
    } else {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.white,
        titleText: Text(
          'Quize Completed',
          style: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        messageText: Text(
          'Total : ${total.value}',
          style: TextStyle(color: Colors.red),
        ),
      ));
    }
  }

  void screenUpdate() {
    if (questionIndex.value > 0) {
      questionIndex.value--;
    }
  }

  void checkAnswer(String selectedOption) {
    if (selectedOption == questions[questionIndex.value]['answer']) {
      total.value++;
    }
    question();
  }
}
