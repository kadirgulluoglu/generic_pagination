import 'package:flutter/material.dart';
import 'package:generic_pagination/core/extensions/context_extension.dart';
import 'package:generic_pagination/features/product/model/product_model.dart';
import 'package:generic_pagination/features/product/viewmodel/product_viewmodel.dart';
import 'package:generic_pagination/product/component/card_shimmer.dart';
import 'package:provider/provider.dart';

/// Ürünlerin listelendiği sayfa.
class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_loadMoreProducts);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProductViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ürünler'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          gridDelegate: context.productDelegate,
          controller: _scrollController,
          itemCount: viewModel.count,
          itemBuilder: (context, index) {
            if (index >= viewModel.items.length) {
              return const CardShimmer(height: 300);
            } else {
              final product = viewModel.items[index];
              return CustomProductCard(product: product, index: index);
            }
          },
        ),
      ),
    );
  }

  void _loadMoreProducts() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      Provider.of<ProductViewModel>(context, listen: false).loadMoreItems();
    }
  }
}

class CustomProductCard extends StatelessWidget {
  final Product? product;
  final int index;
  const CustomProductCard({super.key, this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            "https://picsum.photos/id/${index * 2}/300/200",
            height: 200,
            width: 300,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                );
              }
            },
          ),
          SizedBox(height: context.lowValue),
          Text(
            product?.title ?? '',
            textAlign: TextAlign.center,
          ),
          Text("${product?.price} ₺"),
        ],
      ),
    );
  }
}
