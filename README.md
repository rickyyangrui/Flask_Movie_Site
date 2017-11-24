# Flask_Movie_Site

用Flask构建一个微电影视频网站。

## 为什么使用Flask？Python web框架大对比

> 1.Flask:Flask扩展丰富，不臃肿，可自由选择组合各种插件，性能优越，相比其他的web框架十分的轻量级，设计哲学很优雅，易于学习，小型的项目快速的开发，大型的项目也没压力。非常的灵活。

> 2.Django:Django是重量级全能型的web框架，功能完全，但是有点臃肿，自带的ORM和模板引擎，灵活和自由度不高，开发小型项目的时候显得臃肿和庞大，但是，Django仍然也非常的优秀。

> 3.Tornado:Tornado是一个强大的、支持协程、高效并发且可扩展的web服务器，Tornado的强大在可以利用它的异步协程机制开发高并发的服务器系统。

## Flask特点
* 轻量级web应用框架
* WSGI工具箱采用Werkzeug
* 模板引擎采用Jinja2
* Flask使用BSD授权
* 微内核框架
   * 称为“microframework”,简单的核心，用extension添加其功能。
   * 没有默认的数据库，窗体验证工具。
   * 保留扩展的弹性，可用Flask-extension加入这些功能：ORM、窗体验证工具、文件上传、各种开放式身份验证技术。
   
## 本项目采用的技术
* 使用整型、浮点型、路劲型、字符串型、正则表达式路由转换器；
* post、get请求、上传文件、cookie获取与响应、session、404处理；
* 模板自定义转义、定义过滤器、定义全局上下文处理器、Jinja2语法、包含继承、定义宏等；
* 使用Flask-wtf定义表单模型、字段类型、字段验证、视图处理表单、模板使用表单；
* Falsk-sqlalchemy定义数据库模型、添加数据、修改、查询、删除数据、数据库时间、数据迁移；
* 蓝图优化项目结构，实现网站的前台和后台的业务逻辑；

> 小扩展：什么是蓝图？

答：一个应用中或跨应用制作应用组件和支持通用的模式；

> 蓝图的作用？

* 将不同的功能模块化
* 构建大型的应用
* 优化项目的结构
* 增强可读性，易于维护

> 蓝图构建的目录

1.定义蓝图（app/admin/__init__.py）
```
from flask import Blueprint
admin = Blueprint("admin",__name__)
import views
```
2.注册蓝图（app/__init__.py）
```
from admin import admin as admin_blueprint
app.register_blueprint(admin_blueprint,url_prefix="/admin")
```
3.调用蓝图（app/admin/views.py）
```
from . improt admin
@admin.route("/")
```

## 主要结构

**项目前台包含**：会员登录及注册 / 会员中心 / 电影播放电影评论 / 电影收藏

**后台**：
* 管理员登录 / 修改密码 / 标签管理
* 电影管理 / 上映预告管理 / 会员管理
* 评论管理 / 收藏管理 / 角色管理
* 权限管理 / 管理员管理 / 日志管理

## 数据库设计

数据库绝对是开发中的重点，设计好了数据库，那么我们开发就成功了一半，可以看出数据库有多重要了。

> 对于前台的模型有以下几个表：
* 会员表（user）
* 会员登录日志（userlog）
* 标签表（tag）
* 电影表（movie）
* 上映预告（preview）
* 评论（comment）
* 电影收藏（moviecol）

其中的关系：

| 会员表（user）|          |
| ---------- | -----------|
| id   | 编号，整型，主键，自动递增   | 
| name   | 昵称，字符串型，唯一  | 
| pwd    | 密码，字符串型   |
| email  | 邮箱，字符串型，唯一   |
| phone  | 手机号码，字符串型，唯一   |
| info   | 个性简介，文本型   |
| face   | 头像，字符串型，唯一   |
| addtime| 添加时间，日期时间类型，默认当前十年   |
| uuid   | 唯一标识符，字符串型，唯一   |
| uerlog | 关联会员登录日志模型   |
| comments | 关联评论模型   |
| moviecols | 关联收藏模型   |
| 会员登录日志表（userlog）|      |     
| id     | 编号，整型，主键，自动递增   |
| user_id  | 所属会员ID，整型，关联user表的id字段 |
| ip     |  IP地址，字符串型   |
| addtime|  添加时间，日期时间类型，默认为当前的时间  |
| 标签表（tag） |              |
| id     | 编号，整型，主键，自动递增   |
| name   | 标题，字符串型，唯一   |
| addtime| 添加时间，日期时间类型，默认为当前的时间   |
| movies | 关联电影模型   |
| 电影表(movie)  |              |
| id     | 编号，整型，主键，自动递增   |
| title  | 标题，字符串型，唯一   |
| url    | 地址，字符串型，唯一   |
| info   | 简介，文本型   |
| logo   | 封面，字符串型，唯一 |
| star   | 星型，小整型   |
| playnum| 播放量，大整型 |
| commentnum| 评论量，大整型  |
| tag_id | 所属标签ID,整型，关联tag表的id字段  |
| area   | 上映地区，字符串类型 |
| release_time| 上映时间，日期类型 |
| length | 播放时间，字符串整型 |
| addtime| 添加时间，日期时间型，默认单前时间 |
| comments | 关联评论模型 |
| moviecols | 关联电影收藏模型|
| 上映预告（preview）|       |
| id     | 编号，整型，主键，自动递增   |
| title  | 标题，字符串型，唯一 |
| logo   | 封面，字符串型，唯一 |
| addtime| 添加时间，日期时间型，默认为当前时间 |
| 评论（comment）|      |
| id  | 编号，整型，主键，自动递增   |
| content| 内容，文本型 |
| movie_id | 所属电影ID，整型，关联movie表的id地段|
| user_id  | 所属用户ID，整型，关联user表的id字段 |
| addtime  | 添加时间，日期时间型，默认为当前时间 |
| 电影收藏（moviecol） |       |
| id  | 编号，整型，主键，自动递增   |
| movie_id | 所属电影ID，整型，关联movie表的id地段|
| user_id  | 所属用户ID，整型，关联user表的id字段 |
| addtime  | 添加时间，日期时间型，默认为当前时间 |

> 后台模型
* 权限表（auth）
* 角色表（role）
* 管理员表（admin）
* 管理员登录日志（adminlog）
* 操作日志（oplog）

| 权限表（auth）   |       |
| ---------- | -----------|
| id  | 编号，整型，主键，自动递增   |
| name | 名称，字符串型，唯一  |
| url  | 地址，字符串型，唯一  |
| addtime  | 添加时间，日期时间类型   |
| 角色表（role） |      |
| id  | 编号，整型，主键，自动递增   |
| name | 名称，字符串型，唯一  |
| auths  | 角色权限列表，字符串型   |
| addtime| 添加时间，日期时间类型，默认为当前时间 |
| admin  | 关联admin模型   |
| 管理员表（admin）  |      |
| id  | 编号，整型，主键，自动递增   |
| name | 管理员账号，字符串型，唯一  |
| pwd  | 管理员密码，字符串型  |
| is_super | 是否为超级管理员，小整型   |
| role_id  | 所属角色ID，模型，关联role表的id字段   |
| addtime  | 添加时间，日期时间类型，默认为当前时间   |
| adminlogs| 关联adminlog模型 |
| oplogs   | 关联oplog模型   |
| 管理员登录日志（adminlog） |       |
| id  | 编号，整型，主键，自动递增   |
| adminlog | 所属管理员id,整型，关联admin的id字段   |
| ip     | 登录IP,字符串型  |
| addtime   | 添加时间，日期时间类型，默认为当前时间   |
| 操作日志（oplog）  |      |
| id  | 编号，整型，主键，自动递增   |
| adminlog | 所属管理员ID， 整型， 管理admin的id字段  |
| ip   | 操作IP,字符串型  |
| reason | 操作原因，字符串型   |
| addtime| 添加时间，日期时间类型，默认为当前时间 |

## 运行本项目

其实很简单，用pycharm很快就能搭建好我们需要的环境，同时安装好mysql，在IED中输入：
```
python manage.py runserver
```

## 界面截图
主界面
![主界面](https://github.com/rickyyangrui/Flask_Movie_Site/blob/master/screenshoots/%E4%B8%BB%E7%95%8C%E9%9D%A2.png)
后台
![后台](https://github.com/rickyyangrui/Flask_Movie_Site/blob/master/screenshoots/%E5%90%8E%E5%8F%B0.png)













   
   
    


