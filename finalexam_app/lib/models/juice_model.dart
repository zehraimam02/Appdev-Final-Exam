import 'package:cloud_firestore/cloud_firestore.dart';

class JuiceModel {
  final String id;
  final String name;
  final String portion;
  final num rating;
  final String ratingFrequency;
  final String description;
  final String deliveryTime;
  final num price;

  JuiceModel({
    required this.id,
    required this.name,
    required this.portion,
    required this.rating,
    required this.ratingFrequency,
    required this.description,
    required this.deliveryTime,
    required this.price,
  });

  factory JuiceModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return JuiceModel(
      id: doc.id,
      name: data['name'] ?? '',
      portion: data['portion'] ?? '',
      rating: (data['rating'] ?? 0),
      ratingFrequency: (data['rating_frequency']),
      description: data['description'],
      deliveryTime: data['delivery_time'],
      price: data['price'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'portion': portion,
      'rating': rating,
      'rating_frequency': ratingFrequency,
      'description': description,
      'delivery_time': deliveryTime,
      'price': price,
    };
  }
}

