//
//  MySynHttpRequest2.m
//  SynHttpRequest
//
//  Created by 紫冬 on 13-7-27.
//  Copyright (c) 2013年 qsji. All rights reserved.
//

#import "MySynHttpRequest.h"

@implementation MySynHttpRequest

-(id)init
{
    self = [super init];
    if (self)
    {
        
    }
    
    return self;
}

//发送请求
-(void)sendRequest
{
    //第一步：创建一个请求地址NSURL对象
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    
    //第二步：创建一个ASIHTTPRequest请求对象，并设置url
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
    //第三步：设置发送方法get,post,put之一
    [request setRequestMethod:@"POST"];
    
    //第四步：设置缓存策略和客户端认证
    /*
    [request setCachePolicy:];
    [request setCacheStoragePolicy:];
    [request setClientCertificateIdentity:];
    [request setClientCertificates:];
     */
    
    //第四步：设置属性（属性是我们自定义的）和数据等等信息
    [request addRequestHeader:@"Cookie" value:@"cookies"];
    /*
     设置cookies，headers，和返回编码
    [request setRequestCookies:nil];
    [request setRequestHeaders:nil];
    [request setResponseEncoding:nil];
    */
    
    //设置相关的属性数据
    /*
    [request setValue:@"JSON" forKey:@"type"];
    [request setValue:@"query" forKey:@"action"];
     */
    
    //下面是设置要发送数据的相关函数：
    [request setPostBody:nil];
    [request setPostBodyFilePath:nil];
    [request setPostLength:0];
    
    //第五步：发送请求
    [request startSynchronous];              //由于我们发送的是同步请求，那么发送以后，线程会阻塞，等待返回数据，下面的代码就是保存接收到的数据，然后处理
    
    NSError *error = [request error];
    if (!error)
    {
        //我们请求获取的数据，可能是字符串，也可能是xml，也可能是json，这取决于我们所
        //请求的服务器返回的内容，比如上面的是http://www.baidu.com,那么返回的就是xml
        
        //第六步：接收数据
        NSString *mstr = [request responseString];
        /*
         或者是先获取返回的data，然后再将data转化为nsstring
        NSData *data = [request responseData];
        NSString *mstr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
         
         有时候，发现将data转化后String是Null，有可能是字符编码不兼容，于是去打印了下请求返回的一些参数，显示的是GB2312，所以我们就需要要用GB2312或者是兼容GB2312的字符编码
         NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
         NSString *mystr = [[NSString alloc] initWithData:_data encoding:enc];
         
         也可以获取data以后，解序列化
         如果请求的数据是字典的话，那么解序列化的结果就是字典：
         NSData *data  = [request responseData];
         
         NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data
         
         options:NSJSONReadingAllowFragments error:nil];
         */
        NSLog(@"mstr is: %@", mstr);
        
        //然后我们再解析xml文件
        //因为上面我们请求的是百度首页，所以我们获取的将会是xml的字符串输出形式
    }
}

//下面是子类ASIFormDataRequest的用法，和父类ASIHTTPRequest的使用相似，不同的就是设置value的方法名字不同，这里使用的是setPostValue
-(void)startRequest

{
    
    NSString *strURL = @"http://iosbook3/mynotes/webservice.php";
    
    NSURL *url = [NSURL URLWithString:strURL];
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    //设置发送的数据包
    [request setPostBody:nil];
    
    //设置
    [request setPostValue:@ "<你的iosbook1.com用户邮箱>" forKey:@"email"];           
    
    [request setPostValue:@"JSON" forKey:@"type"];
    
    [request setPostValue:@"query" forKey:@"action"];
    
    [request startSynchronous];
    
    NSLog(@"请求完成。。。。。。");
    
    NSError *error = [request error];
    
    if (!error) {
        
        //NSString *response = [request responseString];
        
        NSData *data  = [request responseData];
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data
                                 
                                                                options:NSJSONReadingAllowFragments error:nil];
        
        NSLog(@"dic is: %@", dic);
        
    }
    
}


@end
