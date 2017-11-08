//
//  HPjingxuanItem.h
//  GoFar
//
//  Created by 胡彭飞 on 16/3/14.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPjingxuanItem : NSObject
//"id": 222,
//"title": "你有太多撩人面",
//"highlights": "细数土耳其不可多得的体验",
//"image": "http://img.chufaba.me/routes/2016/03/12/8n0dsitz8251sqrv.jpg!320",
//"url": "/themes/show/205391d65b8",
//"res_type": 2


//"res_type": 3,
//"id": 569853,
//"title": "行走在北欧以北 极光之下",
//"destinations": "斯德哥尔摩、阿比斯库",
//"background_image": "http://img.chufaba.me/usercover_2ae5376236c2c70abc569a73d8d1623e.jpg!320",
//"url": "/journals/ab4ba99fee39",
//"hot": 6,
//"user_id": 263997,
//"vip": true,
//"username": "花仁大侠",
//"avatar": "http://img.chufaba.me/useravatar_3A055AC4-4373-414A-B97B-A4D614B8732E.jpg",
//"user": null
@property(nonatomic,copy) NSString *ID;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *highlights;
@property(nonatomic,copy) NSString *image;
@property(nonatomic,copy) NSString *url;
@property(nonatomic,copy) NSString *res_type;


@property(nonatomic,copy) NSString *destinations;
@property(nonatomic,copy) NSString *background_image;
@property(nonatomic,copy) NSString *hot;
@property(nonatomic,copy) NSString *user_id;
@property(nonatomic,copy) NSString *username;
@property(nonatomic,copy) NSString *avatar;

@property(nonatomic,copy) NSString *subtitle;
@property(nonatomic,copy) NSString *image1;
@property(nonatomic,copy) NSString *name;
@end
