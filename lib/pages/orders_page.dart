import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/order.dart';
import '../models/order_list.dart';
import '../widgets/app_drawer.dart';

class OrdersPage extends StatelessWidget {
  Future<void> _refreshOrders(BuildContext context) {
    return Provider.of<OrderList>(context, listen: false).loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meus Pedidos'),
        ),
        drawer: const AppDrawer(),
        body: RefreshIndicator(
          onRefresh: () => _refreshOrders(context),
          child: FutureBuilder(
            future: Provider.of<OrderList>(context, listen: false).loadOrders(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.error != null) {
                return const Center(
                  child: Text('Ocorreu um erro'),
                );
              } else {
                return Consumer<OrderList>(
                  builder: ((context, orders, child) => ListView.builder(
                        itemCount: orders.itemsCount,
                        itemBuilder: (ctx, i) =>
                            OrderWidget(order: orders.items[i]),
                      )),
                );
              }
            },
          ),
        )

        // body: RefreshIndicator(
        //   onRefresh: () => _refreshOrders(context),
        //   child: _isLoading
        //       ? const Center(child: CircularProgressIndicator())
        //       : ListView.builder(
        //           itemCount: orders.itemsCount,
        //           itemBuilder: (ctx, i) => OrderWidget(order: orders.items[i]),
        //         ),
        // ),
        );
  }
}
