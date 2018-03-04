SET NAMES UTF8;
DROP DATABASE IF EXISTS ecsc;
CREATE DATABASE ecsc CHARSET=UTF8;
USE ecsc;


/**商品家族表**/
CREATE TABLE laptop_brand(
  bid INT PRIMARY KEY AUTO_INCREMENT,
  bname VARCHAR(32),#品牌名
  fid int,/*1猫咪主粮2猫咪零食3猫咪保健*/
  pic varchar(32)
);
/**商品表**/
CREATE TABLE laptop(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  fid int,                    #1猫咪主粮2猫咪零食3猫咪保健
  vid int,/*1进口2国产3罐头湿粮4美味零食5健康驱虫6增强免疫*/
  bid int,                    #品牌
  series int,                 #系列号
  pid INT,                    #同系列下不同产品编号
  title VARCHAR(128),         #主标题
  subtitle VARCHAR(128),      #副标题
  market_price DECIMAL(10,2), #市场价
  price DECIMAL(10,2),        #E宠价
  gram int,                   #重量（克）
  discount DECIMAL(2,1),      #会员折扣
  publick_benefit int,        #1是
  promise VARCHAR(64),        #服务承诺
  spec VARCHAR(64),           #规格/型号
  element VARCHAR(32),        #主要成分
  content VARCHAR(32),        #成分含量
  target_age int,             #适用对象1幼猫 2成猫 3老猫 4全猫 5离乳及怀孕哺乳猫
  fomula VARCHAR(32),         #什么肉
  granular_size int,          #颗粒大小 1小颗粒，2标准颗粒，3大颗粒
  details VARCHAR(1024),      #产品详细说明
  sold_count INT,             #已售出的数量
  ratings_number BOOLEAN      #评论数量
);
/**商品图片**/
CREATE TABLE laptop_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  lid INT,                    #产品编号
  lg VARCHAR(128)             #大图片路径
);

/**用户信息**/
/*CREATE TABLE user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),

  avatar VARCHAR(128),        #头像图片路径
  user_name VARCHAR(32),      #用户名，如王小明
  gender INT                  #性别  0-女  1-男
);*/

/**收货地址信息**/
/*CREATE TABLE receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  tag VARCHAR(16),            #标签名

  is_default BOOLEAN          #是否为当前用户的默认收货地址
);*/

/**购物车条目**/
/*CREATE TABLE shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,      #用户编号
  lid INT,   #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);*/

/**用户订单**/
/*CREATE TABLE order(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,
  aid INT,
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT    #签收时间
)AUTO_INCREMENT=10000000;*/

/**用户订单**/
/*CREATE TABLE order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  oid INT,           #订单编号
  lid INT,         #产品编号
  count INT               #购买数量
);*/

/****首页轮播广告商品****/
CREATE TABLE index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128));

/****首页商品推荐****/
CREATE TABLE index_recommend(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  floor TINYINT,/*1:一楼 2：二楼 3：三楼*/
  kw varchar(64),
  remark varchar(64),
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128),/*有就跳转页面，没有就关键词搜索*/
  hot TINYINT,
  import TINYINT,/*进口*/
  domestic TINYINT,/*国产*/
  cover TINYINT,/*封面*/
  generalize TINYINT,/*推广*/
  icons TINYINT/*品牌推广LOGO*/
);
/*******************/
/******数据导入******/
/*******************/
/**商品主类别表**/
INSERT INTO laptop_brand VALUES
(NULL,"比瑞吉",1,'img/product/brand/68fff93eb92eab9079cab321aacebbac.jpg');
/**商品表**/
INSERT INTO laptop VALUES
(null,1,2,1,1,1,'比瑞吉 基础呵护系列 全价幼猫怀孕及哺乳猫粮 2kg','天然好消化 促进脑部发育 全面助成长',
'174.00','145.00','2000','8.8','0','14','2Kg',
'鲣鱼肉，鸡肉，大米','粗蛋白质31.5%，粗脂肪12%，粗纤维5%，钙1%，总磷0.8%，氯化钠1%，牛磺酸0.2%，水溶性氯化物0.3%',
'1','鸡肉 鱼肉','1',
'img/product/detail/2018-01-14_172911.png','5724','1428');
/**商品图片**/
INSERT INTO laptop_pic VALUES
(NULL,1,"img/product/detail/8582e47d3605f8de85deb744000618c4.jpg"),
(NULL,1,"img/product/detail/47166e7a09cf735ecd19d51cbf593da0.jpg"),
(NULL,1,"img/product/detail/caa199024d25838ebcc4b189fc3a62a6.jpg"),
(NULL,1,"img/product/detail/d6e389efa249c9eeb488e50adc934376.jpg"),
(NULL,1,"img/product/detail/2507f74de7811214929e4a565075a4ad.jpg");
/*(NULL, 1, "img/product/detail/57ad8846N64ac3c79.jpg","img/product/detail/57ad8846N64ac3c79.jpg","img/product/detail/57ad8846N64ac3c79.jpg"),
(NULL, 1, "img/product/detail/57b12a31N8f4f75a3.jpg","img/product/detail/57b12a31N8f4f75a3.jpg","img/product/detail/57b12a31N8f4f75a3.jpg"),
(NULL, 1, "img/product/detail/57ad359dNd4a6f130.jpg","img/product/detail/57ad359dNd4a6f130.jpg","img/product/detail/57ad359dNd4a6f130.jpg"),
(NULL, 1, "img/product/detail/57ad8846N64ac3c79.jpg","img/product/detail/57ad8846N64ac3c79.jpg","img/product/detail/57ad8846N64ac3c79.jpg"),
(NULL, 2, "img/product/detail/57b12a31N8f4f75a3.jpg","img/product/detail/57b12a31N8f4f75a3.jpg","img/product/detail/57b12a31N8f4f75a3.jpg"),
(NULL, 2, "img/product/detail/57ad359dNd4a6f130.jpg","img/product/detail/57ad359dNd4a6f130.jpg","img/product/detail/57ad359dNd4a6f130.jpg"),
(NULL, 2, "img/product/detail/57ad8846N64ac3c79.jpg","img/product/detail/57ad8846N64ac3c79.jpg","img/product/detail/57ad8846N64ac3c79.jpg"),
(NULL, 3, "img/product/detail/57b12a31N8f4f75a3.jpg","img/product/detail/57b12a31N8f4f75a3.jpg","img/product/detail/57b12a31N8f4f75a3.jpg"),
(NULL, 3, "img/product/detail/57ad359dNd4a6f130.jpg","img/product/detail/57ad359dNd4a6f130.jpg","img/product/detail/57ad359dNd4a6f130.jpg"),
(NULL, 3, "img/product/detail/57ad8846N64ac3c79.jpg","img/product/detail/57ad8846N64ac3c79.jpg","img/product/detail/57ad8846N64ac3c79.jpg"),
(NULL, 3, "img/product/detail/57b12a31N8f4f75a3.jpg","img/product/detail/57b12a31N8f4f75a3.jpg","img/product/detail/57b12a31N8f4f75a3.jpg"),
(NULL, 3, "img/product/detail/57ad359dNd4a6f130.jpg","img/product/detail/57ad359dNd4a6f130.jpg","img/product/detail/57ad359dNd4a6f130.jpg"),
(NULL, 3, "img/product/detail/57ad8846N64ac3c79.jpg","img/product/detail/57ad8846N64ac3c79.jpg","img/product/detail/57ad8846N64ac3c79.jpg"),
(NULL, 4, "img/product/detail/57b12a31N8f4f75a3.jpg","img/product/detail/57b12a31N8f4f75a3.jpg","img/product/detail/57b12a31N8f4f75a3.jpg"),
(NULL, 4, "img/product/detail/57ad359dNd4a6f130.jpg","img/product/detail/57ad359dNd4a6f130.jpg","img/product/detail/57ad359dNd4a6f130.jpg"),
(NULL, 4, "img/product/detail/57ad8846N64ac3c79.jpg","img/product/detail/57ad8846N64ac3c79.jpg","img/product/detail/57ad8846N64ac3c79.jpg"),
(NULL, 5, "img/product/detail/57e3b072N661cd00d.jpg","img/product/detail/57e3b072N661cd00d.jpg","img/product/detail/57e3b072N661cd00d.jpg"),
(NULL, 5, "img/product/detail/57e1ff09Nf610fea3.jpg","img/product/detail/57e1ff09Nf610fea3.jpg","img/product/detail/57e1ff09Nf610fea3.jpg"),
(NULL, 5, "img/product/detail/57e1ff17N286390a9.jpg","img/product/detail/57e1ff17N286390a9.jpg","img/product/detail/57e1ff17N286390a9.jpg"),
(NULL, 5, "img/product/detail/57e1ff2fN8a36d0fe.jpg","img/product/detail/57e1ff2fN8a36d0fe.jpg","img/product/detail/57e1ff2fN8a36d0fe.jpg"),
(NULL, 5, "img/product/detail/57e52dffNa4d8ce2c.jpg","img/product/detail/57e52dffNa4d8ce2c.jpg","img/product/detail/57e52dffNa4d8ce2c.jpg"),
(NULL, 5, "img/product/detail/57e52e03N4ec367dd.jpg","img/product/detail/57e52e03N4ec367dd.jpg","img/product/detail/57e52e03N4ec367dd.jpg"),
(NULL, 5, "img/product/detail/57e52e06N116974f7.jpg","img/product/detail/57e52e06N116974f7.jpg","img/product/detail/57e52e06N116974f7.jpg"),
(NULL, 6, "img/product/detail/57e3b072N661cd00d.jpg","img/product/detail/57e3b072N661cd00d.jpg","img/product/detail/57e3b072N661cd00d.jpg"),
(NULL, 6, "img/product/detail/57e1ff09Nf610fea3.jpg","img/product/detail/57e1ff09Nf610fea3.jpg","img/product/detail/57e1ff09Nf610fea3.jpg"),
(NULL, 6, "img/product/detail/57e1ff17N286390a9.jpg","img/product/detail/57e1ff17N286390a9.jpg","img/product/detail/57e1ff17N286390a9.jpg"),
(NULL, 6, "img/product/detail/57e1ff2fN8a36d0fe.jpg","img/product/detail/57e1ff2fN8a36d0fe.jpg","img/product/detail/57e1ff2fN8a36d0fe.jpg"),
(NULL, 6, "img/product/detail/57e52dffNa4d8ce2c.jpg","img/product/detail/57e52dffNa4d8ce2c.jpg","img/product/detail/57e52dffNa4d8ce2c.jpg"),
(NULL, 6, "img/product/detail/57e52e03N4ec367dd.jpg","img/product/detail/57e52e03N4ec367dd.jpg","img/product/detail/57e52e03N4ec367dd.jpg"),
(NULL, 6, "img/product/detail/57e52e06N116974f7.jpg","img/product/detail/57e52e06N116974f7.jpg","img/product/detail/57e52e06N116974f7.jpg"),
(NULL, 7, "img/product/detail/57e3b072N661cd00d.jpg","img/product/detail/57e3b072N661cd00d.jpg","img/product/detail/57e3b072N661cd00d.jpg"),
(NULL, 7, "img/product/detail/57e1ff09Nf610fea3.jpg","img/product/detail/57e1ff09Nf610fea3.jpg","img/product/detail/57e1ff09Nf610fea3.jpg"),
(NULL, 7, "img/product/detail/57e1ff17N286390a9.jpg","img/product/detail/57e1ff17N286390a9.jpg","img/product/detail/57e1ff17N286390a9.jpg"),
(NULL, 7, "img/product/detail/57e1ff2fN8a36d0fe.jpg","img/product/detail/57e1ff2fN8a36d0fe.jpg","img/product/detail/57e1ff2fN8a36d0fe.jpg"),
(NULL, 7, "img/product/detail/57e52dffNa4d8ce2c.jpg","img/product/detail/57e52dffNa4d8ce2c.jpg","img/product/detail/57e52dffNa4d8ce2c.jpg"),
(NULL, 7, "img/product/detail/57e52e03N4ec367dd.jpg","img/product/detail/57e52e03N4ec367dd.jpg","img/product/detail/57e52e03N4ec367dd.jpg"),
(NULL, 7, "img/product/detail/57e52e06N116974f7.jpg","img/product/detail/57e52e06N116974f7.jpg","img/product/detail/57e52e06N116974f7.jpg"),
(NULL, 8, "img/product/detail/57e3b072N661cd00d.jpg","img/product/detail/57e3b072N661cd00d.jpg","img/product/detail/57e3b072N661cd00d.jpg"),
(NULL, 8, "img/product/detail/57e1ff09Nf610fea3.jpg","img/product/detail/57e1ff09Nf610fea3.jpg","img/product/detail/57e1ff09Nf610fea3.jpg"),
(NULL, 8, "img/product/detail/57e1ff17N286390a9.jpg","img/product/detail/57e1ff17N286390a9.jpg","img/product/detail/57e1ff17N286390a9.jpg"),
(NULL, 8, "img/product/detail/57e1ff2fN8a36d0fe.jpg","img/product/detail/57e1ff2fN8a36d0fe.jpg","img/product/detail/57e1ff2fN8a36d0fe.jpg"),
(NULL, 8, "img/product/detail/57e52dffNa4d8ce2c.jpg","img/product/detail/57e52dffNa4d8ce2c.jpg","img/product/detail/57e52dffNa4d8ce2c.jpg"),
(NULL, 8, "img/product/detail/57e52e03N4ec367dd.jpg","img/product/detail/57e52e03N4ec367dd.jpg","img/product/detail/57e52e03N4ec367dd.jpg"),
(NULL, 8, "img/product/detail/57e52e06N116974f7.jpg","img/product/detail/57e52e06N116974f7.jpg","img/product/detail/57e52e06N116974f7.jpg"),
(NULL, 9, "img/product/detail/584b5678Nbc9f1e70.jpg","img/product/detail/584b5678Nbc9f1e70.jpg","img/product/detail/584b5678Nbc9f1e70.jpg"),
(NULL, 9, "img/product/detail/584b567dNd9c58341.jpg","img/product/detail/584b567dNd9c58341.jpg","img/product/detail/584b567dNd9c58341.jpg"),
(NULL, 9, "img/product/detail/5819a0ebNefd901bc.jpg","img/product/detail/5819a0ebNefd901bc.jpg","img/product/detail/5819a0ebNefd901bc.jpg"),
(NULL, 9, "img/product/detail/5819a106Necf0abb8.jpg","img/product/detail/5819a106Necf0abb8.jpg","img/product/detail/5819a106Necf0abb8.jpg"),
(NULL, 9, "img/product/detail/5819a10bN2ea5c8e0.jpg","img/product/detail/5819a10bN2ea5c8e0.jpg","img/product/detail/5819a10bN2ea5c8e0.jpg"),
(NULL, 9, "img/product/detail/5819a10fNd0f96a03.jpg","img/product/detail/5819a10fNd0f96a03.jpg","img/product/detail/5819a10fNd0f96a03.jpg"),
(NULL, 9, "img/product/detail/5819a114Ne0cd75db.jpg","img/product/detail/5819a114Ne0cd75db.jpg","img/product/detail/5819a114Ne0cd75db.jpg"),
(NULL, 9, "img/product/detail/5819a133N03021b26.jpg","img/product/detail/5819a133N03021b26.jpg","img/product/detail/5819a133N03021b26.jpg"),
(NULL, 10, "img/product/detail/584b5678Nbc9f1e70.jpg","img/product/detail/584b5678Nbc9f1e70.jpg","img/product/detail/584b5678Nbc9f1e70.jpg"),
(NULL, 10, "img/product/detail/584b567dNd9c58341.jpg","img/product/detail/584b567dNd9c58341.jpg","img/product/detail/584b567dNd9c58341.jpg"),
(NULL, 10, "img/product/detail/5819a0ebNefd901bc.jpg","img/product/detail/5819a0ebNefd901bc.jpg","img/product/detail/5819a0ebNefd901bc.jpg"),
(NULL, 10, "img/product/detail/5819a106Necf0abb8.jpg","img/product/detail/5819a106Necf0abb8.jpg","img/product/detail/5819a106Necf0abb8.jpg"),
(NULL, 10, "img/product/detail/5819a10bN2ea5c8e0.jpg","img/product/detail/5819a10bN2ea5c8e0.jpg","img/product/detail/5819a10bN2ea5c8e0.jpg"),
(NULL, 10, "img/product/detail/5819a10fNd0f96a03.jpg","img/product/detail/5819a10fNd0f96a03.jpg","img/product/detail/5819a10fNd0f96a03.jpg"),
(NULL, 10, "img/product/detail/5819a114Ne0cd75db.jpg","img/product/detail/5819a114Ne0cd75db.jpg","img/product/detail/5819a114Ne0cd75db.jpg"),
(NULL, 10, "img/product/detail/5819a133N03021b26.jpg","img/product/detail/5819a133N03021b26.jpg","img/product/detail/5819a133N03021b26.jpg"),
(NULL, 11, "img/product/detail/584b5678Nbc9f1e70.jpg","img/product/detail/584b5678Nbc9f1e70.jpg","img/product/detail/584b5678Nbc9f1e70.jpg"),
(NULL, 11, "img/product/detail/584b567dNd9c58341.jpg","img/product/detail/584b567dNd9c58341.jpg","img/product/detail/584b567dNd9c58341.jpg"),
(NULL, 11, "img/product/detail/5819a0ebNefd901bc.jpg","img/product/detail/5819a0ebNefd901bc.jpg","img/product/detail/5819a0ebNefd901bc.jpg"),
(NULL, 11, "img/product/detail/5819a106Necf0abb8.jpg","img/product/detail/5819a106Necf0abb8.jpg","img/product/detail/5819a106Necf0abb8.jpg"),
(NULL, 11, "img/product/detail/5819a10bN2ea5c8e0.jpg","img/product/detail/5819a10bN2ea5c8e0.jpg","img/product/detail/5819a10bN2ea5c8e0.jpg"),
(NULL, 11, "img/product/detail/5819a10fNd0f96a03.jpg","img/product/detail/5819a10fNd0f96a03.jpg","img/product/detail/5819a10fNd0f96a03.jpg"),
(NULL, 11, "img/product/detail/5819a114Ne0cd75db.jpg","img/product/detail/5819a114Ne0cd75db.jpg","img/product/detail/5819a114Ne0cd75db.jpg"),
(NULL, 11, "img/product/detail/5819a133N03021b26.jpg","img/product/detail/5819a133N03021b26.jpg","img/product/detail/5819a133N03021b26.jpg"),
(NULL, 12, "img/product/detail/584b5678Nbc9f1e70.jpg","img/product/detail/584b5678Nbc9f1e70.jpg","img/product/detail/584b5678Nbc9f1e70.jpg"),
(NULL, 12, "img/product/detail/584b567dNd9c58341.jpg","img/product/detail/584b567dNd9c58341.jpg","img/product/detail/584b567dNd9c58341.jpg"),
(NULL, 12, "img/product/detail/5819a0ebNefd901bc.jpg","img/product/detail/5819a0ebNefd901bc.jpg","img/product/detail/5819a0ebNefd901bc.jpg"),
(NULL, 12, "img/product/detail/5819a106Necf0abb8.jpg","img/product/detail/5819a106Necf0abb8.jpg","img/product/detail/5819a106Necf0abb8.jpg"),
(NULL, 12, "img/product/detail/5819a10bN2ea5c8e0.jpg","img/product/detail/5819a10bN2ea5c8e0.jpg","img/product/detail/5819a10bN2ea5c8e0.jpg"),
(NULL, 12, "img/product/detail/5819a10fNd0f96a03.jpg","img/product/detail/5819a10fNd0f96a03.jpg","img/product/detail/5819a10fNd0f96a03.jpg"),
(NULL, 12, "img/product/detail/5819a114Ne0cd75db.jpg","img/product/detail/5819a114Ne0cd75db.jpg","img/product/detail/5819a114Ne0cd75db.jpg"),
(NULL, 12, "img/product/detail/5819a133N03021b26.jpg","img/product/detail/5819a133N03021b26.jpg","img/product/detail/5819a133N03021b26.jpg"),
(NULL, 13, "img/product/detail/590a98f9N8039f132.jpg","img/product/detail/590a98f9N8039f132.jpg","img/product/detail/590a98f9N8039f132.jpg"),
(NULL, 13, "img/product/detail/58f46de7N0dafbae3.jpg","img/product/detail/58f46de7N0dafbae3.jpg","img/product/detail/58f46de7N0dafbae3.jpg"),
(NULL, 13, "img/product/detail/58e5c226N4836a223.jpg","img/product/detail/58e5c226N4836a223.jpg","img/product/detail/58e5c226N4836a223.jpg"),
(NULL, 13, "img/product/detail/58dc76d5N8a0947a3.jpg","img/product/detail/58dc76d5N8a0947a3.jpg","img/product/detail/58dc76d5N8a0947a3.jpg"),
(NULL, 13, "img/product/detail/58fd9c54Nec723d68.jpg","img/product/detail/58fd9c54Nec723d68.jpg","img/product/detail/58fd9c54Nec723d68.jpg"),
(NULL, 13, "img/product/detail/58bfc2afNd44b4135.jpg","img/product/detail/58bfc2afNd44b4135.jpg","img/product/detail/58bfc2afNd44b4135.jpg"),
(NULL, 14, "img/product/detail/590a98f9N8039f132.jpg","img/product/detail/590a98f9N8039f132.jpg","img/product/detail/590a98f9N8039f132.jpg"),
(NULL, 14, "img/product/detail/58f46de7N0dafbae3.jpg","img/product/detail/58f46de7N0dafbae3.jpg","img/product/detail/58f46de7N0dafbae3.jpg"),
(NULL, 14, "img/product/detail/58e5c226N4836a223.jpg","img/product/detail/58e5c226N4836a223.jpg","img/product/detail/58e5c226N4836a223.jpg"),
(NULL, 14, "img/product/detail/58dc76d5N8a0947a3.jpg","img/product/detail/58dc76d5N8a0947a3.jpg","img/product/detail/58dc76d5N8a0947a3.jpg"),
(NULL, 14, "img/product/detail/58fd9c54Nec723d68.jpg","img/product/detail/58fd9c54Nec723d68.jpg","img/product/detail/58fd9c54Nec723d68.jpg"),
(NULL, 14, "img/product/detail/58bfc2afNd44b4135.jpg","img/product/detail/58bfc2afNd44b4135.jpg","img/product/detail/58bfc2afNd44b4135.jpg"),
(NULL, 15, "img/product/detail/590a98f9N8039f132.jpg","img/product/detail/590a98f9N8039f132.jpg","img/product/detail/590a98f9N8039f132.jpg"),
(NULL, 15, "img/product/detail/58f46de7N0dafbae3.jpg","img/product/detail/58f46de7N0dafbae3.jpg","img/product/detail/58f46de7N0dafbae3.jpg"),
(NULL, 15, "img/product/detail/58e5c226N4836a223.jpg","img/product/detail/58e5c226N4836a223.jpg","img/product/detail/58e5c226N4836a223.jpg"),
(NULL, 15, "img/product/detail/58dc76d5N8a0947a3.jpg","img/product/detail/58dc76d5N8a0947a3.jpg","img/product/detail/58dc76d5N8a0947a3.jpg"),
(NULL, 15, "img/product/detail/58fd9c54Nec723d68.jpg","img/product/detail/58fd9c54Nec723d68.jpg","img/product/detail/58fd9c54Nec723d68.jpg"),
(NULL, 15, "img/product/detail/58bfc2afNd44b4135.jpg","img/product/detail/58bfc2afNd44b4135.jpg","img/product/detail/58bfc2afNd44b4135.jpg"),
(NULL, 16, "img/product/detail/590a98f9N8039f132.jpg","img/product/detail/590a98f9N8039f132.jpg","img/product/detail/590a98f9N8039f132.jpg"),
(NULL, 16, "img/product/detail/58f46de7N0dafbae3.jpg","img/product/detail/58f46de7N0dafbae3.jpg","img/product/detail/58f46de7N0dafbae3.jpg"),
(NULL, 16, "img/product/detail/58e5c226N4836a223.jpg","img/product/detail/58e5c226N4836a223.jpg","img/product/detail/58e5c226N4836a223.jpg"),
(NULL, 16, "img/product/detail/58dc76d5N8a0947a3.jpg","img/product/detail/58dc76d5N8a0947a3.jpg","img/product/detail/58dc76d5N8a0947a3.jpg"),
(NULL, 16, "img/product/detail/58fd9c54Nec723d68.jpg","img/product/detail/58fd9c54Nec723d68.jpg","img/product/detail/58fd9c54Nec723d68.jpg"),
(NULL, 16, "img/product/detail/58bfc2afNd44b4135.jpg","img/product/detail/58bfc2afNd44b4135.jpg","img/product/detail/58bfc2afNd44b4135.jpg"),
(NULL, 17, "img/product/detail/587f476aNcfbf7869.jpg","img/product/detail/587f476aNcfbf7869.jpg","img/product/detail/587f476aNcfbf7869.jpg"),
(NULL, 17, "img/product/detail/57871083Nefe2d3d6.jpg","img/product/detail/57871083Nefe2d3d6.jpg","img/product/detail/57871083Nefe2d3d6.jpg"),
(NULL, 17, "img/product/detail/57871086N86c8f0ab.jpg","img/product/detail/57871086N86c8f0ab.jpg","img/product/detail/57871086N86c8f0ab.jpg"),
(NULL, 17, "img/product/detail/5787107bN73d05ad5.jpg","img/product/detail/5787107bN73d05ad5.jpg","img/product/detail/5787107bN73d05ad5.jpg"),
(NULL, 17, "img/product/detail/5787109cNaf26e3b0.jpg","img/product/detail/5787109cNaf26e3b0.jpg","img/product/detail/5787109cNaf26e3b0.jpg"),
(NULL, 17, "img/product/detail/578710a0N07795fe5.jpg","img/product/detail/578710a0N07795fe5.jpg","img/product/detail/578710a0N07795fe5.jpg"),
(NULL, 17, "img/product/detail/578710a3Nc498e3ea.jpg","img/product/detail/578710a3Nc498e3ea.jpg","img/product/detail/578710a3Nc498e3ea.jpg"),
(NULL, 18, "img/product/detail/587f476aNcfbf7869.jpg","img/product/detail/587f476aNcfbf7869.jpg","img/product/detail/587f476aNcfbf7869.jpg"),
(NULL, 18, "img/product/detail/57871083Nefe2d3d6.jpg","img/product/detail/57871083Nefe2d3d6.jpg","img/product/detail/57871083Nefe2d3d6.jpg"),
(NULL, 18, "img/product/detail/57871086N86c8f0ab.jpg","img/product/detail/57871086N86c8f0ab.jpg","img/product/detail/57871086N86c8f0ab.jpg"),
(NULL, 18, "img/product/detail/5787107bN73d05ad5.jpg","img/product/detail/5787107bN73d05ad5.jpg","img/product/detail/5787107bN73d05ad5.jpg"),
(NULL, 18, "img/product/detail/5787109cNaf26e3b0.jpg","img/product/detail/5787109cNaf26e3b0.jpg","img/product/detail/5787109cNaf26e3b0.jpg"),
(NULL, 18, "img/product/detail/578710a0N07795fe5.jpg","img/product/detail/578710a0N07795fe5.jpg","img/product/detail/578710a0N07795fe5.jpg"),
(NULL, 18, "img/product/detail/578710a3Nc498e3ea.jpg","img/product/detail/578710a3Nc498e3ea.jpg","img/product/detail/578710a3Nc498e3ea.jpg"),
(NULL, 19, "img/product/detail/57bbc38eN9def8042.jpg","img/product/detail/57bbc38eN9def8042.jpg","img/product/detail/57bbc38eN9def8042.jpg"),
(NULL, 19, "img/product/detail/57ba6a27Nbb8d2dcf.jpg","img/product/detail/57ba6a27Nbb8d2dcf.jpg","img/product/detail/57ba6a27Nbb8d2dcf.jpg"),
(NULL, 19, "img/product/detail/57ba6a38N4f4670bd.jpg","img/product/detail/57ba6a38N4f4670bd.jpg","img/product/detail/57ba6a38N4f4670bd.jpg"),
(NULL, 19, "img/product/detail/57ba6a3dN54779e6a.jpg","img/product/detail/57ba6a3dN54779e6a.jpg","img/product/detail/57ba6a3dN54779e6a.jpg"),
(NULL, 19, "img/product/detail/57ba6a47N19af9c97.jpg","img/product/detail/57ba6a47N19af9c97.jpg","img/product/detail/57ba6a47N19af9c97.jpg"),
(NULL, 19, "img/product/detail/57ba6a4cNb83e292a.jpg","img/product/detail/57ba6a4cNb83e292a.jpg","img/product/detail/57ba6a4cNb83e292a.jpg"),
(NULL, 19, "img/product/detail/57ba6a56N1e3e3d63.jpg","img/product/detail/57ba6a56N1e3e3d63.jpg","img/product/detail/57ba6a56N1e3e3d63.jpg"),
(NULL, 20, "img/product/detail/57bbc38eN9def8042.jpg","img/product/detail/57bbc38eN9def8042.jpg","img/product/detail/57bbc38eN9def8042.jpg"),
(NULL, 20, "img/product/detail/57ba6a27Nbb8d2dcf.jpg","img/product/detail/57ba6a27Nbb8d2dcf.jpg","img/product/detail/57ba6a27Nbb8d2dcf.jpg"),
(NULL, 20, "img/product/detail/57ba6a38N4f4670bd.jpg","img/product/detail/57ba6a38N4f4670bd.jpg","img/product/detail/57ba6a38N4f4670bd.jpg"),
(NULL, 20, "img/product/detail/57ba6a3dN54779e6a.jpg","img/product/detail/57ba6a3dN54779e6a.jpg","img/product/detail/57ba6a3dN54779e6a.jpg"),
(NULL, 20, "img/product/detail/57ba6a47N19af9c97.jpg","img/product/detail/57ba6a47N19af9c97.jpg","img/product/detail/57ba6a47N19af9c97.jpg"),
(NULL, 20, "img/product/detail/57ba6a4cNb83e292a.jpg","img/product/detail/57ba6a4cNb83e292a.jpg","img/product/detail/57ba6a4cNb83e292a.jpg"),
(NULL, 20, "img/product/detail/57ba6a56N1e3e3d63.jpg","img/product/detail/57ba6a56N1e3e3d63.jpg","img/product/detail/57ba6a56N1e3e3d63.jpg"),
(NULL, 21, "img/product/detail/57bbc38eN9def8042.jpg","img/product/detail/57bbc38eN9def8042.jpg","img/product/detail/57bbc38eN9def8042.jpg"),
(NULL, 21, "img/product/detail/57ba6a27Nbb8d2dcf.jpg","img/product/detail/57ba6a27Nbb8d2dcf.jpg","img/product/detail/57ba6a27Nbb8d2dcf.jpg"),
(NULL, 21, "img/product/detail/57ba6a38N4f4670bd.jpg","img/product/detail/57ba6a38N4f4670bd.jpg","img/product/detail/57ba6a38N4f4670bd.jpg"),
(NULL, 21, "img/product/detail/57ba6a3dN54779e6a.jpg","img/product/detail/57ba6a3dN54779e6a.jpg","img/product/detail/57ba6a3dN54779e6a.jpg"),
(NULL, 21, "img/product/detail/57ba6a47N19af9c97.jpg","img/product/detail/57ba6a47N19af9c97.jpg","img/product/detail/57ba6a47N19af9c97.jpg"),
(NULL, 21, "img/product/detail/57ba6a4cNb83e292a.jpg","img/product/detail/57ba6a4cNb83e292a.jpg","img/product/detail/57ba6a4cNb83e292a.jpg"),
(NULL, 21, "img/product/detail/57ba6a56N1e3e3d63.jpg","img/product/detail/57ba6a56N1e3e3d63.jpg","img/product/detail/57ba6a56N1e3e3d63.jpg"),
(NULL, 22, "img/product/detail/5913f8ffN49fa143c.jpg","img/product/detail/5913f8ffN49fa143c.jpg","img/product/detail/5913f8ffN49fa143c.jpg"),
(NULL, 22, "img/product/detail/5913f903Nbffaa4fd.jpg","img/product/detail/5913f903Nbffaa4fd.jpg","img/product/detail/5913f903Nbffaa4fd.jpg"),
(NULL, 22, "img/product/detail/5913f907Ncbc65469.jpg","img/product/detail/5913f907Ncbc65469.jpg","img/product/detail/5913f907Ncbc65469.jpg"),
(NULL, 22, "img/product/detail/5913f90bN1b563f42.jpg","img/product/detail/5913f90bN1b563f42.jpg","img/product/detail/5913f90bN1b563f42.jpg"),
(NULL, 22, "img/product/detail/5913f90fN99370675.jpg","img/product/detail/5913f90fN99370675.jpg","img/product/detail/5913f90fN99370675.jpg"),
(NULL, 22, "img/product/detail/5913f93bNe4d2b3e5.jpg","img/product/detail/5913f93bNe4d2b3e5.jpg","img/product/detail/5913f93bNe4d2b3e5.jpg"),
(NULL, 22, "img/product/detail/5913f93fNfd79b4fc.jpg","img/product/detail/5913f93fNfd79b4fc.jpg","img/product/detail/5913f93fNfd79b4fc.jpg"),
(NULL, 23, "img/product/detail/5913f8ffN49fa143c.jpg","img/product/detail/5913f8ffN49fa143c.jpg","img/product/detail/5913f8ffN49fa143c.jpg"),
(NULL, 23, "img/product/detail/5913f903Nbffaa4fd.jpg","img/product/detail/5913f903Nbffaa4fd.jpg","img/product/detail/5913f903Nbffaa4fd.jpg"),
(NULL, 23, "img/product/detail/5913f907Ncbc65469.jpg","img/product/detail/5913f907Ncbc65469.jpg","img/product/detail/5913f907Ncbc65469.jpg"),
(NULL, 23, "img/product/detail/5913f90bN1b563f42.jpg","img/product/detail/5913f90bN1b563f42.jpg","img/product/detail/5913f90bN1b563f42.jpg"),
(NULL, 23, "img/product/detail/5913f90fN99370675.jpg","img/product/detail/5913f90fN99370675.jpg","img/product/detail/5913f90fN99370675.jpg"),
(NULL, 23, "img/product/detail/5913f93bNe4d2b3e5.jpg","img/product/detail/5913f93bNe4d2b3e5.jpg","img/product/detail/5913f93bNe4d2b3e5.jpg"),
(NULL, 23, "img/product/detail/5913f93fNfd79b4fc.jpg","img/product/detail/5913f93fNfd79b4fc.jpg","img/product/detail/5913f93fNfd79b4fc.jpg"),
(NULL, 24, "img/product/detail/5913f8ffN49fa143c.jpg","img/product/detail/5913f8ffN49fa143c.jpg","img/product/detail/5913f8ffN49fa143c.jpg"),
(NULL, 24, "img/product/detail/5913f903Nbffaa4fd.jpg","img/product/detail/5913f903Nbffaa4fd.jpg","img/product/detail/5913f903Nbffaa4fd.jpg"),
(NULL, 24, "img/product/detail/5913f907Ncbc65469.jpg","img/product/detail/5913f907Ncbc65469.jpg","img/product/detail/5913f907Ncbc65469.jpg"),
(NULL, 24, "img/product/detail/5913f90bN1b563f42.jpg","img/product/detail/5913f90bN1b563f42.jpg","img/product/detail/5913f90bN1b563f42.jpg"),
(NULL, 24, "img/product/detail/5913f90fN99370675.jpg","img/product/detail/5913f90fN99370675.jpg","img/product/detail/5913f90fN99370675.jpg"),
(NULL, 24, "img/product/detail/5913f93bNe4d2b3e5.jpg","img/product/detail/5913f93bNe4d2b3e5.jpg","img/product/detail/5913f93bNe4d2b3e5.jpg"),
(NULL, 24, "img/product/detail/5913f93fNfd79b4fc.jpg","img/product/detail/5913f93fNfd79b4fc.jpg","img/product/detail/5913f93fNfd79b4fc.jpg"),
(NULL, 25, "img/product/detail/5913f8ffN49fa143c.jpg","img/product/detail/5913f8ffN49fa143c.jpg","img/product/detail/5913f8ffN49fa143c.jpg"),
(NULL, 25, "img/product/detail/5913f903Nbffaa4fd.jpg","img/product/detail/5913f903Nbffaa4fd.jpg","img/product/detail/5913f903Nbffaa4fd.jpg"),
(NULL, 25, "img/product/detail/5913f907Ncbc65469.jpg","img/product/detail/5913f907Ncbc65469.jpg","img/product/detail/5913f907Ncbc65469.jpg"),
(NULL, 25, "img/product/detail/5913f90bN1b563f42.jpg","img/product/detail/5913f90bN1b563f42.jpg","img/product/detail/5913f90bN1b563f42.jpg"),
(NULL, 25, "img/product/detail/5913f90fN99370675.jpg","img/product/detail/5913f90fN99370675.jpg","img/product/detail/5913f90fN99370675.jpg"),
(NULL, 25, "img/product/detail/5913f93bNe4d2b3e5.jpg","img/product/detail/5913f93bNe4d2b3e5.jpg","img/product/detail/5913f93bNe4d2b3e5.jpg"),
(NULL, 25, "img/product/detail/5913f93fNfd79b4fc.jpg","img/product/detail/5913f93fNfd79b4fc.jpg","img/product/detail/5913f93fNfd79b4fc.jpg"),
(NULL, 26, "img/product/detail/5913f8ffN49fa143c.jpg","img/product/detail/5913f8ffN49fa143c.jpg","img/product/detail/5913f8ffN49fa143c.jpg"),
(NULL, 26, "img/product/detail/5913f903Nbffaa4fd.jpg","img/product/detail/5913f903Nbffaa4fd.jpg","img/product/detail/5913f903Nbffaa4fd.jpg"),
(NULL, 26, "img/product/detail/5913f907Ncbc65469.jpg","img/product/detail/5913f907Ncbc65469.jpg","img/product/detail/5913f907Ncbc65469.jpg"),
(NULL, 26, "img/product/detail/5913f90bN1b563f42.jpg","img/product/detail/5913f90bN1b563f42.jpg","img/product/detail/5913f90bN1b563f42.jpg"),
(NULL, 26, "img/product/detail/5913f90fN99370675.jpg","img/product/detail/5913f90fN99370675.jpg","img/product/detail/5913f90fN99370675.jpg"),
(NULL, 26, "img/product/detail/5913f93bNe4d2b3e5.jpg","img/product/detail/5913f93bNe4d2b3e5.jpg","img/product/detail/5913f93bNe4d2b3e5.jpg"),
(NULL, 26, "img/product/detail/5913f93fNfd79b4fc.jpg","img/product/detail/5913f93fNfd79b4fc.jpg","img/product/detail/5913f93fNfd79b4fc.jpg"),
(NULL, 27, "img/product/detail/5913f8ffN49fa143c.jpg","img/product/detail/5913f8ffN49fa143c.jpg","img/product/detail/5913f8ffN49fa143c.jpg"),
(NULL, 27, "img/product/detail/5913f903Nbffaa4fd.jpg","img/product/detail/5913f903Nbffaa4fd.jpg","img/product/detail/5913f903Nbffaa4fd.jpg"),
(NULL, 27, "img/product/detail/5913f907Ncbc65469.jpg","img/product/detail/5913f907Ncbc65469.jpg","img/product/detail/5913f907Ncbc65469.jpg"),
(NULL, 27, "img/product/detail/5913f90bN1b563f42.jpg","img/product/detail/5913f90bN1b563f42.jpg","img/product/detail/5913f90bN1b563f42.jpg"),
(NULL, 27, "img/product/detail/5913f90fN99370675.jpg","img/product/detail/5913f90fN99370675.jpg","img/product/detail/5913f90fN99370675.jpg"),
(NULL, 27, "img/product/detail/5913f93bNe4d2b3e5.jpg","img/product/detail/5913f93bNe4d2b3e5.jpg","img/product/detail/5913f93bNe4d2b3e5.jpg"),
(NULL, 27, "img/product/detail/5913f93fNfd79b4fc.jpg","img/product/detail/5913f93fNfd79b4fc.jpg","img/product/detail/5913f93fNfd79b4fc.jpg"),
(NULL, 28, "img/product/detail/584b5678Nbc9f1e70.jpg","img/product/detail/584b5678Nbc9f1e70.jpg","img/product/detail/584b5678Nbc9f1e70.jpg"),
(NULL, 28, "img/product/detail/584b567dNd9c58341.jpg","img/product/detail/584b567dNd9c58341.jpg","img/product/detail/584b567dNd9c58341.jpg"),
(NULL, 28, "img/product/detail/5819a0ebNefd901bc.jpg","img/product/detail/5819a0ebNefd901bc.jpg","img/product/detail/5819a0ebNefd901bc.jpg"),
(NULL, 28, "img/product/detail/5819a106Necf0abb8.jpg","img/product/detail/5819a106Necf0abb8.jpg","img/product/detail/5819a106Necf0abb8.jpg"),
(NULL, 28, "img/product/detail/5819a10bN2ea5c8e0.jpg","img/product/detail/5819a10bN2ea5c8e0.jpg","img/product/detail/5819a10bN2ea5c8e0.jpg"),
(NULL, 28, "img/product/detail/5819a10fNd0f96a03.jpg","img/product/detail/5819a10fNd0f96a03.jpg","img/product/detail/5819a10fNd0f96a03.jpg"),
(NULL, 28, "img/product/detail/5819a114Ne0cd75db.jpg","img/product/detail/5819a114Ne0cd75db.jpg","img/product/detail/5819a114Ne0cd75db.jpg"),
(NULL, 28, "img/product/detail/5819a133N03021b26.jpg","img/product/detail/5819a133N03021b26.jpg","img/product/detail/5819a133N03021b26.jpg"),
(NULL, 29, "img/product/detail/584b5678Nbc9f1e70.jpg","img/product/detail/584b5678Nbc9f1e70.jpg","img/product/detail/584b5678Nbc9f1e70.jpg"),
(NULL, 29, "img/product/detail/584b567dNd9c58341.jpg","img/product/detail/584b567dNd9c58341.jpg","img/product/detail/584b567dNd9c58341.jpg"),
(NULL, 29, "img/product/detail/5819a0ebNefd901bc.jpg","img/product/detail/5819a0ebNefd901bc.jpg","img/product/detail/5819a0ebNefd901bc.jpg"),
(NULL, 29, "img/product/detail/5819a106Necf0abb8.jpg","img/product/detail/5819a106Necf0abb8.jpg","img/product/detail/5819a106Necf0abb8.jpg"),
(NULL, 29, "img/product/detail/5819a10bN2ea5c8e0.jpg","img/product/detail/5819a10bN2ea5c8e0.jpg","img/product/detail/5819a10bN2ea5c8e0.jpg"),
(NULL, 29, "img/product/detail/5819a10fNd0f96a03.jpg","img/product/detail/5819a10fNd0f96a03.jpg","img/product/detail/5819a10fNd0f96a03.jpg"),
(NULL, 29, "img/product/detail/5819a114Ne0cd75db.jpg","img/product/detail/5819a114Ne0cd75db.jpg","img/product/detail/5819a114Ne0cd75db.jpg"),
(NULL, 29, "img/product/detail/5819a133N03021b26.jpg","img/product/detail/5819a133N03021b26.jpg","img/product/detail/5819a133N03021b26.jpg"),
(NULL, 30, "img/product/detail/584b5678Nbc9f1e70.jpg","img/product/detail/584b5678Nbc9f1e70.jpg","img/product/detail/584b5678Nbc9f1e70.jpg"),
(NULL, 30, "img/product/detail/584b567dNd9c58341.jpg","img/product/detail/584b567dNd9c58341.jpg","img/product/detail/584b567dNd9c58341.jpg"),
(NULL, 30, "img/product/detail/5819a0ebNefd901bc.jpg","img/product/detail/5819a0ebNefd901bc.jpg","img/product/detail/5819a0ebNefd901bc.jpg"),
(NULL, 30, "img/product/detail/5819a106Necf0abb8.jpg","img/product/detail/5819a106Necf0abb8.jpg","img/product/detail/5819a106Necf0abb8.jpg"),
(NULL, 30, "img/product/detail/5819a10bN2ea5c8e0.jpg","img/product/detail/5819a10bN2ea5c8e0.jpg","img/product/detail/5819a10bN2ea5c8e0.jpg"),
(NULL, 30, "img/product/detail/5819a10fNd0f96a03.jpg","img/product/detail/5819a10fNd0f96a03.jpg","img/product/detail/5819a10fNd0f96a03.jpg"),
(NULL, 30, "img/product/detail/5819a114Ne0cd75db.jpg","img/product/detail/5819a114Ne0cd75db.jpg","img/product/detail/5819a114Ne0cd75db.jpg"),
(NULL, 30, "img/product/detail/5819a133N03021b26.jpg","img/product/detail/5819a133N03021b26.jpg","img/product/detail/5819a133N03021b26.jpg"),
(NULL, 31, "img/product/detail/584b5678Nbc9f1e70.jpg","img/product/detail/584b5678Nbc9f1e70.jpg","img/product/detail/584b5678Nbc9f1e70.jpg"),
(NULL, 31, "img/product/detail/584b567dNd9c58341.jpg","img/product/detail/584b567dNd9c58341.jpg","img/product/detail/584b567dNd9c58341.jpg"),
(NULL, 31, "img/product/detail/5819a0ebNefd901bc.jpg","img/product/detail/5819a0ebNefd901bc.jpg","img/product/detail/5819a0ebNefd901bc.jpg"),
(NULL, 31, "img/product/detail/5819a106Necf0abb8.jpg","img/product/detail/5819a106Necf0abb8.jpg","img/product/detail/5819a106Necf0abb8.jpg"),
(NULL, 31, "img/product/detail/5819a10bN2ea5c8e0.jpg","img/product/detail/5819a10bN2ea5c8e0.jpg","img/product/detail/5819a10bN2ea5c8e0.jpg"),
(NULL, 31, "img/product/detail/5819a10fNd0f96a03.jpg","img/product/detail/5819a10fNd0f96a03.jpg","img/product/detail/5819a10fNd0f96a03.jpg"),
(NULL, 31, "img/product/detail/5819a114Ne0cd75db.jpg","img/product/detail/5819a114Ne0cd75db.jpg","img/product/detail/5819a114Ne0cd75db.jpg"),
(NULL, 31, "img/product/detail/5819a133N03021b26.jpg","img/product/detail/5819a133N03021b26.jpg","img/product/detail/5819a133N03021b26.jpg"),
(NULL, 32, "img/product/detail/584b5678Nbc9f1e70.jpg","img/product/detail/584b5678Nbc9f1e70.jpg","img/product/detail/584b5678Nbc9f1e70.jpg"),
(NULL, 32, "img/product/detail/584b567dNd9c58341.jpg","img/product/detail/584b567dNd9c58341.jpg","img/product/detail/584b567dNd9c58341.jpg"),
(NULL, 32, "img/product/detail/5819a0ebNefd901bc.jpg","img/product/detail/5819a0ebNefd901bc.jpg","img/product/detail/5819a0ebNefd901bc.jpg"),
(NULL, 32, "img/product/detail/5819a106Necf0abb8.jpg","img/product/detail/5819a106Necf0abb8.jpg","img/product/detail/5819a106Necf0abb8.jpg"),
(NULL, 32, "img/product/detail/5819a10bN2ea5c8e0.jpg","img/product/detail/5819a10bN2ea5c8e0.jpg","img/product/detail/5819a10bN2ea5c8e0.jpg"),
(NULL, 32, "img/product/detail/5819a10fNd0f96a03.jpg","img/product/detail/5819a10fNd0f96a03.jpg","img/product/detail/5819a10fNd0f96a03.jpg"),
(NULL, 32, "img/product/detail/5819a114Ne0cd75db.jpg","img/product/detail/5819a114Ne0cd75db.jpg","img/product/detail/5819a114Ne0cd75db.jpg"),
(NULL, 32, "img/product/detail/5819a133N03021b26.jpg","img/product/detail/5819a133N03021b26.jpg","img/product/detail/5819a133N03021b26.jpg"),
(NULL, 33, "img/product/detail/58985861N615a3581.jpg","img/product/detail/58985861N615a3581.jpg","img/product/detail/58985861N615a3581.jpg"),
(NULL, 33, "img/product/detail/58985867Nf8909d49.jpg","img/product/detail/58985867Nf8909d49.jpg","img/product/detail/58985867Nf8909d49.jpg"),
(NULL, 33, "img/product/detail/5898586cNe235284b.jpg","img/product/detail/5898586cNe235284b.jpg","img/product/detail/5898586cNe235284b.jpg"),
(NULL, 33, "img/product/detail/58985881N0a78dea2.jpg","img/product/detail/58985881N0a78dea2.jpg","img/product/detail/58985881N0a78dea2.jpg"),
(NULL, 33, "img/product/detail/58985883Nd4aec745.jpg","img/product/detail/58985883Nd4aec745.jpg","img/product/detail/58985883Nd4aec745.jpg"),
(NULL, 33, "img/product/detail/5836b979N85c3852b.jpg","img/product/detail/5836b979N85c3852b.jpg","img/product/detail/5836b979N85c3852b.jpg"),
(NULL, 33, "img/product/detail/5836b981Nd60fd02a.jpg","img/product/detail/5836b981Nd60fd02a.jpg","img/product/detail/5836b981Nd60fd02a.jpg"),
(NULL, 34, "img/product/detail/58985861N615a3581.jpg","img/product/detail/58985861N615a3581.jpg","img/product/detail/58985861N615a3581.jpg"),
(NULL, 34, "img/product/detail/58985867Nf8909d49.jpg","img/product/detail/58985867Nf8909d49.jpg","img/product/detail/58985867Nf8909d49.jpg"),
(NULL, 34, "img/product/detail/5898586cNe235284b.jpg","img/product/detail/5898586cNe235284b.jpg","img/product/detail/5898586cNe235284b.jpg"),
(NULL, 34, "img/product/detail/58985881N0a78dea2.jpg","img/product/detail/58985881N0a78dea2.jpg","img/product/detail/58985881N0a78dea2.jpg"),
(NULL, 34, "img/product/detail/58985883Nd4aec745.jpg","img/product/detail/58985883Nd4aec745.jpg","img/product/detail/58985883Nd4aec745.jpg"),
(NULL, 34, "img/product/detail/5836b979N85c3852b.jpg","img/product/detail/5836b979N85c3852b.jpg","img/product/detail/5836b979N85c3852b.jpg"),
(NULL, 34, "img/product/detail/5836b981Nd60fd02a.jpg","img/product/detail/5836b981Nd60fd02a.jpg","img/product/detail/5836b981Nd60fd02a.jpg"),
(NULL, 35, "img/product/detail/58985861N615a3581.jpg","img/product/detail/58985861N615a3581.jpg","img/product/detail/58985861N615a3581.jpg"),
(NULL, 35, "img/product/detail/58985867Nf8909d49.jpg","img/product/detail/58985867Nf8909d49.jpg","img/product/detail/58985867Nf8909d49.jpg"),
(NULL, 35, "img/product/detail/5898586cNe235284b.jpg","img/product/detail/5898586cNe235284b.jpg","img/product/detail/5898586cNe235284b.jpg"),
(NULL, 35, "img/product/detail/58985881N0a78dea2.jpg","img/product/detail/58985881N0a78dea2.jpg","img/product/detail/58985881N0a78dea2.jpg"),
(NULL, 35, "img/product/detail/58985883Nd4aec745.jpg","img/product/detail/58985883Nd4aec745.jpg","img/product/detail/58985883Nd4aec745.jpg"),
(NULL, 35, "img/product/detail/5836b979N85c3852b.jpg","img/product/detail/5836b979N85c3852b.jpg","img/product/detail/5836b979N85c3852b.jpg"),
(NULL, 35, "img/product/detail/5836b981Nd60fd02a.jpg","img/product/detail/5836b981Nd60fd02a.jpg","img/product/detail/5836b981Nd60fd02a.jpg"),
(NULL, 36, "img/product/detail/58985861N615a3581.jpg","img/product/detail/58985861N615a3581.jpg","img/product/detail/58985861N615a3581.jpg"),
(NULL, 36, "img/product/detail/58985867Nf8909d49.jpg","img/product/detail/58985867Nf8909d49.jpg","img/product/detail/58985867Nf8909d49.jpg"),
(NULL, 36, "img/product/detail/5898586cNe235284b.jpg","img/product/detail/5898586cNe235284b.jpg","img/product/detail/5898586cNe235284b.jpg"),
(NULL, 36, "img/product/detail/58985881N0a78dea2.jpg","img/product/detail/58985881N0a78dea2.jpg","img/product/detail/58985881N0a78dea2.jpg"),
(NULL, 36, "img/product/detail/58985883Nd4aec745.jpg","img/product/detail/58985883Nd4aec745.jpg","img/product/detail/58985883Nd4aec745.jpg"),
(NULL, 36, "img/product/detail/5836b979N85c3852b.jpg","img/product/detail/5836b979N85c3852b.jpg","img/product/detail/5836b979N85c3852b.jpg"),
(NULL, 36, "img/product/detail/5836b981Nd60fd02a.jpg","img/product/detail/5836b981Nd60fd02a.jpg","img/product/detail/5836b981Nd60fd02a.jpg"),
(NULL, 37, "img/product/detail/58985861N615a3581.jpg","img/product/detail/58985861N615a3581.jpg","img/product/detail/58985861N615a3581.jpg"),
(NULL, 37, "img/product/detail/58985867Nf8909d49.jpg","img/product/detail/58985867Nf8909d49.jpg","img/product/detail/58985867Nf8909d49.jpg"),
(NULL, 37, "img/product/detail/5898586cNe235284b.jpg","img/product/detail/5898586cNe235284b.jpg","img/product/detail/5898586cNe235284b.jpg"),
(NULL, 37, "img/product/detail/58985881N0a78dea2.jpg","img/product/detail/58985881N0a78dea2.jpg","img/product/detail/58985881N0a78dea2.jpg"),
(NULL, 37, "img/product/detail/58985883Nd4aec745.jpg","img/product/detail/58985883Nd4aec745.jpg","img/product/detail/58985883Nd4aec745.jpg"),
(NULL, 37, "img/product/detail/5836b979N85c3852b.jpg","img/product/detail/5836b979N85c3852b.jpg","img/product/detail/5836b979N85c3852b.jpg"),
(NULL, 37, "img/product/detail/5836b981Nd60fd02a.jpg","img/product/detail/5836b981Nd60fd02a.jpg","img/product/detail/5836b981Nd60fd02a.jpg"),
(NULL, 38, "img/product/detail/58a2c667Ne2b5cb73.jpg","img/product/detail/58a2c667Ne2b5cb73.jpg","img/product/detail/58a2c667Ne2b5cb73.jpg"),
(NULL, 38, "img/product/detail/58a2c668N800be261.jpg","img/product/detail/58a2c668N800be261.jpg","img/product/detail/58a2c668N800be261.jpg"),
(NULL, 38, "img/product/detail/58a2c668N0159a26f.jpg","img/product/detail/58a2c668N0159a26f.jpg","img/product/detail/58a2c668N0159a26f.jpg"),
(NULL, 38, "img/product/detail/58a2c669Nf884ac31.jpg","img/product/detail/58a2c669Nf884ac31.jpg","img/product/detail/58a2c669Nf884ac31.jpg"),
(NULL, 38, "img/product/detail/58a2c668N7293a0d1.jpg","img/product/detail/58a2c668N7293a0d1.jpg","img/product/detail/58a2c668N7293a0d1.jpg"),
(NULL, 38, "img/product/detail/58a2c669N4f92f8cb.jpg","img/product/detail/58a2c669N4f92f8cb.jpg","img/product/detail/58a2c669N4f92f8cb.jpg"),
(NULL, 38, "img/product/detail/58a2c668N0be41fb0.jpg","img/product/detail/58a2c668N0be41fb0.jpg","img/product/detail/58a2c668N0be41fb0.jpg"),
(NULL, 38, "img/product/detail/58a2c66aNcd10ee32.jpg","img/product/detail/58a2c66aNcd10ee32.jpg","img/product/detail/58a2c66aNcd10ee32.jpg"),
(NULL, 39, "img/product/detail/58a2c667Ne2b5cb73.jpg","img/product/detail/58a2c667Ne2b5cb73.jpg","img/product/detail/58a2c667Ne2b5cb73.jpg"),
(NULL, 39, "img/product/detail/58a2c668N800be261.jpg","img/product/detail/58a2c668N800be261.jpg","img/product/detail/58a2c668N800be261.jpg"),
(NULL, 39, "img/product/detail/58a2c668N0159a26f.jpg","img/product/detail/58a2c668N0159a26f.jpg","img/product/detail/58a2c668N0159a26f.jpg"),
(NULL, 39, "img/product/detail/58a2c669Nf884ac31.jpg","img/product/detail/58a2c669Nf884ac31.jpg","img/product/detail/58a2c669Nf884ac31.jpg"),
(NULL, 39, "img/product/detail/58a2c668N7293a0d1.jpg","img/product/detail/58a2c668N7293a0d1.jpg","img/product/detail/58a2c668N7293a0d1.jpg"),
(NULL, 39, "img/product/detail/58a2c669N4f92f8cb.jpg","img/product/detail/58a2c669N4f92f8cb.jpg","img/product/detail/58a2c669N4f92f8cb.jpg"),
(NULL, 39, "img/product/detail/58a2c668N0be41fb0.jpg","img/product/detail/58a2c668N0be41fb0.jpg","img/product/detail/58a2c668N0be41fb0.jpg"),
(NULL, 39, "img/product/detail/58a2c66aNcd10ee32.jpg","img/product/detail/58a2c66aNcd10ee32.jpg","img/product/detail/58a2c66aNcd10ee32.jpg"),
(NULL, 40, "img/product/detail/58a2c667Ne2b5cb73.jpg","img/product/detail/58a2c667Ne2b5cb73.jpg","img/product/detail/58a2c667Ne2b5cb73.jpg"),
(NULL, 40, "img/product/detail/58a2c668N800be261.jpg","img/product/detail/58a2c668N800be261.jpg","img/product/detail/58a2c668N800be261.jpg"),
(NULL, 40, "img/product/detail/58a2c668N0159a26f.jpg","img/product/detail/58a2c668N0159a26f.jpg","img/product/detail/58a2c668N0159a26f.jpg"),
(NULL, 40, "img/product/detail/58a2c669Nf884ac31.jpg","img/product/detail/58a2c669Nf884ac31.jpg","img/product/detail/58a2c669Nf884ac31.jpg"),
(NULL, 40, "img/product/detail/58a2c668N7293a0d1.jpg","img/product/detail/58a2c668N7293a0d1.jpg","img/product/detail/58a2c668N7293a0d1.jpg"),
(NULL, 40, "img/product/detail/58a2c669N4f92f8cb.jpg","img/product/detail/58a2c669N4f92f8cb.jpg","img/product/detail/58a2c669N4f92f8cb.jpg"),
(NULL, 40, "img/product/detail/58a2c668N0be41fb0.jpg","img/product/detail/58a2c668N0be41fb0.jpg","img/product/detail/58a2c668N0be41fb0.jpg"),
(NULL, 40, "img/product/detail/58a2c66aNcd10ee32.jpg","img/product/detail/58a2c66aNcd10ee32.jpg","img/product/detail/58a2c66aNcd10ee32.jpg"),
(NULL, 41, "img/product/detail/58a2c667Ne2b5cb73.jpg","img/product/detail/58a2c667Ne2b5cb73.jpg","img/product/detail/58a2c667Ne2b5cb73.jpg"),
(NULL, 41, "img/product/detail/58a2c668N800be261.jpg","img/product/detail/58a2c668N800be261.jpg","img/product/detail/58a2c668N800be261.jpg"),
(NULL, 41, "img/product/detail/58a2c668N0159a26f.jpg","img/product/detail/58a2c668N0159a26f.jpg","img/product/detail/58a2c668N0159a26f.jpg"),
(NULL, 41, "img/product/detail/58a2c669Nf884ac31.jpg","img/product/detail/58a2c669Nf884ac31.jpg","img/product/detail/58a2c669Nf884ac31.jpg"),
(NULL, 41, "img/product/detail/58a2c668N7293a0d1.jpg","img/product/detail/58a2c668N7293a0d1.jpg","img/product/detail/58a2c668N7293a0d1.jpg"),
(NULL, 41, "img/product/detail/58a2c669N4f92f8cb.jpg","img/product/detail/58a2c669N4f92f8cb.jpg","img/product/detail/58a2c669N4f92f8cb.jpg"),
(NULL, 41, "img/product/detail/58a2c668N0be41fb0.jpg","img/product/detail/58a2c668N0be41fb0.jpg","img/product/detail/58a2c668N0be41fb0.jpg"),
(NULL, 41, "img/product/detail/58a2c66aNcd10ee32.jpg","img/product/detail/58a2c66aNcd10ee32.jpg","img/product/detail/58a2c66aNcd10ee32.jpg"),
(NULL, 42, "img/product/detail/58a2c667Ne2b5cb73.jpg","img/product/detail/58a2c667Ne2b5cb73.jpg","img/product/detail/58a2c667Ne2b5cb73.jpg"),
(NULL, 42, "img/product/detail/58a2c668N800be261.jpg","img/product/detail/58a2c668N800be261.jpg","img/product/detail/58a2c668N800be261.jpg"),
(NULL, 42, "img/product/detail/58a2c668N0159a26f.jpg","img/product/detail/58a2c668N0159a26f.jpg","img/product/detail/58a2c668N0159a26f.jpg"),
(NULL, 42, "img/product/detail/58a2c669Nf884ac31.jpg","img/product/detail/58a2c669Nf884ac31.jpg","img/product/detail/58a2c669Nf884ac31.jpg"),
(NULL, 42, "img/product/detail/58a2c668N7293a0d1.jpg","img/product/detail/58a2c668N7293a0d1.jpg","img/product/detail/58a2c668N7293a0d1.jpg"),
(NULL, 42, "img/product/detail/58a2c669N4f92f8cb.jpg","img/product/detail/58a2c669N4f92f8cb.jpg","img/product/detail/58a2c669N4f92f8cb.jpg"),
(NULL, 42, "img/product/detail/58a2c668N0be41fb0.jpg","img/product/detail/58a2c668N0be41fb0.jpg","img/product/detail/58a2c668N0be41fb0.jpg"),
(NULL, 42, "img/product/detail/58a2c66aNcd10ee32.jpg","img/product/detail/58a2c66aNcd10ee32.jpg","img/product/detail/58a2c66aNcd10ee32.jpg"),
(NULL, 43, "img/product/detail/58a2c667Ne2b5cb73.jpg","img/product/detail/58a2c667Ne2b5cb73.jpg","img/product/detail/58a2c667Ne2b5cb73.jpg"),
(NULL, 43, "img/product/detail/58a2c668N800be261.jpg","img/product/detail/58a2c668N800be261.jpg","img/product/detail/58a2c668N800be261.jpg"),
(NULL, 43, "img/product/detail/58a2c668N0159a26f.jpg","img/product/detail/58a2c668N0159a26f.jpg","img/product/detail/58a2c668N0159a26f.jpg"),
(NULL, 43, "img/product/detail/58a2c669Nf884ac31.jpg","img/product/detail/58a2c669Nf884ac31.jpg","img/product/detail/58a2c669Nf884ac31.jpg"),
(NULL, 43, "img/product/detail/58a2c668N7293a0d1.jpg","img/product/detail/58a2c668N7293a0d1.jpg","img/product/detail/58a2c668N7293a0d1.jpg"),
(NULL, 43, "img/product/detail/58a2c669N4f92f8cb.jpg","img/product/detail/58a2c669N4f92f8cb.jpg","img/product/detail/58a2c669N4f92f8cb.jpg"),
(NULL, 43, "img/product/detail/58a2c668N0be41fb0.jpg","img/product/detail/58a2c668N0be41fb0.jpg","img/product/detail/58a2c668N0be41fb0.jpg"),
(NULL, 43, "img/product/detail/58a2c66aNcd10ee32.jpg","img/product/detail/58a2c66aNcd10ee32.jpg","img/product/detail/58a2c66aNcd10ee32.jpg");
*/
/**用户信息**/
/*INSERT INTO user VALUES
(NULL, "dingding", "123456", "ding@qq.com", "13501234567", "img/avatar/default.png", "丁伟", "1"),
(NULL, "dangdang", "123456", "dang@qq.com", "13501234568", "img/avatar/default.png", "林当", "1"),
(NULL, "doudou", "123456", "dou@qq.com", "13501234569", "img/avatar/default.png", "窦志强", "1"),
(NULL, "yaya", "123456", "ya@qq.com", "13501234560", "img/avatar/default.png", "秦小雅", "0");
*/
/****首页轮播广告商品****/
INSERT INTO index_carousel
VALUES
  (NULL, "img/index/banner1.jpg", "轮播广告商品1", "product-details.html?lid=28"),
  (NULL, "img/index/banner2.jpg", "轮播广告商品2", "product-details.html?lid=19"),
  (NULL, "img/index/banner3.jpg", "轮播广告商品3", "lookforward.html"),
  (NULL, "img/index/banner4.jpg", "轮播广告商品4", "lookforward.html");

/****首页商品-猫咪主粮****/
INSERT INTO index_recommend
VALUES
  (NULL, 1, null, null, null, null, "img/index_recommend/5c40353a9a516f63316c79b9f5aaa71a.jpg", null, null, null, null, null, 1, null, null),
  (NULL, 1, "比瑞吉", "天然甄选", null, null, "img/index_recommend/1.jpg", null, null, 1, null, null, null, null, null),
  (NULL, 1, "发育宝 三拼肉宴", "冷冻干技术 留住新鲜", null, null, "img/index_recommend/2.jpg", null, null, 2, null, null, null, null, null),
  (NULL, 1, "室内成猫粮去毛球配方", "促进肠道毛球排出", null, null, "img/index_recommend/3.jpg", null, null, 3, null, null, null, null, null),
  (NULL, 1, "玫斯", "肠道护理", null, null, "img/index_recommend/4.jpg", null, null, 4, null, null, null, null, null),
  (NULL, 1, "比瑞吉", "均衡营养", null, null, "img/index_recommend/5.jpg", null, null, 5, null, null, null, null, null),
  (NULL, 1, "比瑞吉", "高性价比", null, null, "img/index_recommend/6.jpg", null, null, 6, null, null, null, null, null),
  (NULL, 1, null, null, "加拿大原装进口 原野猎食渴望 全肉配方全猫粮 1.8kg", "加拿大原装进口 天然草本精华 营养丰富全面", "img/index_recommend/856a385dc703c2e752df6e566f7f99dc.jpg", 285.00, null, null, 1, null, null, null, null),
  (NULL, 1, null, null, "加拿大原装进口 原野猎食渴望 六种鲜鱼 全猫粮 1.8kg", "加拿大原装 17新款鲜鱼成分提升到85% 美毛/健体", "img/index_recommend/c4a0f85e8647963bd69d2a39a9b1c098.jpg", 320.00, null, null, 2, null, null, null, null),
  (NULL, 1, null, null, "海洋之星 三文鱼配方 全猫粮 1.5kg", "英国品牌 抗敏感美毛无谷天然粮 减轻肾脏压力 利于尿道健康", "img/index_recommend/14bdd5c7982711519a91d170f627617c.jpg", 180.00, null, null, 3, null, null, null, null),
  (NULL, 1, null, null, "海洋之星 鲭鱼配方 全猫粮 1.5kg", "英国品牌 抗敏感 减轻肾脏压力", "img/index_recommend/24abf575fda96552634f3820d66f3fe9.jpg", 180.00, null, null, 4, null, null, null, null),
  (NULL, 1, null, null, "贵族Natures Gift 营养仔母猫幼猫粮 10kg", "澳大利亚品牌 鸸鹋油美毛 提亮毛色 维护泌尿系统健康", "img/index_recommend/b37a79c548e3c6c0bec9ce25cc9a590e.jpg", 280.00, null, null, 5, null, null, null, null),
  (NULL, 1, null, null, "贵族Natures Gift 营养仔母猫幼猫粮 1kg", "澳大利亚品牌 鸸鹋油美毛 提亮毛色 维护泌尿系统健康", "img/index_recommend/ddfff8898f1c19ad514a09e1b4d75e1e.jpg", 36.00, null, null, 6, null, null, null, null),
  (NULL, 1, null, null, "耐吉斯SOLUTION 鸡肉三文鱼幼猫粮 1.36kg", "肠胃保健配方 无谷低敏天然粮 促进大脑发育 强壮骨齿 强化消化和免疫", "img/index_recommend/b5641145ebce704bebbe6a65d5158428.jpg", 135.00, null, null, 7, null, null, null, null),
  (NULL, 1, null, null, "贵族Natures Gift 三文鱼蔬果配方全猫粮 7kg", "澳大利亚品牌 鸸鹋油美毛 清除毛球 改善泌尿系统", "img/index_recommend/774767a9820ab1fb03d1f3b53db7ae01.jpg", 320.00, null, null, 8, null, null, null, null),
  (NULL, 1, null, null, "皇家royal canin K36幼猫/怀孕哺乳母猫粮 2kg", "包装更换 新老包装随机发", "img/index_recommend/c16c09b5f1228d2a23861e514080b2fe.jpg", 135.00, null, null, null, 1, null, null, null),
  (NULL, 1, null, null, "纯皓Nutrifresh 鸡鸭肉配方天然无谷成猫粮 1.2kg", "80%肉类含量 营养均衡 天然食材 维护泌尿系统健康", "img/index_recommend/f07d993fe957c89cb9714b633b901e7a.jpg", 110.00, null, null, null, 2, null, null, null),
  (NULL, 1, null, null, "喜乐比SharlovY 三文鱼鸡肉毛球控制配方成猫粮1.4kg", "天然果蔬纤维 有效控制毛球排除 高性价比", "img/index_recommend/6e369b89877bb012c00369637f203cc6.jpg", 37.80, null, null, null, 3, null, null, null),
  (NULL, 1, null, null, "喜乐比SharlovY 三文鱼金枪鱼蛋白活力配方全猫粮1.4kg", "丰富蔬果 增强活力", "img/index_recommend/89031b62d0e9ad94a75ee2ac8d1cdda9.jpg", 38.00, null, null, null, 4, null, null, null),
  (NULL, 1, null, null, "比瑞吉 基础呵护系列 全价幼猫怀孕及哺乳猫粮 2kg", null, "img/index_recommend/b136af2eef265ee81dadaf3b15668168.jpg", 125.00, null, null, null, 5, null, null, null),
  (NULL, 1, null, null, "比瑞吉 基础呵护系列 全价室内成猫粮 2kg", "天然好消化 促进脑部发育 全面助成长", "img/index_recommend/8582e47d3605f8de85deb744000618c4.jpg", 145.00, null, null, null, 6, null, null, null),
  (NULL, 1, null, null, "伯纳天纯 无谷怀孕/哺乳期幼猫专用粮 1.5kg", "天然无谷粮 幼猫专用 增强免疫力 母乳配方 防治腹泻 进口深海冷水鱼肉", "img/index_recommend/a450344dbc44742bebde195d2db428f3.jpg", 128.00, null, null, null, 7, null, null, null),
  (NULL, 1, null, null, "伯纳天纯 无谷金枪鱼肉成猫专用 1.5kg", "成猫猫粮 优化体态 保护泌尿系统 改善粪便臭味 去毛球配方", "img/index_recommend/3f9f8d871afa9a1653917bf595d740e9.jpg", 119.00, null, null, null, 8, null, null, null),
  (NULL, 1, "98%含肉量", null, null, null, null, null, null, null, null, null, null, 1, null),
  (NULL, 1, "性价比猫粮", null, null, null, null, null, null, null, null, null, null, 2, null),
  (NULL, 1, "海洋之星", null, null, null, null, null, null, null, null, null, null, 3, null),
  (NULL, 1, "牛油果", null, null, null, null, null, null, null, null, null, null, 4, null),
  (NULL, 1, "天然蓝氏", null, null, null, null, null, null, null, null, null, null, 5, null),
  (NULL, 1, "人气口粮", null, null, null, null, null, null, null, null, null, null, 6, null),
  (NULL, 1, "雷米高", null, null, null, null, null, null, null, null, null, null, 7, null),
  (NULL, 1, "皇室", null, null, null, null, null, null, null, null, null, null, 8, null),
  (NULL, 1, "冠能猫粮", null, null, null, null, null, null, null, null, null, null, 9, null),
  (NULL, 1, null, null, null, null, "img/index_recommend/64ac5fd97740cb0fab0cfe3eac1d27f7.jpg", null, null, null, null, null, null, null, 1),
  (NULL, 1, null, null, null, null, "img/index_recommend/92371ab34de0ea12b67028d6625c5180.jpg", null, null, null, null, null, null, null, 2),
  (NULL, 1, null, null, null, null, "img/index_recommend/c2adde2885a24e1152d744524a1d2c67.jpg", null, null, null, null, null, null, null, 3),
  (NULL, 1, null, null, null, null, "img/index_recommend/8643f958ef499300310455b651df5786.jpg", null, null, null, null, null, null, null, 4),
  (NULL, 1, null, null, null, null, "img/index_recommend/be154a44b9b868bf497d0404f44fb5dd.jpg", null, null, null, null, null, null, null, 5),
  (NULL, 1, null, null, null, null, "img/index_recommend/5954f54fb0dc4c466c1d663195264281.jpg", null, null, null, null, null, null, null, 6),
  (NULL, 1, null, null, null, null, "img/index_recommend/d785734027f9d242b80080a25efa0582.jpg", null, null, null, null, null, null, null, 7),
  (NULL, 1, null, null, null, null, "img/index_recommend/a28772411fc9851363c580fd015ade41.jpg", null, null, null, null, null, null, null, 8),
  (NULL, 2, null, null, null, null, "img/index_recommend/93103aa829ea9c54b0424fd230c8afdf.jpg", null, null, null, null, null, 1, null, null),
  (NULL, 2, "爱普是 猫罐", "英伦贵族之选", null, null, "img/index_recommend/dd6d46e95791e36727187a238ed3c9d6.jpg", null, null, 1, null, null, null, null, null),
  (NULL, 2, "法丽 微汤猫罐", "鲜美风味 爱不释口", null, null, "img/index_recommend/bf9bc3a9bd9acb6489d520d79952f1ca.jpg", null, null, 2, null, null, null, null, null),
  (NULL, 2, "艾喜亚猫罐", "柔软奶糊型", null, null, "img/index_recommend/88a764d8ab6bf94980c1986119efec58.jpg", null, null, 3, null, null, null, null, null),
  (NULL, 2, "鸡肉鲜封包", "最美小食", null, null, "img/index_recommend/85a1934ef133343866cc9fef4cd67da3.jpg", null, null, 4, null, null, null, null, null),
  (NULL, 2, "拍拖宝贝", "美味营养鱼片", null, null, "img/index_recommend/6b2ab85ba995b4d9348d81f47d19ebff.jpg", null, null, 5, null, null, null, null, null),
  (NULL, 2, "意大利品牌", "健康主义猫罐", null, null, "img/index_recommend/cd06aca7f90070358957210600fb9b2a.jpg", null, null, 6, null, null, null, null, null),
  (NULL, 2, null, null, "海洋之星 天然猫罐头 鲔鱼+三文鱼 70g", "英国品牌 高鱼肉含量 天然猫罐头 挑战猫咪挑剔味蕾", "img/index_recommend/fe1f0b162cc08e395786d624154cfee2.jpg",10.00, null, null, 1, null, null, null, null),
  (NULL, 2, null, null, "德国原装进口骏宝Gimpet 吞拿鱼幼猫猫罐头 70g", "ShinyCat系列 天然营养 香滑可口", "img/index_recommend/b4b340296174cb7f2d40d38bc93fae85.jpg",12.00, null, null, 2, null, null, null, null),
  (NULL, 2, null, null, "希宝sheba 啫喱系列 吞拿鱼及翡翠明虾罐头 85g", "日本品牌猫罐 泰国生产原装进口 金装白肉罐头", "img/index_recommend/66a6ddc53d2ed38f76e919d5e1b49000.jpg",9.90, null, null, 3, null, null, null, null),
  (NULL, 2, null, null, "顽皮Wanpy 鸡肉慕斯配方 猫罐头 95g", "慕斯罐头系列 易消化 助发育 强化免疫", "img/index_recommend/b25b22e8743e2d2ca95f6550df4b8485.jpg",4.50, null, null, 4, null, null, null, null),
  (NULL, 2, null, null, "顽皮Wanpy 金枪鱼慕斯配方 猫罐头 95g", "慕斯罐头系列 易消化 助发育 强化免疫", "img/index_recommend/2bc694484488d4a4280e5fc81a7e7f04.jpg",4.50, null, null, 5, null, null, null, null),
  (NULL, 2, null, null, "泰国进口雪诗雅Schesir 猫罐头 天然水果系列 鸡肉+菠萝 75g", "意大利品牌 含消化酶 抗炎助消化", "img/index_recommend/fddaefd6946405a0d675a1c7f871723d.jpg",12.50, null, null, 6, null, null, null, null),
  (NULL, 2, null, null, "泰国进口雪诗雅Schesir 水煮系列 天然吞拿鱼芦荟饭幼猫罐头 140g", "意大利品牌 亮泽皮毛 健康心脏", "img/index_recommend/ddeb75826fe2f129ecf0784671ca6717.jpg",17.00, null, null, 7, null, null, null, null),
  (NULL, 2, null, null, "法丽 吞拿鱼佐鲷鱼化毛配方猫罐头 80g", "大片鱼肉 天然纤维防止毛球集结", "img/index_recommend/1f58a983f3120558e794c6f54aa98c1a.jpg",12.00, null, null, 8, null, null, null, null),
  (NULL, 2, null, null, "路斯 猫用小鱼饼干 金枪鱼+猫薄荷 80g", "猫咪的专属饼干 营养均衡 控制毛球", "img/index_recommend/ef307209a90590e3999c337864a13674.jpg",9.90, null, null, null, 1, null, null, null),
  (NULL, 2, null, null, "柏可心 薄荷饼干（馋嘴猫配方）100g", "天然猫草系列 高适口性馋嘴猫专食 帮助消化 增强运动量", "img/index_recommend/0e97d14343e112fdee06831f138e4805.jpg",15.50, null, null, null, 2, null, null, null),
  (NULL, 2, null, null, "柏可心 蛋黄夹心小饼干 芝士+鸡肉 100g", "猫夹心系列 去除毛球 保持理想体态 增强免疫力", "img/index_recommend/ae35599f3611bdb2909f6243f1781347.jpg",14.90, null, null, null, 3, null, null, null),
  (NULL, 2, null, null, "柏可心 蛋黄夹心小饼干 芝士+牛肉 100g", "猫夹心系列 舒适肠道 保持理想体态 增强免疫力", "img/index_recommend/887c608d05643472a59e7bbb0ecdf614.jpg",14.90, null, null, null, 4, null, null, null),
  (NULL, 2, null, null, "柏可心 蛋黄夹心猫咪小饼干 芝士+深海鱼 100g", "猫夹心系列 美毛润泽 防止牙结石 增强免疫力", "img/index_recommend/ec4e38a17a4eb99fb889a31d4eaac7c8.jpg",14.90, null, null, null, 5, null, null, null),
  (NULL, 2, null, null, "柏可心 薄荷饼干（轻盈低脂）100g", "天然猫草系列 专利低脂配方 预防肥胖", "img/index_recommend/77b2e3baaa642becb58da749d454cda9.jpg",15.50, null, null, null, 6, null, null, null),
  (NULL, 2, null, null, "柏可心 薄荷饼干（美毛低过敏）100g", "天然猫草系列 添加亚麻籽油 丰富的欧米茄3、欧米茄6 低敏美毛", "img/index_recommend/453aae6bd43fac38f99244d466eecfd2.jpg",15.50, null, null, null, 7, null, null, null),
  (NULL, 2, null, null, "柏可心 薄荷饼干（关节护理） 100g", "天然猫草系列 补充钙质 添加软骨素修复软骨组织", "img/index_recommend/c67f33d72f2efa0c888dd7dd97d6b05f.jpg",15.50, null, null, null, 8, null, null, null),
  (NULL, 2, "希宝", null, null, null, null, null, null, null, null, null, null, 1, null),
  (NULL, 2, "梦吉猫罐", null, null, null, null, null, null, null, null, null, null, 2, null),
  (NULL, 2, "爱普士猫罐", null, null, null, null, null, null, null, null, null, null, 3, null),
  (NULL, 2, "爱丽丝猫罐", null, null, null, null, null, null, null, null, null, null, 4, null),
  (NULL, 2, "巅峰猫罐", null, null, null, null, null, null, null, null, null, null, 5, null),
  (NULL, 2, "纽崔宝猫罐", null, null, null, null, null, null, null, null, null, null, 6, null),
  (NULL, 2, "雪山猫罐", null, null, null, null, null, null, null, null, null, null, 7, null),
  (NULL, 2, "K9Natural", null, null, null, null, null, null, null, null, null, null, 8, null),
  (NULL, 2, "柏可心鱼干", null, null, null, null, null, null, null, null, null, null, 9, null),
  (NULL, 2, null, null, null, null, "img/index_recommend/589ccb6aed3c46c7d037b0ac312a6c1c.jpg", null, null, null, null, null, null, null, 1),
  (NULL, 2, null, null, null, null, "img/index_recommend/59e11953d3b48f7011e5bac036da6658.jpg", null, null, null, null, null, null, null, 2),
  (NULL, 2, null, null, null, null, "img/index_recommend/abb0bc9e2162175c4d18c1ef67c59b17.jpg", null, null, null, null, null, null, null, 3),
  (NULL, 2, null, null, null, null, "img/index_recommend/d0d206328de0321550d7e6f45ee9b5c7.jpg", null, null, null, null, null, null, null, 4),
  (NULL, 2, null, null, null, null, "img/index_recommend/eb46485ed099685d0cd3de77d92c96f1.jpg", null, null, null, null, null, null, null, 5),
  (NULL, 2, null, null, null, null, "img/index_recommend/031251dd13ed7a8fe50358a6f8b62621.jpg", null, null, null, null, null, null, null, 6),
  (NULL, 2, null, null, null, null, "img/index_recommend/72c7149e947743b87b6616459a6150b3.jpg", null, null, null, null, null, null, null, 7),
  (NULL, 2, null, null, null, null, "img/index_recommend/86b600f0f02d9393e99bf3e3c5fcc550.jpg", null, null, null, null, null, null, null, 8),
  (NULL, 3, null, null, null, null, "img/index_recommend/295bf8999198412d3565238995f168a8.jpg", null, null, null, null, null, 1, null, null),
  (NULL, 3, "发育宝 猫用米露可零乳糖奶", "新西兰纯净奶源", null, null, "img/index_recommend/960ad8a45f89b31aafe3bfaea1ea1cef.jpg", null, null, 1, null, null, null, null, null),
  (NULL, 3, "福来恩", "驱虫首选 全国热销", null, null, "img/index_recommend/90880169ce61134bf4518acad253610c.jpg", null, null, 2, null, null, null, null, null),
  (NULL, 3, "实力保健医疗", "源自美国伊士高", null, null, "img/index_recommend/d50d778ba24968b1daad3e511eedeedf.jpg", null, null, 3, null, null, null, null, null),
  (NULL, 3, "卫士 宠物营养专家", "科学配方 只为爱宠", null, null, "img/index_recommend/133eaeca98f82e0db38b1ffd4b875258.jpg", null, null, 4, null, null, null, null, null),
  (NULL, 3, "先木事 美国原装进口", "初乳营养 最接近妈妈的味道", null, null, "img/index_recommend/854715bb907080e229a1c6be756f41b0.jpg", null, null, 5, null, null, null, null, null),
  (NULL, 3, "韩国乐高", "消食化积", null, null, "img/index_recommend/dfb2fbd6c96a6880eb105ffe0937c6a9.jpg", null, null, 6, null, null, null, null, null),
  (NULL, 3, null, null, "雷米高 驱虫一粒清 0.2g*4片", "体内驱虫药 用于线虫/绦虫/吸虫 杀灭成幼虫及虫卵", "img/index_recommend/f820e73631fab4d5abe21f2a94ed421b.jpg", 25.00, null, null, 1, null, null, null, null),
  (NULL, 3, null, null, "新宠之康 肠虫清宠物驱虫片 牛肉味咀嚼片 700mg*2片", "广谱高效驱虫药 有效驱杀体内寄生虫 蛔虫 绦虫", "img/index_recommend/3a842828977a2deaebf05d2f2981c1b9.jpg", 19.00, null, null, 2, null, null, null, null),
  (NULL, 3, null, null, "AKC 必威宠物犬用驱虫药 一盒100片", "医仕高总代 专业医疗保健品牌", "img/index_recommend/2783918293983ec07c3b51aa6ef7d462.jpg", 800.00, null, null, 3, null, null, null, null),
  (NULL, 3, null, null, "澳洲和康达 猫用驱虫药 拆零1粒", "医仕高总代 广谱除虫药 预防治疗蛔虫/绦虫/钩虫/吸血虫等各种寄生虫", "img/index_recommend/7088dd93f01b8808683423bb2ac37bc4.jpg", 2.02, null, null, 4, null, null, null, null),
  (NULL, 3, null, null, "普拿杜Polato25 猫用体内驱虫药 12粒装 通用版", "驱杀效果佳 安全度高", "img/index_recommend/27c50e0f48ee39812bb696eebe154527.jpg", 58.00, null, null, 5, null, null, null, null),
  (NULL, 3, null, null, "POG 猫用广谱驱虫药（阿苯达唑） 6粒装", "快速杀灭寄生虫", "img/index_recommend/81dc96d6915763fb21843a93272da99f.jpg", 36.00, null, null, 6, null, null, null, null),
  (NULL, 3, null, null, "POG 宠物医疗系列 宠物弓形体/虫及球虫 1盒（10袋*3片）", "包装升级新老随机发 抗菌抗原虫 预防治疗弓形虫/球虫", "img/index_recommend/1c34e669fd3f9bf67999e3858453d574.jpg", 160.00, null, null, 7, null, null, null, null),
  (NULL, 3, null, null, "湃特安琪儿 猫专用驱虫药 肠虫宁咀嚼片 牛肉味500mg/片*4片", "500mg/片*4片 2.5kg以上体重的猫犬使用", "img/index_recommend/197f1ca1f5567b8f448d3ecddd01385a.png", 28.00, null, null, 8, null, null, null, null),
  (NULL, 3, null, null, "福来恩 猫用增效滴剂 加强版 整盒3支装", "新老包装随机 杀灭及预防跳蚤/虫卵/幼虫 8周以上猫猫", "img/index_recommend/9a5b4b8aab32e1c7babb0ee28c0dd956.jpg", 135.00, null, null, null, 1, null, null, null),
  (NULL, 3, null, null, "福来恩 宠物非波罗尼喷剂 2日龄以上 100ml", "新老包装随机 杀灭跳蚤/蜱虫 4小时杀成虫", "img/index_recommend/c44e4223591c627777a4808ad6971abd.jpg", 107.00, null, null, null, 2, null, null, null),
  (NULL, 3, null, null, "法国梅里亚 福来恩非泼罗尼猫用喷剂 杀灭预防双效合一", "新老包装随机 杀灭跳蚤/蜱虫 4小时杀成虫", "img/index_recommend/05740a35001a3c04eb69b2a23dc27c62.jpg", 189.00, null, null, null, 3, null, null, null),
  (NULL, 3, null, null, "魔金Magic 猫用除虱灭蚤滴剂 3支装", "驱除虱蚤 迅速见效 安全环保 适合3月龄以上的宠物", "img/index_recommend/887c608d05643472a59e7bbb0ecdf614.jpg", 23.00, null, null, null, 4, null, null, null),
  (NULL, 3, null, null, "【猫用】湃特安琪儿 蚤安易喷剂（医院专供）110ml", "针对虱子/跳蚤/蜱虫/耳螨等", "img/index_recommend/a6b6bd94bd0922352f80fdc394489ee7.jpg", 45.00, null, null, null, 5, null, null, null),
  (NULL, 3, null, null, "德国拜耳 心疥爽（爱沃克）Advocate80 猫专用滴剂 4-8kg", "预防心丝虫/疥螨 避免跳蚤叮咬", "img/index_recommend/e3d75865fa3f62a428c407ab6812cb4a.jpg", 238.00, null, null, null, 6, null, null, null),
  (NULL, 3, null, null, "雷米高 蚤螨清香茅驱虫喷剂 60ml", "驱除蚊虫/蜱虫/虱子等体外寄生虫", "img/index_recommend/e876a19a5034c61ee4eafcd94a6fd452.jpg", 38.00, null, null, null, 7, null, null, null),
  (NULL, 3, null, null, "瑞士BIOCARE 蜱虱消专用灭虫剂 500ml", "彻底杀死蜱蚤螨等体外寄生虫 防止滋生 安全有效", "img/index_recommend/ff7a48eaf8efea31d99137be7c76140d.jpg", 37.20, null, null, null, 8, null, null, null),
  (NULL, 3, "菲派", null, null, null, null, null, null, null, null, null, null, 1, null),
  (NULL, 3, "营养专家", null, null, null, null, null, null, null, null, null, null, 2, null),
  (NULL, 3, "医仕高", null, null, null, null, null, null, null, null, null, null, 3, null),
  (NULL, 3, "AKC", null, null, null, null, null, null, null, null, null, null, 4, null),
  (NULL, 3, "先牧仕羊奶粉", null, null, null, null, null, null, null, null, null, null, 5, null),
  (NULL, 3, "驱蚤项圈", null, null, null, null, null, null, null, null, null, null, 6, null),
  (NULL, 3, "福来恩", null, null, null, null, null, null, null, null, null, null, 7, null),
  (NULL, 3, "麦高臣神仙水", null, null, null, null, null, null, null, null, null, null, 8, null),
  (NULL, 3, "Eye Envy", null, null, null, null, null, null, null, null, null, null, 9, null),
  (NULL, 3, null, null, null, null, "img/index_recommend/7f05c5e0fb15da2f14748c19d23a7334.jpg", null, null, null, null, null, null, null, 1),
  (NULL, 3, null, null, null, null, "img/index_recommend/4c37fc2c6578742b2a7747c135c5aef4.jpg", null, null, null, null, null, null, null, 2),
  (NULL, 3, null, null, null, null, "img/index_recommend/c9b30036ec5701bb038d0dbb3dfbbc06.jpg", null, null, null, null, null, null, null, 3),
  (NULL, 3, null, null, null, null, "img/index_recommend/31b7dfdd08ce602f1239ae8ce7954802.jpg", null, null, null, null, null, null, null, 4),
  (NULL, 3, null, null, null, null, "img/index_recommend/4942dd1fe05aadf32a8cc09d1ea5e9a3.jpg", null, null, null, null, null, null, null, 5),
  (NULL, 3, null, null, null, null, "img/index_recommend/276527f25e9151ef48b0b8d2dba79d29.jpg", null, null, null, null, null, null, null, 6),
  (NULL, 3, null, null, null, null, "img/index_recommend/2a7c8efcc191a03430fe2af6df594d4a.jpg", null, null, null, null, null, null, null, 7),
  (NULL, 3, null, null, null, null, "img/index_recommend/391f999b1ce6300cbcc3fd4f9ab07c44.jpg", null, null, null, null, null, null, null, 8);