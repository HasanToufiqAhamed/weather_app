class Response<T> {
  final int statusCode;
  final T? payload;

  bool get success => 200 <= statusCode && statusCode <= 299;

  const Response({
    required this.statusCode,
    required this.payload,
  });
}
