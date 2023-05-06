import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Domain/Models/Order/OrdersHistory.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderCardWidget extends StatelessWidget {
  OrdersHistory ordersHistory;
  OrderCardWidget(this.ordersHistory);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: MyTheme.darkBlue,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${ordersHistory.total} EGP",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: MyTheme.lightBlue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Text(
                        ordersHistory.shippingState!,
                        style: const TextStyle(
                          color: MyTheme.lightBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          padding: const EdgeInsets.only(bottom: 50),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: MyTheme.lightBlue,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                // the order id amd date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "#${ordersHistory.id!}",
                      style: const TextStyle(
                          color: MyTheme.darkBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat('y MMM d  hh:mm a')
                          .format(DateTime.parse(ordersHistory.createdAt!)),
                      style: const TextStyle(
                        color: Color(0xFF97A1A3),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                // the title
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: const[
                      Text(
                        "Products",
                        style: TextStyle(
                          color: Color(0xFF97A1A3),
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
                // the products
                Column(
                  children: ordersHistory.products!.map((e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            e.productName!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: MyTheme.darkBlue.withOpacity(0.8),
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ),
                        const SizedBox(width: 50,),
                        Text(
                          "${e.quantity!} x",
                          style: TextStyle(
                              color: MyTheme.darkBlue.withOpacity(0.8),
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  )).toList(),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
