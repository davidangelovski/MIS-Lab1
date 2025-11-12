import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/details", arguments: exam);
        },
        child: Card(
      color: exam.isPast() ? Colors.grey.shade200 : Colors.lightBlue.shade50,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(
          exam.isPast() ? Icons.check_circle_outline : Icons.schedule,
          color: exam.isPast() ? Colors.green : Colors.blueAccent,
        ),
        title: Text(exam.subjectName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_month, size: 16),
                const SizedBox(width: 4),
                Expanded(child:Text("${exam.getFormattedDate()} - ${exam.getFormattedTime()}"),),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16),
                const SizedBox(width: 4),
                Text(exam.rooms.join(", ")),
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    )
    );
  }
}
