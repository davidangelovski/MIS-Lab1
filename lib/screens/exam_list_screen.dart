import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {
  const ExamListScreen({super.key});

  List<Exam> _generateExams() {
    return [
      Exam(subjectName: "Програмирање на Видео Игри", dateTime: DateTime(2025, 11, 10, 9, 0), rooms: ["215", "138"]),
      Exam(subjectName: "Алгоритми и Податочни Стурктури", dateTime: DateTime(2025, 11, 12, 12, 0), rooms: ["117"]),
      Exam(subjectName: "Бази на Податоци", dateTime: DateTime(2025, 11, 11, 12, 0), rooms: ["200АБ"]),
      Exam(subjectName: "Веројатност и Статистика", dateTime: DateTime(2025, 11, 13, 8, 0), rooms: ["Барака 2.2", "Барака 3.2"]),
      Exam(subjectName: "Оперативни Системи", dateTime: DateTime(2025, 11, 15, 11, 30), rooms: ["200В"]),
      Exam(subjectName: "Вештачка интелигенција", dateTime: DateTime(2025, 11, 17, 13, 0), rooms: ["200АБ"]),
      Exam(subjectName: "Компјутерски Мрежи и Безбедност", dateTime: DateTime(2025, 11, 20, 9, 0), rooms: ["215"]),
      Exam(subjectName: "Интегрирани Системи", dateTime: DateTime(2025, 11, 26, 14, 0), rooms: ["117"]),
      Exam(subjectName: "Мобилни Информациски Системи", dateTime: DateTime(2025, 12, 1, 9, 30), rooms: ["Lab 1"]),
      Exam(subjectName: "Објектно Ориентирано Програмирање", dateTime: DateTime(2026, 12, 3, 10, 0), rooms: ["200АБ", "200В"]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final exams = _generateExams();
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));


    return Scaffold(
      appBar: AppBar(
        title: const Text("Распоред за испити - 221090"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return ExamCard(exam: exam);
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.indigo.shade50,
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 8),
            Text(
              "Вкупно испити: ${exams.length}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
