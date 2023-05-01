import 'package:ecommerce/Data/Models/ProductsDTO.dart';
import 'package:ecommerce/Data/SQL/SQLDB.dart';
import 'package:ecommerce/Domain/Models/Prdouct.dart';
import 'package:ecommerce/Domain/Repository/Products_Prepository_Contract.dart';

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  SQLdb sqLdb ;
  ProductLocalDataSourceImpl(this.sqLdb);
  @override
  Future<String> insertData(Product product) async{
    var response = await sqLdb.insertData('''INSERT INTO `products` (`id`,`name`,`category`,`price`,`mainImage`,`brand`)
        VALUES ('${product.id}','${product.name}','${product.category}','${product.price}','${product.mainImage}','${product.brand}')''');
    return response;
  }

  @override
  Future<String> deleteData(int id) async{
    var response = await sqLdb.deleteData('DELETE FROM `products` WHERE `id` = $id;');
    return response;
  }

  @override
  Future<Product> readData() async{
    var response = await sqLdb.readData("select * from `products`");
    ProductsDTO productsDTO = ProductsDTO.fromJson(response);
    return productsDTO.toDomain();
  }

}