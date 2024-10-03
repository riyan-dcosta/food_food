import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_food/domain/products/products_model.dart';
import 'package:food_food/features/common/app_constants.dart';
import 'package:food_food/features/common/app_snackbar/app_snackbar.dart';
import 'package:food_food/features/common/components/elevated_container.dart';
import 'package:food_food/features/common/components/ez_scaffold.dart';
import 'package:food_food/features/products/components/product_counter_field.dart';

import 'components/product_image_comp.dart';

class ProductsPage extends ConsumerStatefulWidget {
  const ProductsPage({super.key});

  @override
  ConsumerState<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends ConsumerState<ProductsPage> {
  final scrollController = ScrollController();

  List<ProductsModel> products = [
    const ProductsModel(
        productName: "Laptop",
        productUrl: "https://picsum.photos/id/4/100/70",
        maxAvailable: 2,
        isAvailable: true,
        selected: 0),
    const ProductsModel(
        productName: "Book",
        productUrl: "https://picsum.photos/id/24/100/70",
        maxAvailable: 2,
        selected: 0,
        isAvailable: true),
    const ProductsModel(
        productName: "Grapes",
        productUrl: "https://picsum.photos/id/75/100/70",
        maxAvailable: 2,
        selected: 0,
        isAvailable: true),
  ];

  @override
  Widget build(BuildContext context) {
    return EzScaffold(
        body: ElevatedContainer(
      margin: defaultPadding,
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Products",
                style: Theme.of(context).textTheme.displaySmall,
              )),
          const SizedBox(height: 20),
          Scrollbar(
            controller: scrollController,
            thumbVisibility: true,
            trackVisibility: true,
            radius: const Radius.circular(12),
            thickness: 6,
            child: ListView.separated(
              shrinkWrap: true,
              controller: scrollController,
              itemBuilder: (context, index) => ListTile(
                leading: ProductImageComp(
                  networkUrl: products[index].productUrl,
                ),
                title: Text(products[index].productName),
                subtitle: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Text(products[index].isAvailable
                            ? "Add Items: "
                            : "Out of Stock for more than ${products[index].maxAvailable} item(s)"),
                      ),
                      ProductCounterField(
                        itemCount: 0,
                        availableItemCount: products[index].maxAvailable,
                        disableAddition:
                            products[index].isAvailable ? false : true,
                        quantity: (value) {
                          products[index] =
                              products[index].copyWith(selected: value);
                        },
                        maxItemsSelected: (value) {
                          setState(() {
                            products[index] =
                                products[index].copyWith(isAvailable: !value);
                          });
                          if (value) {
                            ShowToast(
                                    message:
                                        "${products[index].productName} Out of Stock",
                                    context: context)
                                .showError();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: products.length,
            ),
          ),
        ],
      ),
    ));
  }
}
