import 'package:demo2/genderize/data/genderize_model.dart';
import 'package:dio/dio.dart';

class GenderizeRepository {
  final Dio dio = Dio();

  Future<GenderizeModel> getGenderProbability({required String name}) async {
    Response response = await dio.get(
      'https://api.genderize.io/?name=$name',
    );
    var result = GenderizeModel.fromJson(response.data);
    return result;
  }
}
