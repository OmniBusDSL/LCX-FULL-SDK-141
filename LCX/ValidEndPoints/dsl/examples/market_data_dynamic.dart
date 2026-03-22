import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


Future<Map<String, dynamic>> fetch_all_pairs_data(pair) async {
  // GET /api/ticker
  final url = Uri.parse('https://exchange-api.lcx.com/api/ticker');
  final headers = {'Content-Type': 'application/json'};

  try {
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(jsonEncode(data));
      return data;

    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    rethrow;
  }
}

# Workflow: FetchAllPairsData (sequence)

Future<Map<String, dynamic>> get_ethusdc_ticker(pair) async {
  // GET /api/ticker
  final url = Uri.parse('https://exchange-api.lcx.com/api/ticker');
  final headers = {'Content-Type': 'application/json'};

  try {
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(jsonEncode(data));
      return data;

    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    rethrow;
  }
}

Future<Map<String, dynamic>> get_lcxusdc_ticker(pair) async {
  // GET /api/ticker
  final url = Uri.parse('https://exchange-api.lcx.com/api/ticker');
  final headers = {'Content-Type': 'application/json'};

  try {
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(jsonEncode(data));
      return data;

    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    rethrow;
  }
}

