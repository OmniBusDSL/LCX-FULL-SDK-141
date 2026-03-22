import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


# POST method not supported for dart
Future<Map<String, dynamic>> check_order_status(order_id) async {
  // GET /api/trading/order/{order_id}
  final url = Uri.parse('https://exchange-api.lcx.com/api/trading/order/{order_id}');
  final headers = {'Content-Type': 'application/json'};
  final apiKey = String.fromEnvironment('LCX_API_KEY');
  final apiSecret = String.fromEnvironment('LCX_API_SECRET');
  final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final message = timestamp + 'GET' + '/api/trading/order/{order_id}';

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

# POST method not supported for dart
Future<Map<String, dynamic>> complete_order_flow(currency) async {
  // GET /api/account/balance
  final url = Uri.parse('https://exchange-api.lcx.com/api/account/balance');
  final headers = {'Content-Type': 'application/json'};
  final apiKey = String.fromEnvironment('LCX_API_KEY');
  final apiSecret = String.fromEnvironment('LCX_API_SECRET');
  final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final message = timestamp + 'GET' + '/api/account/balance';

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



# POST method not supported for dart
# None method not supported for dart
# None method not supported for dart
# None method not supported for dart
# None method not supported for dart
# None method not supported for dart
# None method not supported for dart
# None method not supported for dart
# None method not supported for dart
# None method not supported for dart
# None method not supported for dart
