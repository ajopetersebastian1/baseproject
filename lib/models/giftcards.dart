class GiftvouchersModel {
  final String brandname;
  final String imagepath;
  final String voucherCode;
  final double discountRate;
  final String url;
  GiftvouchersModel(
      {required this.brandname,
      required this.url,
      required this.imagepath,
      required this.voucherCode,
      required this.discountRate});
}
