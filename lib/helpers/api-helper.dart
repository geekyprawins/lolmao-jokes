import 'package:http/http.dart' as http;
class ApiHelper {
  Future getDadJoke() async {
    var url = "https://icanhazdadjoke.com/";
    http.Response response =
    (await http.get(Uri.parse(url), headers: {"Accept": "text/plain"}));
    String body = response.body;
    // var data = jsonDecode(body);
    return body;
  }
}
