# jellyfin-hw-setup
A collection of script to configure jellyfin transcoding 

### FAQ

- `'vainfo' is not installed. Aborting.`: **Please install `vainfo`**.
- `The output is empty`: **Please ensure you have installed the vaapi drivers needed by your HW**.

### Example on 12th Gen Intel

```bash
$ bash jellyfin-vaapi-detect.sh /dev/dri/renderD128
Supported HW Decoding:
    AV1
    H264
    HEVC
    HEVC 10bit
    HEVC Rext 8/10bit
    HEVC Rext 12bit
    MJPEG
    MPEG2
    VC1
    VP8
    VP9
    VP9 10bit
Supported HW Encoding:
    H264
    HEVC
    HEVC 10bit
    HEVC Rext 8/10bit
    HEVC Rext 12bit
    MPEG2
Supported Low-Power HW Encoding:
    H264
    HEVC
    HEVC 10bit
    HEVC Rext 8/10bit
    VP9
    VP9 10bit
```

### Example on AMD Ryzen 7

```bash
$ bash jellyfin-vaapi-detect.sh /dev/dri/renderD128
Supported HW Decoding:
    H264
    HEVC
    HEVC 10bit
    MJPEG
    MPEG2
    VC1
    VP9
    VP9 10bit
Supported HW Encoding:
    H264
    HEVC
    HEVC 10bit
Supported Low-Power HW Encoding:
```
