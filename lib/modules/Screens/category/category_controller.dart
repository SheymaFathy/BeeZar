import 'package:beezar/models/category_model.dart';
import 'package:beezar/modules/Screens/category/category_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  CategoryService service = CategoryService();
  var CategoryList =<CategoryModels> [].obs;
  var isLoading = true.obs;

  @override
  void onInit(){
    super.onInit();
    getCategories();
  }
  void getCategories() async {
   var category = await service.getCategory();
    try{
      isLoading(true);
      if (category.isNotEmpty){
        CategoryList.addAll(category);
      }
    }finally{
      isLoading(false);
    }

  }
}
