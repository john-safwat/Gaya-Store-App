import 'package:ecommerce/Data/Models/Products/ProductsDTO.dart';
import 'package:ecommerce/Data/SQL/SQLDB.dart';
import 'package:ecommerce/Domain/Models/Products/Prdouct.dart';
import 'package:ecommerce/Domain/Repository/Products_Prepository_Contract.dart';

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  SQLdb sqLdb ;
  ProductLocalDataSourceImpl(this.sqLdb);
  @override
  Future<String> insertData(Product product) async{
    var response = await sqLdb.insertData('''INSERT INTO `products` (`id`,`name`,`category`,`price`,`mainImage`,`brand` , `rating`)
        VALUES ("${product.id}","${product.name}","${product.category}","${product.price}","${product.mainImage}","${product.brand}","${product.rating}")''');
    return response;
  }

  @override
  Future<String> deleteData(int id) async{
    var response = await sqLdb.deleteData('DELETE FROM `products` WHERE `id` = $id;');
    return response;
  }

  @override
  Future<List<Product>?> readData() async{
    var response = await sqLdb.readData('SELECT * FROM products;');

    if (response != null){
      List<Product> products = [];

      response.forEach((v) {
        products.add(ProductsDTO.fromJson(v).toDomain());
      });

      return products;
    }else {
      return null;
    }
  }

}