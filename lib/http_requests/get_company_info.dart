import 'dart:convert';
import 'package:http/http.dart' as http;

class CompanyService {
  Future getCompanyInfo() async {
    final url = Uri.https('api.spacexdata.com', 'v4/company');
    final response = await http.get(url);
    final jsonData = jsonDecode(response.body);
    return [jsonData];
  }
}
