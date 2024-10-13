import 'package:flutter/material.dart';

import '../../../../../../app.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;
  final VoidCallback? onTapFavorite;
  final bool isFavorite;
  final bool showFavoriteIcon;
  const ProductItem({
    super.key,
    required this.product,
    this.onTap,
    this.onTapFavorite,
    this.showFavoriteIcon = true,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(
        AppRoutes.details,
        arguments: product,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Image.network(
              product.image,
              height: 120,
              width: 120,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.title,
                      style: context.textTheme.bodyMedium,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.star,
                          color: context.colorScheme.tertiary,
                          size: 22,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '${product.rating.rate} (${product.rating.count} reviews)',
                            style: context.textTheme.titleSmall?.copyWith(
                              color: context.colorScheme.outline,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: showFavoriteIcon,
                          child: InkWell(
                            onTap: onTapFavorite,
                            borderRadius: BorderRadius.circular(16),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite
                                    ? AppColors.red
                                    : AppColors.black,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      product.price.toCurrency,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
