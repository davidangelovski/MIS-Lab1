import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {

  const ExamDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final exam = ModalRoute.of(context)!.settings.arguments as Exam;

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subjectName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(exam.subjectName,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.calendar_month),
                    const SizedBox(width: 8),
                    Text("Датум: ${exam.getFormattedDate()}"),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.access_time),
                    const SizedBox(width: 8),
                    Text("Време: ${exam.getFormattedTime()}"),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_on),
                    const SizedBox(width: 8),
                    Expanded(child: Text("Простории: ${exam.rooms.join(", ")}")),
                  ],
                ),
                const Divider(height: 30),
                Row(
                  children: [
                    const Icon(Icons.hourglass_bottom),
                    const SizedBox(width: 8),
                    Text("До испитот има: ${exam.getTimeUntilExam()}"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
