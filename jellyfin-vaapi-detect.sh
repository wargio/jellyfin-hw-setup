#!/bin/bash
# SPDX-FileCopyrightText: 2025 deroad <deroad@kumo.xn--q9jyb4c>
# SPDX-License-Identifier: GPL-3.0-only

has_profile() {
	local NAME="$1"
	local LIST="$2"
	for ELEM in $LIST; do
		for FIND in ${3+"$@"}; do
			if [ "$FIND" == "$ELEM" ]; then
				echo "    $NAME"
				return
			fi
		done
	done
	return
}

if [ -z "$1" ]; then
	echo "usage: $0 </dev/dri/renderD128>"
	exit 1;
elif [ ! -e "$1" ]; then
	echo "error: invalid renderer: $1"
	exit 1;
fi

command -v vainfo >/dev/null 2>&1 || { echo >&2 "'vainfo' is not installed. Aborting."; exit 1; }

DEVICE="$1"

# get VAInfo details
HW_INFO_DECODING=$(vainfo --display drm --device "$DEVICE" 2> /dev/null | grep -w VAEntrypointVLD | cut -d ':' -f1 | sort | uniq)
HW_INFO_ENCODING_NORMAL=$(vainfo --display drm --device "$DEVICE" 2> /dev/null | grep -w VAEntrypointEncSlice | cut -d ':' -f1 | sort | uniq)
HW_INFO_ENCODING_LOWPOWER=$(vainfo --display drm --device "$DEVICE" 2> /dev/null | grep -w VAEntrypointEncSliceLP | cut -d ':' -f1 | sort | uniq)

# decoding
echo "Supported HW Decoding:"
has_profile "AV1" "$HW_INFO_DECODING" VAProfileAV1Profile0 VAProfileAV1Profile1
has_profile "H264" "$HW_INFO_DECODING" VAProfileH264Baseline VAProfileH264Main VAProfileH264High VAProfileH264ConstrainedBaseline
has_profile "HEVC" "$HW_INFO_DECODING" VAProfileHEVCMain VAProfileHEVCSccMain
has_profile "HEVC 10bit" "$HW_INFO_DECODING" VAProfileHEVCMain10 VAProfileHEVCSccMain10
has_profile "HEVC Rext 8/10bit" "$HW_INFO_DECODING" VAProfileHEVCMain444 VAProfileHEVCSccMain444 VAProfileHEVCMain422_10 VAProfileHEVCMain444_10 VAProfileHEVCSccMain444_10
has_profile "HEVC Rext 12bit" "$HW_INFO_DECODING" VAProfileHEVCMain12 VAProfileHEVCMain422_12 VAProfileHEVCMain444_12
has_profile "MJPEG" "$HW_INFO_DECODING" VAProfileJPEGBaseline
has_profile "MPEG2" "$HW_INFO_DECODING" VAProfileMPEG2Main VAProfileMPEG2Simple
has_profile "VC1" "$HW_INFO_DECODING" VAProfileVC1Simple VAProfileVC1Main VAProfileVC1Advanced
has_profile "VP8" "$HW_INFO_DECODING" VAProfileVP8Version0_3
has_profile "VP9" "$HW_INFO_DECODING" VAProfileVP9Profile0 VAProfileVP9Profile1
has_profile "VP9 10bit" "$HW_INFO_DECODING" VAProfileVP9Profile2 VAProfileVP9Profile3

# encoding (normal)
echo "Supported HW Encoding:"
has_profile "AV1" "$HW_INFO_ENCODING_NORMAL" VAProfileAV1Profile0 VAProfileAV1Profile1
has_profile "H264" "$HW_INFO_ENCODING_NORMAL" VAProfileH264Baseline VAProfileH264Main VAProfileH264High VAProfileH264ConstrainedBaseline
has_profile "HEVC" "$HW_INFO_ENCODING_NORMAL" VAProfileHEVCMain VAProfileHEVCSccMain
has_profile "HEVC 10bit" "$HW_INFO_ENCODING_NORMAL" VAProfileHEVCMain10 VAProfileHEVCSccMain10
has_profile "HEVC Rext 8/10bit" "$HW_INFO_ENCODING_NORMAL" VAProfileHEVCMain444 VAProfileHEVCSccMain444 VAProfileHEVCMain422_10 VAProfileHEVCMain444_10 VAProfileHEVCSccMain444_10
has_profile "HEVC Rext 12bit" "$HW_INFO_ENCODING_NORMAL" VAProfileHEVCMain12 VAProfileHEVCMain422_12 VAProfileHEVCMain444_12
has_profile "MJPEG" "$HW_INFO_ENCODING_NORMAL" VAProfileJPEGBaseline
has_profile "MPEG2" "$HW_INFO_ENCODING_NORMAL" VAProfileMPEG2Main VAProfileMPEG2Simple
has_profile "VC1" "$HW_INFO_ENCODING_NORMAL" VAProfileVC1Simple VAProfileVC1Main VAProfileVC1Advanced
has_profile "VP8" "$HW_INFO_ENCODING_NORMAL" VAProfileVP8Version0_3
has_profile "VP9" "$HW_INFO_ENCODING_NORMAL" VAProfileVP9Profile0 VAProfileVP9Profile1
has_profile "VP9 10bit" "$HW_INFO_ENCODING_NORMAL" VAProfileVP9Profile2 VAProfileVP9Profile3

# encoding (low power)
echo "Supported Low-Power HW Encoding:"
has_profile "AV1" "$HW_INFO_ENCODING_LOWPOWER" VAProfileAV1Profile0 VAProfileAV1Profile1
has_profile "H264" "$HW_INFO_ENCODING_LOWPOWER" VAProfileH264Baseline VAProfileH264Main VAProfileH264High VAProfileH264ConstrainedBaseline
has_profile "HEVC" "$HW_INFO_ENCODING_LOWPOWER" VAProfileHEVCMain VAProfileHEVCSccMain
has_profile "HEVC 10bit" "$HW_INFO_ENCODING_LOWPOWER" VAProfileHEVCMain10 VAProfileHEVCSccMain10
has_profile "HEVC Rext 8/10bit" "$HW_INFO_ENCODING_LOWPOWER" VAProfileHEVCMain444 VAProfileHEVCSccMain444 VAProfileHEVCMain422_10 VAProfileHEVCMain444_10 VAProfileHEVCSccMain444_10
has_profile "HEVC Rext 12bit" "$HW_INFO_ENCODING_LOWPOWER" VAProfileHEVCMain12 VAProfileHEVCMain422_12 VAProfileHEVCMain444_12
has_profile "MJPEG" "$HW_INFO_ENCODING_LOWPOWER" VAProfileJPEGBaseline
has_profile "MPEG2" "$HW_INFO_ENCODING_LOWPOWER" VAProfileMPEG2Main VAProfileMPEG2Simple
has_profile "VC1" "$HW_INFO_ENCODING_LOWPOWER" VAProfileVC1Simple VAProfileVC1Main VAProfileVC1Advanced
has_profile "VP8" "$HW_INFO_ENCODING_LOWPOWER" VAProfileVP8Version0_3
has_profile "VP9" "$HW_INFO_ENCODING_LOWPOWER" VAProfileVP9Profile0 VAProfileVP9Profile1
has_profile "VP9 10bit" "$HW_INFO_ENCODING_LOWPOWER" VAProfileVP9Profile2 VAProfileVP9Profile3
