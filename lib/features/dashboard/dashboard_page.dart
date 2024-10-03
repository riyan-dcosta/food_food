import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_food/data/authentication/app_auth.dart';
import 'package:food_food/data/users/app_users.dart';
import 'package:food_food/features/authentication/sign_in_page.dart';
import 'package:food_food/features/authentication/state/auth_state.dart';
import 'package:food_food/features/common/components/ez_app_bar.dart';
import 'package:food_food/features/common/components/ez_scaffold.dart';
import 'package:food_food/features/common/navigation/app_navigation.dart';
import 'package:food_food/features/order_detail/order_details_page.dart';
import 'package:food_food/features/products/products_page.dart';

import '../../domain/products/products_model.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  int selectedIndex = 0;
  List<Widget> pages = [
    ProductsPage(),

    OrderDetailsPage(productsModel: ProductsModel(
        productName: "Laptop",
        productUrl: "https://picsum.photos/id/4/100/70",
        maxAvailable: 2,
        selected: 10,
        isAvailable: true))
  ];

  updateSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  initState() {
    super.initState();

    /// fetch user
    WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) async {
        final userEmail = ref
            .watch(userCredentialsStateProvider)
            ?.user
            ?.email;
        if (userEmail != null) {
          final userData =
          await AppUsersImpl(ref: ref).fetchUser(email: userEmail);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return EzScaffold(
      appBar: EzAppBar(
        title: "Dasoboard Page",
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuthImpl(ref: ref).signOut();
                pushAndRemoveUntilCurrentPage(
                    context: context, newPage: SignInPage());
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body:pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: "Orders",
          ),
        ],
        currentIndex: selectedIndex,
        onTap: updateSelectedIndex,
      ),
    );
  }
}
