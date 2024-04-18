import 'package:dio/dio.dart';

abstract class Failure {
final String errmessage;
const Failure(this.errmessage);
}
class ServerFailure extends Failure{
  ServerFailure(super.errmessage);

factory ServerFailure.fromDioError(DioError dioError){
  switch(dioError.type){


    case DioErrorType.connectionTimeout:
       return ServerFailure('Connection timeout with ApiServer');

    case DioErrorType.sendTimeout:
      return ServerFailure('Send timeout with ApiServer');

    case DioErrorType.receiveTimeout:
      return ServerFailure('Receive timeout with ApiServer');

    case DioErrorType.badResponse:
      return ServerFailure.fromResponse(
          dioError.response!.statusCode, dioError.response!.data);
    case DioErrorType.cancel:
      return ServerFailure('Request to ApiServer was canceld');

    case DioErrorType.connectionError:
      return ServerFailure('Connection Error with ApiServer');

    case DioErrorType.unknown:

      if (dioError.message!.contains('SocketException')) {
        return ServerFailure('No Internet Connection');
       }
      return ServerFailure('Unexpected Error, Please try again!');
    default:
      return ServerFailure('Opps There was an Error, Please try again');
  }
}

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      if (response != null && response['error'] != null){
        return ServerFailure(response['error']['message']) ;
      }else{
        return ServerFailure('Unknown error occurred, Please try again');
      }
     } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}


