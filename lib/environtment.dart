import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String? get apiURL => dotenv.env['API_URL'];
}
