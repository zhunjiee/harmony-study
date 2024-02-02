import http from '@ohos.net.http';
import ResponseResult from './ResponseResult';
import { HttpConstant, ContentType } from './HttpConstant';

export function httpRequestGet(url: string): Promise<ResponseResult> {
  let httpRequest = http.createHttp();
  let response = httpRequest.request(url, {
    method: http.RequestMethod.GET,
    readTimeout: HttpConstant.HTTP_READ_TIMEOUT,
    header: {
      'Content-Type': ContentType.JSON
    },
    connectTimeout: HttpConstant.HTTP_READ_TIMEOUT,
    extraData: {}
  });
  let serverData: ResponseResult = new ResponseResult();

  return response.then((value: http.HttpResponse) => {
    if (value.responseCode === HttpConstant.HTTP_CODE_200) {
      let result = `${value.result}`;
      let resultJson: ResponseResult = JSON.parse(result);
      if (resultJson.code === HttpConstant.SERVER_CODE_SUCCESS) {
        serverData.data = resultJson.data;
      }
      serverData.code = resultJson.code;
      serverData.msg = resultJson.msg;
    } else {
      serverData.msg = `${$r('app.string.refresh_fail_text')}&${value.responseCode}`;
    }
    return serverData;
  }).catch(() => {
    serverData.msg = $r('app.string.http_error_message');
    return serverData;
  });
}