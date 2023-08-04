class ResponseOb {
  dynamic data;
  MsgState? message;
  ErrState? errState;
  PageLoad? pageLoad;

  ResponseOb({this.data, this.message, this.errState, this.pageLoad});
}

enum MsgState {
  data,
  loading,
  error,
}

enum ErrState {
  userErr,
  tooMay,
  serverError,
  internetError,
}

enum PageLoad{
  first,
  nextPage,
  noMore,
}
