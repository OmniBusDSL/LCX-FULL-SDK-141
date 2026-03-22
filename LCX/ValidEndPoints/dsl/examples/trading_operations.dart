import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


# POST method not supported for dart
# POST method not supported for dart
# POST method not supported for dart
# PUT method not supported for dart
# PUT method not supported for dart
# PUT method not supported for dart
# DELETE method not supported for dart
# DELETE method not supported for dart
Future<Map<String, dynamic>> get_all_open_orders(offset) async {
  // GET /api/open
  final url = Uri.parse('https://exchange-api.lcx.com/api/open');
  final headers = {'Content-Type': 'application/json'};
  final apiKey = String.fromEnvironment('LCX_API_KEY');
  final apiSecret = String.fromEnvironment('LCX_API_SECRET');
  final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final message = timestamp + 'GET' + '/api/open';

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

Future<Map<String, dynamic>> get_open_orders_for_pair(offset, pair) async {
  // GET /api/open
  final url = Uri.parse('https://exchange-api.lcx.com/api/open');
  final headers = {'Content-Type': 'application/json'};
  final apiKey = String.fromEnvironment('LCX_API_KEY');
  final apiSecret = String.fromEnvironment('LCX_API_SECRET');
  final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final message = timestamp + 'GET' + '/api/open';

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

Future<Map<String, dynamic>> get_open_orders_with_date_range(offset, pair, fromDate, toDate) async {
  // GET /api/open
  final url = Uri.parse('https://exchange-api.lcx.com/api/open');
  final headers = {'Content-Type': 'application/json'};
  final apiKey = String.fromEnvironment('LCX_API_KEY');
  final apiSecret = String.fromEnvironment('LCX_API_SECRET');
  final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final message = timestamp + 'GET' + '/api/open';

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

Future<Map<String, dynamic>> get_single_order_status(orderId) async {
  // GET /api/order
  final url = Uri.parse('https://exchange-api.lcx.com/api/order');
  final headers = {'Content-Type': 'application/json'};
  final apiKey = String.fromEnvironment('LCX_API_KEY');
  final apiSecret = String.fromEnvironment('LCX_API_SECRET');
  final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final message = timestamp + 'GET' + '/api/order';

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

Future<Map<String, dynamic>> get_complete_order_history(offset) async {
  // GET /api/orderHistory
  final url = Uri.parse('https://exchange-api.lcx.com/api/orderHistory');
  final headers = {'Content-Type': 'application/json'};
  final apiKey = String.fromEnvironment('LCX_API_KEY');
  final apiSecret = String.fromEnvironment('LCX_API_SECRET');
  final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final message = timestamp + 'GET' + '/api/orderHistory';

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

Future<Map<String, dynamic>> get_order_history_for_pair(offset, pair) async {
  // GET /api/orderHistory
  final url = Uri.parse('https://exchange-api.lcx.com/api/orderHistory');
  final headers = {'Content-Type': 'application/json'};
  final apiKey = String.fromEnvironment('LCX_API_KEY');
  final apiSecret = String.fromEnvironment('LCX_API_SECRET');
  final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final message = timestamp + 'GET' + '/api/orderHistory';

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

Future<Map<String, dynamic>> get_order_history_by_status(offset, orderStatus) async {
  // GET /api/orderHistory
  final url = Uri.parse('https://exchange-api.lcx.com/api/orderHistory');
  final headers = {'Content-Type': 'application/json'};
  final apiKey = String.fromEnvironment('LCX_API_KEY');
  final apiSecret = String.fromEnvironment('LCX_API_SECRET');
  final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final message = timestamp + 'GET' + '/api/orderHistory';

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

Future<Map<String, dynamic>> get_order_history_by_type(offset, orderType) async {
  // GET /api/orderHistory
  final url = Uri.parse('https://exchange-api.lcx.com/api/orderHistory');
  final headers = {'Content-Type': 'application/json'};
  final apiKey = String.fromEnvironment('LCX_API_KEY');
  final apiSecret = String.fromEnvironment('LCX_API_SECRET');
  final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final message = timestamp + 'GET' + '/api/orderHistory';

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

Future<Map<String, dynamic>> get_filtered_order_history(offset, pair, fromDate, toDate, side, orderStatus, orderType) async {
  // GET /api/orderHistory
  final url = Uri.parse('https://exchange-api.lcx.com/api/orderHistory');
  final headers = {'Content-Type': 'application/json'};
  final apiKey = String.fromEnvironment('LCX_API_KEY');
  final apiSecret = String.fromEnvironment('LCX_API_SECRET');
  final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final message = timestamp + 'GET' + '/api/orderHistory';

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

Future<Map<String, dynamic>> get_all_trade_history(offset) async {
  // GET /api/uHistory
  final url = Uri.parse('https://exchange-api.lcx.com/api/uHistory');
  final headers = {'Content-Type': 'application/json'};
  final apiKey = String.fromEnvironment('LCX_API_KEY');
  final apiSecret = String.fromEnvironment('LCX_API_SECRET');
  final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final message = timestamp + 'GET' + '/api/uHistory';

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

Future<Map<String, dynamic>> get_trade_history_for_pair(offset, pair) async {
  // GET /api/uHistory
  final url = Uri.parse('https://exchange-api.lcx.com/api/uHistory');
  final headers = {'Content-Type': 'application/json'};
  final apiKey = String.fromEnvironment('LCX_API_KEY');
  final apiSecret = String.fromEnvironment('LCX_API_SECRET');
  final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final message = timestamp + 'GET' + '/api/uHistory';

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

Future<Map<String, dynamic>> get_trade_history_by_date_range(offset, pair, fromDate, toDate) async {
  // GET /api/uHistory
  final url = Uri.parse('https://exchange-api.lcx.com/api/uHistory');
  final headers = {'Content-Type': 'application/json'};
  final apiKey = String.fromEnvironment('LCX_API_KEY');
  final apiSecret = String.fromEnvironment('LCX_API_SECRET');
  final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final message = timestamp + 'GET' + '/api/uHistory';

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

Future<Map<String, dynamic>> simple_buy_workflow(order_result) async {
  // GET /api/order
  final url = Uri.parse('https://exchange-api.lcx.com/api/order');
  final headers = {'Content-Type': 'application/json'};
  final apiKey = String.fromEnvironment('LCX_API_KEY');
  final apiSecret = String.fromEnvironment('LCX_API_SECRET');
  final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final message = timestamp + 'GET' + '/api/order';

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

# Workflow: SimpleBuyWorkflow (sequence)

# None method not supported for dart
# PUT method not supported for dart
Future<Map<String, dynamic>> get_history(0, BTC/USDC) async {
  // GET /api/orderHistory
  final url = Uri.parse('https://exchange-api.lcx.com/api/orderHistory');
  final headers = {'Content-Type': 'application/json'};
  final apiKey = String.fromEnvironment('LCX_API_KEY');
  final apiSecret = String.fromEnvironment('LCX_API_SECRET');
  final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final message = timestamp + 'GET' + '/api/orderHistory';

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

Future<Map<String, dynamic>> get_trades(0, BTC/USDC) async {
  // GET /api/uHistory
  final url = Uri.parse('https://exchange-api.lcx.com/api/uHistory');
  final headers = {'Content-Type': 'application/json'};
  final apiKey = String.fromEnvironment('LCX_API_KEY');
  final apiSecret = String.fromEnvironment('LCX_API_SECRET');
  final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final message = timestamp + 'GET' + '/api/uHistory';

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
# DELETE method not supported for dart
Future<Map<String, dynamic>> confirm_cancelled(first_order_from_list) async {
  // GET /api/order
  final url = Uri.parse('https://exchange-api.lcx.com/api/order');
  final headers = {'Content-Type': 'application/json'};
  final apiKey = String.fromEnvironment('LCX_API_KEY');
  final apiSecret = String.fromEnvironment('LCX_API_SECRET');
  final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final message = timestamp + 'GET' + '/api/order';

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
