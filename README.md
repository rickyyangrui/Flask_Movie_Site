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

