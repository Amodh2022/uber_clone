class ResponseHandle<T> {
  late String statusCode;
  late T data;
  late String statusMessage;

  ResponseHandle.withoutdata(this.statusCode, this.statusMessage);
  ResponseHandle(this.statusCode, this.data, this.statusMessage);

}