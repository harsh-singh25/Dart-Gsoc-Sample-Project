import 'dart:ffi' as ffi;
import './generated_bindings.dart';

class UrlRequestCallbackClass {
  final dynamic cronetEngine;
  final dynamic libObject;

  UrlRequestCallbackClass({
    required this.cronetEngine,
    required this.libObject,
  });

  //1. ON REDIRECT RECEIVED
  void onRedirectReceived(
    ffi.Pointer<Cronet_UrlRequestCallback> self,
    ffi.Pointer<Cronet_UrlRequest> request,
    ffi.Pointer<Cronet_UrlResponseInfo> info,
    ffi.Pointer<ffi.Int8> new_location_url,
  ) {
    print('ON REDIRECT RECEIVED');
    libObject.Cronet_UrlRequestCallback_OnRedirectReceived(
      self,
      request,
      info,
      new_location_url,
    );
  }

  //2.ON RESPONSE STARTED
  void onResponseStarted(
      ffi.Pointer<Cronet_UrlRequestCallback> self,
      ffi.Pointer<Cronet_UrlRequest> request,
      ffi.Pointer<Cronet_UrlResponseInfo> info) {
    print('ON RESPONSE STARTED');
    libObject.Cronet_UrlRequestCallback_OnResponseStarted(self, request, info);
  }

  // 3.ON READ COMPLETED
  void onReadCompleted(
    ffi.Pointer<Cronet_UrlRequestCallback> self,
    ffi.Pointer<Cronet_UrlRequest> request,
    ffi.Pointer<Cronet_UrlResponseInfo> info,
    ffi.Pointer<Cronet_Buffer> buffer,
  ) {
    libObject.Cronet_UrlRequestCallback_OnReadCompleted(
        self, request, info, buffer);
  }

  //4.ON READ SUCCEDEED
  void onSucceded(
    ffi.Pointer<Cronet_UrlRequestCallback> self,
    ffi.Pointer<Cronet_UrlRequest> request,
    ffi.Pointer<Cronet_UrlResponseInfo> info,
  ) {
    libObject.Cronet_UrlRequestCallback_OnSucceeded(
      self,
      request,
      info,
    );
  }

  










}
