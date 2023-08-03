# flutter_im
项目基于腾讯即时通信API,具备实时通信、通话、朋友圈分享等功能
# 目录结构
modules文件夹存放页面文件
- layout 通用页面架构
- login 登录页面 
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

common 文件夹存放公共方法
  - AliIcon 阿里云图标
  - http dio二次封装
  - myTheme 主题色统一存放
  - remind 弹窗封装

controllers 文件夹存放全局控制器
  - init_tencent_im_controller 初始化腾讯IM控制器
  - tencent_user_controller 腾讯IM用户登录相关控制器
  - tencent_relationship_controller 监听关系链

bindings 文件夹用于加载全局控制器
  - global_bindings 加载全局controllers