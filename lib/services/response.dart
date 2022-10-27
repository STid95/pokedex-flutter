import 'api.dart';

class NotHandledResponse extends ErrorResponse {}

class BadRequestResponse extends ErrorResponse {}

class UnAuthorizedResponse extends ErrorResponse {}

class NotFoundResponse extends ErrorResponse {}

class NoInternetResponse extends ErrorResponse {}

class TimeoutResponse extends ErrorResponse {}

class GeneralErrorResponse extends ErrorResponse {}
