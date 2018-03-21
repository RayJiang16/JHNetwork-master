# JHNetwork-master

二次封装的网络请求框架

### 使用

1.创建Server继承JHBaseServer
重写baseURL方法，在方法中可以根据开发环境配置访问的服务器地址
重写header方法，在方法中可以添加公共header

2.创建Engine继承JHBaseEngine
自定义方法给外部调用，方法内部构建JHRequestModel
再调用父类的[engineWithRequestModel:handler:]方法进行网络请求

3.自定义response解析规则

### 结构

<img src="https://github.com/RayJiang16/JHNetwork-master/blob/master/UML.png" alt="JHNetwork" title="JHNetwork">
