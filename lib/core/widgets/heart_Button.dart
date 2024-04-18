import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:levado/features/home/presentation/view_models/wishlist_cubit/wishlist_cubit.dart';

class HeartButton extends StatelessWidget {
  HeartButton({Key? key, this.isPressed = false, required this.id})
      : super(key: key);

  final int id;
  final bool isPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        bool _isPressed = false;

        if (state is WishlistSuccess) {
          _isPressed = state.wishlistModel.wishlist.any((item) => item == id);
        }

        return IconButton(
          icon: Icon(
            _isPressed ? Icons.favorite : Icons.favorite_border,
            color: _isPressed ? Colors.red : Colors.black,
          ),
          onPressed: () {
            BlocProvider.of<WishlistCubit>(context).wishlist(productId: "$id");
          },
        );
      },
    );
  }
}
