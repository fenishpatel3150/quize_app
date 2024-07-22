import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quize_app/controller/QustionController.dart';
import '../../utils/QustionList.dart';

class HomeScreen extends StatelessWidget {
  final QuizController quizController = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
              quizController.screenUpdate();
          }, icon: Icon(Icons.repeat_one,color: Colors.white,))
        ],
        backgroundColor: Colors.red,
        title: Text('Quiz App', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.red,
      body: Obx(
        () {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  questions[quizController.questionIndex.value]['question'],
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              ...List.generate(
                questions[quizController.questionIndex.value]['options'].length, (index) =>
                  InkWell(
                  onTap: ()
                  {
                    quizController.checkAnswer(
                        questions[quizController.questionIndex.value]['options']
                            [index]);
                  },
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          questions[quizController.questionIndex.value]['options']
                              [index],
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
