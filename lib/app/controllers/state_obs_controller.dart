import 'package:get/get.dart';
import 'package:tencentcloud_cos_sdk_plugin/cos.dart';
import 'package:tencentcloud_cos_sdk_plugin/cos_transfer_manger.dart';
import 'package:tencentcloud_cos_sdk_plugin/pigeon.dart';
import 'package:tencentcloud_cos_sdk_plugin/transfer_task.dart';

import '../common/initOBS.dart';

class StateObsController extends GetxController {


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /* 初始化&注册对象存储 */
  stateOBS(){
    /**初始化秘钥 */
    Cos().initWithSessionCredential(FetchCredentials());
    // 存储桶所在地域简称，例如广州地区是 ap-guangzhou
    String region = "ap-beijing";
    // 创建 CosXmlServiceConfig 对象，根据需要修改默认的配置参数
    CosXmlServiceConfig serviceConfig = CosXmlServiceConfig(
        region: region,
        isDebuggable: true,
        isHttps: true,
    );
    // 注册默认 COS Service
    Cos().registerDefaultService(serviceConfig);


    // 创建 TransferConfig 对象，根据需要修改默认的配置参数
    // TransferConfig 可以设置智能分块阈值 默认对大于或等于2M的文件自动进行分块上传，可以通过如下代码修改分块阈值
    TransferConfig transferConfig = TransferConfig(
        forceSimpleUpload: false,
        enableVerification: true,
        divisionForUpload: 2097152, // 设置大于等于 2M 的文件进行分块上传
        sliceSizeForUpload: 1048576, //设置默认分块大小为 1M
    );
    // 注册默认 COS TransferManger
    Cos().registerDefaultTransferManger(serviceConfig, transferConfig);
  }

  /* 上传对象 */
  handelUpload(String localPath)async{
    CosTransferManger transferManager = Cos().getDefaultTransferManger();
    //CosTransferManger transferManager = Cos().getTransferManger("newRegion");
    // 存储桶名称，由 bucketname-appid 组成，appid 必须填入，可以在 COS 控制台查看存储桶名称。 https://console.cloud.tencent.com/cos5/bucket
    String bucket = "flutter-im-1300219180";
    String cosPath = "img/"; //对象在存储桶中的位置标识符，即称对象键
    String srcPath = localPath; //本地文件的绝对路径
    //若存在初始化分块上传的 UploadId，则赋值对应的 uploadId 值用于续传；否则，赋值 null
    String? _uploadId;
    // 上传成功回调
    successCallBack(result) {
      // todo 上传成功后的逻辑
      print("上传成功");
    }
    //上传失败回调
    failCallBack(clientException, serviceException) {
      // todo 上传失败后的逻辑
      if (clientException != null) {
        print("上传失败");
      }
      if (serviceException != null) {
        print("上传成功");
      }
    }
    //上传状态回调, 可以查看任务过程
    stateCallback(state) {
      // todo notify transfer state
    }
    //上传进度回调
    progressCallBack(complete, target) {
      // todo Do something to update progress...
    }
    //初始化分块完成回调
    initMultipleUploadCallback(
        String bucket, String cosKey, String uploadId) {
      //用于下次续传上传的 uploadId
      _uploadId = uploadId;
    }

    TransferTask transferTask = await transferManager.upload(bucket, cosPath,
        filePath: srcPath,
        uploadId: _uploadId,
        resultListener: ResultListener(successCallBack, failCallBack),
        stateCallback: stateCallback,
        progressCallBack: progressCallBack,
        initMultipleUploadCallback: initMultipleUploadCallback
    );
  }


}
