import 'package:cloud_firestore/cloud_firestore.dart';

class MyModel {
  final String id;
  final String title;
  final String category;
  final double amount;
  final DateTime date;
  final String? icon;

  MyModel({
    required this.id,
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
    this.icon,
  });

  factory MyModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return MyModel(
      id: doc.id,
      title: data['title'] ?? '',
      category: data['category'] ?? '',
      amount: (data['amount'] ?? 0).toDouble(),
      date: (data['date'] as Timestamp).toDate(),
      icon: data['icon'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'category': category,
      'amount': amount,
      'date': Timestamp.fromDate(date),
      'icon': icon,
    };
  }
}