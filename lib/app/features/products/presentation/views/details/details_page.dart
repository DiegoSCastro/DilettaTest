import 'package:flutter/material.dart';

import '../../../../../app.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _$DetailsPageState();
}

class _$DetailsPageState extends State<DetailsPage> {
  late final Product _product;

  @override
  void didChangeDependencies() {
    _product = ModalRoute.of(context)!.settings.arguments! as Product;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 48,
                vertical: 16,
              ),
              child: Image.network(
                _product.image,
                width: context.screenWidth,
                height: 310,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _product.title,
                    style: context.textTheme.titleMedium,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: context.colorScheme.tertiary,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '${_product.rating.rate} (${_product.rating.count} reviews)',
                          style: context.textTheme.titleMedium
                              ?.copyWith(color: context.colorScheme.outline),
                        ),
                      ),
                      Text(
                        _product.price.toCurrency,
                        style: context.textTheme.titleLarge
                            ?.copyWith(color: context.colorScheme.secondary),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: Icon(Icons.sort),
                      ),
                      Expanded(
                        child: Text(
                          _product.category,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: Icon(Icons.menu),
                      ),
                      Expanded(
                        child: Text(
                          _product.description,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
