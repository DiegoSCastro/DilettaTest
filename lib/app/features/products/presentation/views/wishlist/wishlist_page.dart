import 'package:diletta_test/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _$WishlistPageState();
}

class _$WishlistPageState extends State<WishlistPage> {
  final _cubit = injection<WishlistCubit>();

  @override
  void initState() {
    super.initState();
    _cubit.fetchWishlistProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wishlist'),
      ),
      body: BlocProvider(
        create: (context) => _cubit,
        child: BlocBuilder<WishlistCubit, WishlistState>(
          builder: (context, state) => switch (state) {
            WishlistSuccess(:final wishlist) => ListView.builder(
                itemCount: wishlist.length,
                itemBuilder: (context, index) {
                  final product = wishlist[index];
                  return ProductItem(
                    product: product,
                    showFavoriteIcon: false,
                  );
                },
              ),
            WishlistError(:final message) => Center(
                child: Text(message),
              ),
            _ => Center(
                child: CircularProgressIndicator(),
              )
          },
        ),
      ),
    );
  }
}
