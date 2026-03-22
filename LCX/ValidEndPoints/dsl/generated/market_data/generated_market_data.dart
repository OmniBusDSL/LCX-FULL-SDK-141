import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


Future<Map<String, dynamic>> fetch_all_tickers() async {
  // GET /api/tickers
  final url = Uri.parse('https://exchange-api.lcx.com/api/tickers');
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

Future<Map<String, dynamic>> get_ticker_for_pair(pair) async {
  // GET /api/ticker
  final url = Uri.parse('https://exchange-api.lcx.com/api/ticker');
  final headers = {'Content-Type': 'application/json'};

  try {
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);

    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    rethrow;
  }
}

Future<Map<String, dynamic>> fetch_all_pairs() async {
  // GET /api/pairs
  final url = Uri.parse('https://exchange-api.lcx.com/api/pairs');
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

Future<Map<String, dynamic>> get_pair_info(pair_symbol) async {
  // GET /api/pair/BTC/USDC
  final url = Uri.parse('https://exchange-api.lcx.com/api/pair/BTC/USDC');
  final headers = {'Content-Type': 'application/json'};

  try {
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);

    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    rethrow;
  }
}

Future<Map<String, dynamic>> get_order_book(pair) async {
  // GET /api/book
  final url = Uri.parse('https://exchange-api.lcx.com/api/book');
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

Future<Map<String, dynamic>> get_recent_trades(pair, offset) async {
  // GET /api/trades
  final url = Uri.parse('https://exchange-api.lcx.com/api/trades');
  final headers = {'Content-Type': 'application/json'};

  try {
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);

    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    rethrow;
  }
}

Future<Map<String, dynamic>> get_candle_data(pair, resolution, from_ts, to_ts) async {
  // GET /v1/market/kline
  final url = Uri.parse('https://api-kline.lcx.com/v1/market/kline');
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

Future<Map<String, dynamic>> market_overview() async {
  // GET /api/book
  final url = Uri.parse('https://exchange-api.lcx.com/api/book');
  final headers = {'Content-Type': 'application/json'};

  try {
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {

    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    rethrow;
  }
}

Future<Map<String, dynamic>> get_trades() async {
  // GET /api/trades
  final url = Uri.parse('https://exchange-api.lcx.com/api/trades');
  final headers = {'Content-Type': 'application/json'};

  try {
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {

    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    rethrow;
  }
}

# None method not supported for dart
