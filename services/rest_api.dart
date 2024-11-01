import 'package:http/http.dart' as http;

import '../utils/constants.dart';

class CallAPI {
  // Set header for login/register
  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  // Login User API
  loginAPI(data) async {
    return await http.post(Uri.parse('${baseURLAPI}'));
  }
}
