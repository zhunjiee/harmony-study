export default class ResponseResult {
  code: string;
  msg: string | Resource;
  data: string | Object | ArrayBuffer;

  constructor() {
    this.code = '';
    this.msg = '';
    this.data = '';
  }
}