<h2 align = "center"> 1. Quize App </h2>

To create a quiz app in Flutter using GetX for state management and organizing lists in a utils file without using model classes, follow these steps:

### Step 1: Setup your Flutter project
Create a new Flutter project and add the necessary dependencies in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.5
```

### Step 2: Organize the project structure
Create the following folders in your `lib` directory to keep your project organized:
- `controllers`
- `views`
- `utils`

### Step 3: Create a utils file with your quiz questions
Create a `utils/questions.dart` file and add your quiz questions as a list of maps:

```dart
// utils/questions.dart
final List<Map<String, dynamic>> questions = [
  {
    'question': 'What is the capital of France?',
    'options': ['Berlin', 'Madrid', 'Paris', 'Lisbon'],
    'answer': 'Paris'
  },
  {
    'question': 'Who wrote "Hamlet"?',
    'options': ['Charles Dickens', 'William Shakespeare', 'Leo Tolstoy', 'Mark Twain'],
    'answer': 'William Shakespeare'
  },
  // Add more questions here
];
```

### Step 4: Create a controller
Create a `controllers/quiz_controller.dart` file and add the following code to manage your quiz logic:

```dart
// controllers/quiz_controller.dart
import 'package:get/get.dart';
import '../utils/questions.dart';

class QuizController extends GetxController {
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

}
```

### Step 5: Create the UI
Create a `views/quiz_page.dart` file for your quiz page UI:

```dart
// views/quiz_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/quiz_controller.dart';
import '../utils/questions.dart';

class QuizPage extends StatelessWidget {
  final QuizController quizController = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Obx(() {
        if (quizController.isQuizCompleted.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Quiz Completed!'),
                Text('Your Score: ${quizController.score.value}'),
                ElevatedButton(
                  onPressed: () {
                    quizController.resetQuiz();
                  },
                  child: Text('Restart Quiz'),
                ),
              ],
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  questions[quizController.currentQuestionIndex.value]['question'],
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                ...questions[quizController.currentQuestionIndex.value]['options']
                    .map<Widget>((option) => ElevatedButton(
                          onPressed: () {
                            quizController.checkAnswer(option);
                          },
                          child: Text(option),
                        ))
                    .toList(),
              ],
            ),
          );
        }
      }),
    );
  }
}
```

### Step 6: Update the main file
Update your `main.dart` file to include the QuizPage:

```dart
// main.dart
import 'package:flutter/material.dart';
import 'views/quiz_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: QuizPage(),
    );
  }
}
```



<details> 
  <summary><h2>📸Photo / 📽Video</h2></summary>
  <p>
    <table align="center">
      <tr>
        <td><img src="https://github.com/user-attachments/assets/0278a9f6-9e2f-4305-b99b-4269d8042d1d" alt="Image 2" width="300" height="auto"></td>
        <td><img src="https://github.com/user-attachments/assets/2ab9114c-dd1c-462c-9618-2a68ca26cb35" alt="Image 2" width="300" height="auto"></td>
        <td><video src="" width="420" height="315"></video>
        </td>
      </tr>
    </table>   
  </p>
</details>



https://github.com/user-attachments/assets/754560a3-2029-4a8e-a6f5-55148d4cba3e

