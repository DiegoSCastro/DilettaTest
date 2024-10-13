import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _$HomePageState();
}

class _$HomePageState extends State<HomePage> {
  final _cubit = injection<HomeCubit>();

  @override
  void initState() {
    super.initState();
    _cubit.fetchProducts();
  }

  void _showMessage({
    required String productName,
    bool remove = false,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsets.symmetric(vertical: 80, horizontal: 16),
        content: Text(
          '"$productName" ${remove ? 'removed from' : 'added to'} wishlist!',
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _cubit,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (_, state) => switch (state) {
            HomeSuccess(:final filteredProducts) => Scaffold(
                appBar: AppBar(
                  title: const Text('Products'),
                ),
                floatingActionButton: Visibility(
                  visible: state.wishlist.isNotEmpty,
                  child: FloatingActionButton.extended(
                    onPressed: () => context.pushNamed(AppRoutes.wishlist),
                    label: Text('My Wishlist'),
                  ),
                ),
                body: Column(
                  children: [
                    const SizedBox(height: 16),
                    CustomSearchField(
                      onChanged: _cubit.setSearchText,
                    ),
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, index) {
                          final product = filteredProducts[index];
                          return ProductItem(
                            product: product,
                            onTapFavorite: () {
                              _cubit.toggleWishlistItem(product);
                              _showMessage(
                                productName: product.title,
                                remove: _cubit.isFavorite(product.id),
                              );
                            },
                            isFavorite: _cubit.isFavorite(product.id),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 1,
                            color: AppColors.lighterGray,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            HomeError(:final message) => Center(
                child: Text('Erro: $message'),
              ),
            _ => const Center(child: CircularProgressIndicator()),
          },
        ),
      ),
    );
  }
}
