import 'package:http/http.dart' as http;

Future<void> main() async {
  final response = await http.get(Uri.parse('https://exchange-api.lcx.com/api/auth/ws?x-access-key={value}&x-access-sign={value}&x-access-timestamp={value}'));
  print(response.body);
}
