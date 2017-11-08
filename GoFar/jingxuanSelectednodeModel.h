//
//  jingxuanSelectednodeModel.h
//  GoFar
//
//  Created by 胡彭飞 on 16/4/1.
//  Copyright © 2016年 hpf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface jingxuanSelectednodeModel : NSObject
@property(nonatomic,copy) NSString *id;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *country;
@property(nonatomic,copy) NSString *province;
@property(nonatomic,copy) NSString *city;
@property(nonatomic,copy) NSString *query;
@property(nonatomic,copy) NSString *query_ws;
@property(nonatomic,copy) NSString *category;
@property(nonatomic,copy) NSString *address;
@property(nonatomic,copy) NSArray *images;
@property(nonatomic,copy) NSString *note;
@property(nonatomic,copy) NSString *image_index;
@property(nonatomic,copy) NSString *dianping;
@property(nonatomic,copy) NSString *favs;
@property(nonatomic,copy) NSString *adds;
@property(nonatomic,copy) NSString *rating;
//"nodes": [{
//    "id": 363784,
//    "name": "汉记面馆",
//    "name_en": "",
//    "name_py": "Han ji mian guan",
//    "country": "中国",
//    "country_en": "China",
//    "country_py": "Zhongguo",
//    "province": "广东",
//    "province_en": "Guangdong",
//    "province_py": "Guangdong",
//    "city": "广州",
//    "city_en": "Guangzhou",
//    "city_py": "Guangzhou",
//    "query": "中国 广州 汉记面馆  Han ji mian guan",
//    "query_ws": "中国 广州 汉记面馆  Han ji mian guan",
//    "category": "美食",
//    "address": "海珠区南华东路620号(海珠桥脚)",
//    "transport": "",
//    "opening": "",
//    "fee": "",
//    "duration": "",
//    "website": "",
//    "baike": "",
//    "dianping": "http://www.dianping.com/shop/2061034",
//    "rank": 0,
//    "star": null,
//    "status": 0,
//    "images": ["http://img.chufaba.me/routes/2016/03/24/nlm2dp59g0drjf8e.jpg"],
//    "location": {
//        "lat": 23.11064594,
//        "lon": 113.2685999
//    },
//    "tips": null,
//    "intro": null,
//    "img": null,
//    "rating": 0.0,
//    "note": "广州的老字号情结，比任何一个城市都显得格外深切。在海珠区南华东路有家老字号“汉记面馆”，煮面的灶台占据了大半个门口，几把排气扇没有美感地挂在大门上方，有着广州面家的传统模样。传统竹升面有嚼劲有韧度，云吞个头不大却肉料厚实。难得的是，即使已誉满羊城，价格依旧亲民，一碗竹升面+一碟油菜落肚，十元有找，三十年间跨过世纪，人事翻新，不变的是店家的本分公平。吃罢有着幼时老味道的猪肉捞面，８０年代的街头幸福感按捺不住地涌现上心头。",
//    "image_index": 0,
//    "favs": 3,
//    "faved": false,
//    "adds": 0
@end
