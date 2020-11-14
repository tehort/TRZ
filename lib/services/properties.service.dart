import 'dart:convert';
import 'package:trz/core/dependency_injection/dependency_injection.dart';
import 'package:trz/core/network/dio_client.dart';
import 'package:trz/models/consumer.dart';
import 'package:trz/models/person.dart';
import 'package:trz/models/property.dart';

class PropertiesService {
  final _client = inject<DioClient>();

  // POST /api/people/{person_id}/properties/trade_item.json
  // Make a trade transaction between survivors
  Future<Person> tradeItems(String survivorId, Consumer consumer) async {
    try {
      final response = await _client.post(
        '/people/$survivorId/properties/trade_item',
        queryParameters: {
          'person_id': survivorId,
          'consumer': jsonEncode(consumer),
        },
      );

      return Person.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // GET /api/people/{person_id}/properties.json
  // Fetches all items of the survivor
  Future<List<Property>> getSurvivorItems(String survivorId) async {
    try {
      final response = await _client.get(
        '/people/$survivorId/properties',
      );

      return (response as List<dynamic>)
          .map((e) => Property.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
