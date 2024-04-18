import 'package:dartz/dartz.dart';
import 'package:levado/features/home/data/models/Wishlist_model.dart';
import '../../../../../../Core/error/faliure.dart';
abstract class WishlistRepo {
  Future<Either<Failure, WishlistModel>> wishlistRepo(
      String productId,

      );
}
