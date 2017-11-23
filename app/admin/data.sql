/*会员*/
insert into user(name,pwd,email,phone,info,face,uuid,addtime) values('鼠','1231','1231@123.com','13888888881','鼠','1f401.png','d32a72bdac524478b7e4f6dfc8394fc0',now());
insert into user(name,pwd,email,phone,info,face,uuid,addtime) values('牛','1232','1232@123.com','13888888882','牛','1f402.png','d32a72bdac524478b7e4f6dfc8394fc1',now());
insert into user(name,pwd,email,phone,info,face,uuid,addtime) values('虎','1233','1233@123.com','13888888883','虎','1f405.png','d32a72bdac524478b7e4f6dfc8394fc2',now());
insert into user(name,pwd,email,phone,info,face,uuid,addtime) values('兔','1234','1234@123.com','13888888884','兔','1f407.png','d32a72bdac524478b7e4f6dfc8394fc3',now());
insert into user(name,pwd,email,phone,info,face,uuid,addtime) values('龙','1235','1235@123.com','13888888885','龙','1f409.png','d32a72bdac524478b7e4f6dfc8394fc4',now());
insert into user(name,pwd,email,phone,info,face,uuid,addtime) values('蛇','1236','1236@123.com','13888888886','蛇','1f40d.png','d32a72bdac524478b7e4f6dfc8394fc5',now());
insert into user(name,pwd,email,phone,info,face,uuid,addtime) values('马','1237','1237@123.com','13888888887','马','1f434.png','d32a72bdac524478b7e4f6dfc8394fc6',now());
insert into user(name,pwd,email,phone,info,face,uuid,addtime) values('羊','1238','1238@123.com','13888888888','羊','1f411.png','d32a72bdac524478b7e4f6dfc8394fc7',now());
insert into user(name,pwd,email,phone,info,face,uuid,addtime) values('猴','1239','1239@123.com','13888888889','猴','1f412.png','d32a72bdac524478b7e4f6dfc8394fc8',now());
insert into user(name,pwd,email,phone,info,face,uuid,addtime) values('鸡','1240','1240@123.com','13888888891','鸡','1f413.png','d32a72bdac524478b7e4f6dfc8394fc9',now());
insert into user(name,pwd,email,phone,info,face,uuid,addtime) values('狗','1241','1241@123.com','13888888892','狗','1f415.png','d32a72bdac524478b7e4f6dfc8394fd0',now());
insert into user(name,pwd,email,phone,info,face,uuid,addtime) values('猪','1242','1242@123.com','13888888893','猪','1f416.png','d32a72bdac524478b7e4f6dfc8394fd1',now());


ALTER TABLE user auto_increment=1;
/*评论*/
insert into comment(movie_id,user_id,content,addtime) values(7,1,"好看",now());
insert into comment(movie_id,user_id,content,addtime) values(7,2,"不错",now());
insert into comment(movie_id,user_id,content,addtime) values(7,3,"经典",now());
insert into comment(movie_id,user_id,content,addtime) values(7,4,"给力",now());
insert into comment(movie_id,user_id,content,addtime) values(8,5,"难看",now());
insert into comment(movie_id,user_id,content,addtime) values(8,6,"无聊",now());
insert into comment(movie_id,user_id,content,addtime) values(8,7,"乏味",now());
insert into comment(movie_id,user_id,content,addtime) values(8,8,"无感",now());

ALTER TABLE comment auto_increment=1;

/*收藏*/
insert into moviecol(movie_id,user_id,addtime) values(7,1,now());
insert into moviecol(movie_id,user_id,addtime) values(7,2,now());
insert into moviecol(movie_id,user_id,addtime) values(7,3,now());
insert into moviecol(movie_id,user_id,addtime) values(7,4,now());
insert into moviecol(movie_id,user_id,addtime) values(8,5,now());
insert into moviecol(movie_id,user_id,addtime) values(8,6,now());
insert into moviecol(movie_id,user_id,addtime) values(8,7,now());
insert into moviecol(movie_id,user_id,addtime) values(8,8,now());

ALTER TABLE moviecol auto_increment=1;

/*会员登录日志*/
insert into userlog(user_id,ip,addtime) values(1,"192.168.4.1",now());
insert into userlog(user_id,ip,addtime) values(2,"192.168.4.2",now());
insert into userlog(user_id,ip,addtime) values(3,"192.168.4.3",now());
insert into userlog(user_id,ip,addtime) values(4,"192.168.4.4",now());
insert into userlog(user_id,ip,addtime) values(5,"192.168.4.5",now());
insert into userlog(user_id,ip,addtime) values(6,"192.168.4.6",now());
insert into userlog(user_id,ip,addtime) values(7,"192.168.4.7",now());
insert into userlog(user_id,ip,addtime) values(8,"192.168.4.8",now());
insert into userlog(user_id,ip,addtime) values(9,"192.168.4.9",now());

/*print(request.script_root);print(request.url_rule)*/