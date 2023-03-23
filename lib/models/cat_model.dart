import 'package:expenser_app/ui/custom_widgets/db_helper.dart';

class CatModel {
  int? catId;
  String name;
  String imgPath;

  CatModel({this.catId, required this.name, required this.imgPath});

  factory CatModel.formMap(Map<String, dynamic> map) {
    return CatModel(
        catId: map[DBHelper.CAT_COLUM_ID],
        name: map[DBHelper.CAT_COLUM_NAME],
        imgPath: map[DBHelper.CAT_COULM_PATH]);
  }

  Map<String, dynamic> toMap() => {
    DBHelper.CAT_COLUM_NAME : name,
    DBHelper.CAT_COULM_PATH : imgPath,

  };
}
