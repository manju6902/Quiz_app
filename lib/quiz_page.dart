import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/quiz_controller.dart';
import 'package:cool_alert/cool_alert.dart';

QuizController qc = QuizController();

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

List<Icon> scoreTracker = [];

class _QuizPageState extends State<QuizPage> {
  void checkAnswer(bool userAnswer) {
    setState(() {
      if (qc.isEnded() == true) {
        CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            title: 'quiz complete!!',
            confirmBtnText: 'Play Again?',
            cancelBtnText: 'quit',
            showCancelBtn: true,
            onCancelBtnTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
              qc.reset();
            },
            onConfirmBtnTap: () {
              Navigator.pop(context);
            });
        scoreTracker = [];
        qc.reset();
      } else {
        if (userAnswer == qc.getCorrectAnswer) {
          scoreTracker.add(const Icon(
            Icons.check_circle,
            color: Colors.green,
          ));
        } else {
          scoreTracker.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        qc.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F1147),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Quizzle'),
      ),
      // ignore: prefer_const_constructors
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    qc.getQuestion,
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF37E9BB),
                  ),
                  onPressed: () {
                    setState(() {
                      checkAnswer(true);
                    });
                  },
                  child: Text(
                    'TRUE',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    checkAnswer(false);
                  },
                  child: Text(
                    "FALSE",
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: scoreTracker,
              )
            ],
          ),
        ),
      ),
    );
  }
}
