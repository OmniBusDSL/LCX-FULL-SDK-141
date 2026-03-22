import 'package:http/http.dart' as http;

Future<void> main() async {
  final response = await http.get(Uri.parse('https://exchange-api.lcx.com/api/pairs'));
  print(response.body);
}
