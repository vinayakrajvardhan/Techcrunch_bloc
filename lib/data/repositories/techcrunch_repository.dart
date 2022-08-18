import 'package:http/http.dart' as http;
import '../model/data.dart';

abstract class TechCrunchRepository {
  Future<List<TechcrunchData>> getproducts({required int pages});
}

class TechCrunchRepositoryImp extends TechCrunchRepository {
  static const FETCH_LIMIT_PAGE = 20;

  @override
  Future<List<TechcrunchData>> getproducts({required int pages}) async {
    var url =
        "https://techcrunch.com/wp-json/wp/v2/posts?${FETCH_LIMIT_PAGE}=20&page=${pages}&context=view";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<TechcrunchData> techcrunchData =
          techcrunchDataFromJson(response.body);
      return techcrunchData;
    } else {
      throw Exception('Failed');
    }
  }
}
