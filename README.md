# flutter_im
项目基于腾讯即时通信API,具备实时通信、通话、朋友圈分享等功能
# 目录结构
modules文件夹存放页面文件
- layout 通用页面架构
- login 登录页面 
- register 注册页面
- home 消息首页
- friend 朋友页面
- circle 朋友圈
- my 我的
- friend_info 好友信息
- chart 聊天页面
- add_friend 添加好友
- new_friend 新好友通知页面
- web_view webView 页面跳转第三方地址
- circle_details 朋友圈单行详情
- circle_send 发布朋友圈
- circle_separate 个人朋友圈
- my_code 我的二维码
- setting 设置
- set_account 账户与安全设置
- new_friend 新朋友审核

common 文件夹存放公共方法
  - AliIcon 阿里云图标
  - http dio二次封装
  - myTheme 主题色统一存放
  - remind 弹窗封装
  - timeFormat 时间格式化封装
  - storage 存储封装

controllers 文件夹存放全局控制器
  - init_tencent_im_controller 初始化腾讯IM控制器
  - tencent_user_controller 腾讯IM用户登录相关控制器
  - tencent_relationship_controller 监听关系链
  - tencent_session_controller 腾讯IM会话相关控制器
  - tencent_message_controller 腾讯IM消息相关控制器
  - circle_controller 朋友圈数据控制器

bindings 文件夹用于加载全局控制器
  - global_bindings 加载全局controllers

model 数据模型
  - sigModel node服务端获取时间密钥模型
  - registerModel 服务端注册接口数据模型
  - friendInfoModel 腾讯云获取好友信息自定义数据模型
  - FriendsModel node服务端根据好友名称查询好友ID模型
  - circleSendModel node服务端发送朋友数据模型
  - circleListModel node服务端拉去朋友圈列表模型
  - circleDetModel node服务端查看朋友圈详情及评论数据模型
  

api 接口统一管理目录
  - login 登录注册相关接口
  - userApi 用户操作相关接口
  - circleApi 朋友圈相关接口