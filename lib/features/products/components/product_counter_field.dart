import 'package:flutter/material.dart';
import 'package:food_food/features/common/app_constants.dart';

class ProductCounterField extends StatefulWidget {
  const ProductCounterField(
      {super.key,
      required this.itemCount,
      required this.availableItemCount,
      this.maxItemsSelected,
      this.disableAddition = false,
      required this.quantity});

  final int itemCount;
  final int availableItemCount;
  final ValueChanged<bool>? maxItemsSelected;
  final ValueChanged<int> quantity;

  final bool disableAddition;

  @override
  State<ProductCounterField> createState() => _ProductCounterFieldState();
}

class _ProductCounterFieldState extends State<ProductCounterField> {
  int counter = 0;
  int maxItems = 0;

  @override
  void initState() {
    super.initState();
    counter = widget.itemCount;
    maxItems = widget.availableItemCount;
  }

  decrementCount() {
    if (counter == 0) return;

    setState(() {
      counter -= 1;
    });
    widget.quantity(counter);
    if (counter <= maxItems) {
      if (widget.maxItemsSelected != null) {
        widget.maxItemsSelected!(false);
      }
    }
  }

  incrementCount() {
    if (counter >= maxItems) {
      if (widget.maxItemsSelected != null) {
        widget.maxItemsSelected!(true);
      }
      return;
    }
    setState(() {
      counter++;
    });
    widget.quantity(counter);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(onPressed: decrementCount, icon: const Icon(Icons.remove)),
        Container(
            padding: defaultPadding.copyWith(top: 4, bottom: 4),
            // margin: defaultPadding,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Text(
              counter.toString(),
            )),
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              onPressed: incrementCount,
              icon: Icon(
                Icons.add,
                color: widget.disableAddition ? Colors.grey : null,
              ),
            ),
            Visibility(
              visible: widget.disableAddition,
              child: const Icon(Icons.block),
            ),
          ],
        ),
      ],
    );
  }
}
