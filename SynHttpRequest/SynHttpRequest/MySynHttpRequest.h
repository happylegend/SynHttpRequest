//
//  MySynHttpRequest.h
//  SynHttpRequest
//
//  Created by 紫冬 on 13-7-27.
//  Copyright (c) 2013年 qsji. All rights reserved.
//

/*
 ASIHTTPRequest类库的简介和使用说明：
 
 使用iOS SDK中的HTTP网络请求API，相当的复杂，调用很繁琐，ASIHTTPRequest就是一个对CFNetwork API进行了封装，
 并且使用起来非常简单的一套API，用Objective-C编写，可以很好的应用在Mac OS X系统和iOS平台的应用程序中。
 ASIHTTPRequest适用于基本的HTTP请求，和基于REST的服务之间的交互。
 
 ASIHTTPRequest功能很强大，主要特色如下：
 
 l 通过简单的接口，即可完成向服务端提交数据和从服务端获取数据的工作
 l 下载的数据，可存储到内存中或直接存储到磁盘中
 l 能上传本地文件到服务端
 l 可以方便的访问和操作请求和返回的Http头信息
 l 可以获取到上传或下载的进度信息，为应用程序提供更好的体验
 l 支持上传或下载队列，并且可获取队列的进度信息
 l 支持基本、摘要和NTLM身份认证，在同一会话中授权凭证会自动维持，并且可以存储在Keychain（Mac和iOS操作系统的密码管理系统）中
 l 支持Cookie
 l 当应用（iOS 4+）在后台运行时，请求可以继续运行
 l 支持GZIP压缩数据
 l 内置的ASIDownloadCache类，可以缓存请求返回的数据，这样即使没有网络也可以返回已经缓存的数据结果
 l ASIWebPageRequest –可以下载完整的网页，包括包含的网页、样式表、脚本等资源文件，并显示在UIWebView /WebView中。任意大小的页面都可以无限期缓存，这样即使没有网络也可以离线浏览
 l 支持客户端证书
 l 支持通过代理发起Http请求
 l 支持带宽限制。在iOS平台，可以根据当前网络情况来自动决定是否限制带宽，例如当使用WWAN(GPRS/Edge/3G)网络时限制，而当使用WIFI时不做任何限制
 l 支持断点续传
 l 支持同步和异步请求
 
 使用ASIHTTPRequest类库的时候，我们需要引入的类库：
 CFNetwork.framework
 MobileCoreServiecs.framework
 SystemConfiguration.framework
 libz.1.2.5.dyllib(版本可能会变化)
 
 网络同步请求的一般步骤：
 第一：创建一个NSURL对象，也即是请求网址，网址必须加http://
 第二：创建讲一个ASIHTTPRequest对象，并设置url
 第三：添加头信息，设置cookies，缓存等，比如addRequestHeader:，setCachePolicy:
 第三：设置get，post,put方法  requestMethod：
 第四：设置要提交的时候所带的数据 setValue:，setPostBody:，setValue一般用来设置属性，setPostBody：用来设置数据域，当然也可以将属性和数据打包在一起，作为要发送（post）的body
 第五：调用startSynchronous方法，开始请求数据         
 第六：返回头信息，比如responseHeaders：返回的response的Headers       
 第七：判断是否返回错误[request error];
 第八：根据是否返回错误，看是否返回数据responseString,responseData这是一个方法，获得返回的结果

 
 */

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASIHTTPRequestConfig.h"
#import "ASIFormDataRequest.h"

@interface MySynHttpRequest : NSObject

-(void)sendRequest;

@end
