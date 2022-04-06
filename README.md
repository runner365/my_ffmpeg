# 在ffmpeg中支持hevc/vp8/vp9/opus的flv格式

当前阿里云，金山云等众多cdn，已经支持hevc编码的rtmp直播。<br>
本库基于ffmpeg4.1

## 1. rtmp codecid
hevc/vp8/vp9/opus在rtmp中的codecid没有官方协议定义，由国内众多知名cdn共同制定。
<pre>
<code>
FLV_CODECID_OPUS = 9 << FLV_AUDIO_CODECID_OFFSET

enum {
    FLV_CODECID_H263    = 2,
    FLV_CODECID_SCREEN  = 3,
    FLV_CODECID_VP6     = 4,
    FLV_CODECID_VP6A    = 5,
    FLV_CODECID_SCREEN2 = 6,
    FLV_CODECID_H264    = 7,
    FLV_CODECID_REALH263= 8,
    FLV_CODECID_MPEG4   = 9,
    FLV_CODECID_HEVC    = 12,
    FLV_CODECID_AV1     = 13,
    FLV_CODECID_VP8     = 14,
    FLV_CODECID_VP9     = 15,
};
</code>
</pre>

## 2. 编译
只需要把flv.h/flvdec.c/flvenc.c拷贝入libavformat文件夹中，后面ffmpeg正常编译即可。

如何编译ffmpeg，可以参照：
如何编译支持srt的ffmpeg: [wiki](https://github.com/runner365/srt_encoder/wiki/How-to-compile-cn)

## 3. 服务器
推荐使用服务器开源: [cpp_media_server](https://github.com/runner365/cpp_media_server)

### 3.1 支持直播特性
cpp_media_server支持：
* rtmp推拉流服务(支持h264/vp8+aac/opus in rtmp/flv)
* httpflv拉流服务(支持h264/vp8+aac/opus in rtmp/flv)
* hls录像服务(支持h264/vp8+aac/opus in mpegts)

### 3.2 支持webrtc特性
cpp_media_server支持：
* 房间管理服务
* websocket长连接接入
* 加入/离开房间
* 推流/停止推流
* 拉流/停止拉流
* 高性能webrtc转rtmp: 无转码

   高性能支持webrtc的旁路rtmp直播
* 高性能rtmp转webrtc: 无转码

   高性能支持低延时直播，支持rtmp转为webrtc

<font size=3>划重点：为什么能支持高性能webrtc与rtmp的互转，因为支持opus/vp8 in flv的ffmpeg</font>
