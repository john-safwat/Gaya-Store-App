import 'package:ecommerce/Core/Base/BaseViewModel.dart';
import 'package:ecommerce/Domain/Models/Order/OrdersHistory.dart';
import 'package:ecommerce/Domain/UseCase/GetOrdersHistoryUseCase.dart';
import 'package:ecommerce/Presentation/UI/OrderHistory/OrderHistoryNavigator.dart';

class OrderHistoryViewModel extends BaseViewModel<OrderHistoryNavigator> {
  GetOrdersHistoryUseCase useCase ;
  OrderHistoryViewModel(this.useCase);

  List<OrdersHistory>? orders;
  String? errorMessage ;

  void getData()async{
    try{
      var response = await useCase.invoke(appConfigProvider!.token);
      orders = response;
      notifyListeners();
    }catch (e){
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  void onTryAgainPress(){
    getData();
  }

}