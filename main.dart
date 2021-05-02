import 'dart:ffi';
import 'dart:io';

import './generated_bindings.dart';
import './urlRequestCallback.dart';

// int main() {
//   //LOADING THE LIBRARY
//   final dynamic libObject =
//       NativeLibrary(DynamicLibrary.open('./Cronet/libcronet.91.0.4463.0.so'));

//   // CREATING ENGINE AND INITIALIZING ENGINE PARAMS
//   final dynamic cronetEngine =
//       libObject.Cronet_Engine_Create(); //LINE 928 types
//   final dynamic cronetEngineParams =
//       libObject.Cronet_EngineParams_Create(); //LINE 2263

//   //SETTING UP THE ENGINE PARAMS
//   libObject.Cronet_EngineParams_http_cache_max_size_set(
//       cronetEngineParams, 100 * 1024);
//   libObject.Cronet_EngineParams_enable_quic_set(cronetEngineParams, true);
//   libObject.Cronet_EngineParams_enable_http2_set(cronetEngineParams, true);

//   // BINDING ENGINE PARAMS TO ENGINE
//   libObject.Cronet_Engine_StartWithParams(cronetEngine, cronetEngineParams);

//   final dynamic urlRequestCallBack =
//       UrlRequestCallbackClass(cronetEngine: cronetEngine, libObject: libObject);

//   // STARTING THE REQUEST
//   //   dynamic urlRequest = libObject.Cronet_UrlRequest_Create();
//   //   libObject.Cronet_UrlRequest_InitWithParams(
//   //   urlRequest,
//   //   cronetEngine,
//   //   ffi.Pointer<ffi.Int8> url,
//   //   ffi.Pointer<Cronet_UrlRequestParams> params,
//   //   ffi.Pointer<Cronet_UrlRequestCallback> callback,
//   //   ffi.Pointer<Cronet_Executor> executor,
//   // );

//   // libObject.Cronet_UrlRequest_Start();

//   // dynamic server = await HttpServer.bind(
//   //   InternetAddress.loopbackIPv4,
//   //   4040,
//   // );
//   // print('Listening on localhost:${server.port}');

//   // await for (HttpRequest request in server) {
//   //   request.response.write('Hello, world!');
//   //   await request.response.close();
//   // }
//   return 0;
// }
//
Future main() async {
  //LOADING THE LIBRARY
  final dynamic libObject =
      NativeLibrary(DynamicLibrary.open('./Cronet/libcronet.91.0.4463.0.so'));

  // CREATING ENGINE AND INITIALIZING ENGINE PARAMS
  final dynamic cronetEngine =
      libObject.Cronet_Engine_Create(); //LINE 928 types
  final dynamic cronetEngineParams =
      libObject.Cronet_EngineParams_Create(); //LINE 2263

  //SETTING UP THE ENGINE PARAMS
  libObject.Cronet_EngineParams_http_cache_max_size_set(
      cronetEngineParams, 100 * 1024);
  libObject.Cronet_EngineParams_enable_quic_set(cronetEngineParams, true);
  libObject.Cronet_EngineParams_enable_http2_set(cronetEngineParams, true);

  // // BINDING ENGINE PARAMS TO ENGINE
  // libObject.Cronet_Engine_StartWithParams(cronetEngine, cronetEngineParams);

  final dynamic urlRequestCallBackClass =
      UrlRequestCallbackClass(cronetEngine: cronetEngine, libObject: libObject);

  dynamic server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    4040,
  );
  print('Listening on localhost:${server.port}');

  await for (HttpRequest request in server) {
    request.response.write('Hello,This is in response');
    await request.response.close();
  }

  return 0;
}
