import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_food/domain/products/products_model.dart';
import 'package:food_food/features/common/app_constants.dart';
import 'package:food_food/features/common/components/elevated_container.dart';
import 'package:food_food/features/common/components/ez_app_bar.dart';
import 'package:food_food/features/common/components/ez_scaffold.dart';
import 'package:food_food/features/dashboard/state/user_state.dart';

class OrderDetailsPage extends ConsumerWidget {
  const OrderDetailsPage({
    super.key,
    required this.productsModel,
  });

  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(appUserDataProvider);
    final textTheme = Theme.of(context).textTheme;
    return EzScaffold(
        body: ElevatedContainer(
            margin: defaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                /// welcome username + email
                Text(
                  "Welcome ${userData?.username ?? "N/A"}",
                  style: textTheme.headlineMedium,
                ),
                Text(
                  "Email : ${userData?.email ?? "N/A"}",
                  style: textTheme.bodyMedium,
                ),

                ElevatedContainer(
                    margin: defaultPadding,
                    child: Column(
                      children: [
                        Table(
                          children: [
                            TableRow(children: [
                              const TableCell(
                                child: Text("Product :"),
                              ),
                              TableCell(
                                child: Text(productsModel.productName),
                              )
                            ]),
                            TableRow(children: [
                              const TableCell(
                                child: Text("Quantity :"),
                              ),
                              TableCell(
                                child: Text(productsModel.selected.toString()),
                              )
                            ]),
                            const TableRow(children: [
                              TableCell(
                                child: Text("Status :"),
                              ),
                              TableCell(
                                child: Text("Out for Delivery"),
                              )
                            ]),
                          ],
                        ),
                      ],
                    ))

                /// product image
                /// name
                /// quantity
                /// progress
              ],
            )));
  }
}
