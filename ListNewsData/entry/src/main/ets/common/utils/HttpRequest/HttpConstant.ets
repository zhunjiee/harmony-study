export class HttpConstant {
  // 服务器地址
  static readonly Server: string = 'http://192.168.31.194:9588';
  static readonly HTTP_READ_TIMEOUT: number = 10000;
  static readonly HTTP_CODE_200: number = 200;
  static readonly SERVER_CODE_SUCCESS: string = 'success';
}

export const enum ContentType {
  JSON = 'application/json'
}