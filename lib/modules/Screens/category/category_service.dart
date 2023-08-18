import 'package:beezar/models/category_model.dart';
import 'package:http/http.dart' as http ;
import '../../../config/server_config.dart';


class CategoryService{
   Future<List<CategoryModels>> getCategory()async{
    var response =  await http.get(Uri.parse(ServerConfig.DNS + ServerConfig.category));
      if (response.statusCode == 200){
        var jsonData = response.body;
        return CategoryModelsFromJson(jsonData);
      }else {
         return throw Exception('Error to load category');
      }
   }
}