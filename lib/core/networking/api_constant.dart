class ApiConstant {
 static const String apiBaseUrl = "http://127.0.0.1:8000/api/";
 static const String login = "patient/auth/login";
 static const String signUp = "patient/auth/signup";
 static const String logout = "patient/auth/logout";
 static const String homeSlider ="settings/sliders";
 static const String specializationPopularDoctors = "settings/specialization_popular_doctors";
}

class ApiErrors {
 static const String badRequestError = 'badRequestError';
 static const String noContent = 'noContent';
 static const String forbiddenError = 'forbiddenError';
 static const String unauthorizedError = 'unauthorizedError';
 static const String notFoundError = 'notFoundError';
 static const String conflictError = 'conflictError';
 static const String internalServerError = 'internalServerError';
 static const String unknownError = 'unknownError';
 static const String timeoutError = 'timeoutError';
 static const String defaultError = 'defaultError';
 static const String cacheError = 'cacheError';
 static const String noInternetError = 'noInternetError';
 static const String loadingMessage = 'loadingMessage';
 static const String retryAgainMessage = 'retryAgainMessage';
 static const String ok = 'ok';
}