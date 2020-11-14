import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:trz/core/dependency_injection/dependency_injection.dart';
import 'package:trz/core/network/dio_client.dart';
import 'package:trz/models/person.dart';

class PeopleService {
  final _client = inject<DioClient>();

  // POST /api/people.json
  // Register a new survivor
  Future<Person> registerSurvivor(Person person, String items) async {
    try {
      final response = await _client.post(
        '/people',
        data: FormData.fromMap(
          {
            'person': person.toJson(),
            'items': items,
          },
        ),
      );

      return Person.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  // GET /api/people/{id}.json
  // Fetch a single survivor
  Future<Person> getSurvivor(String id) async {
    try {
      final response = await _client.get(
        '/people/$id',
      );

      return Person.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // GET /api/people
  // Fetches all survivors
  Future<List<Person>> getAllSurvivors() async {
    try {
      final response = await _client.get(
        '/people',
      );

      return (response as List<dynamic>).map((e) => Person.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  // PATCH /api/people/{id}.json
  // Update an existing survivor
  Future<Person> updateSurvivor(Person person) async {
    try {
      final response = await _client.patch(
        '/people/${person.id}',
        queryParameters: {'person': jsonEncode(person)},
      );

      return Person.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // POST /api/people/{id}/report_infection.json
  // Register if someone suspects someone else is infected
  Future<int> reportInfection(String infectedId) async {
    try {
      final response = await _client.post(
        '/people/$infectedId/report_infection',
        queryParameters: {
          'infected': infectedId,
          // TODO
          // 'id': GetIt.instance<LogInfo>,
        },
      );

      return (response);
    } catch (e) {
      rethrow;
    }
  }
}
