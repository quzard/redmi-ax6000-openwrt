docker pull immortalwrt/opde:base

git clone -b mt7986 --single-branch https://github.com/padavanonly/immortalwrtARM && cd immortalwrtARM


docker run --rm -it \
  -e   all_proxy=http://172.16.40.91:7890 \
  -e  http_proxy=http://172.16.40.91:7890 \
  -e https_proxy=http://172.16.40.91:7890 \
  -e   ALL_PROXY=http://172.16.40.91:7890 \
  -e  HTTP_PROXY=http://172.16.40.91:7890 \
  -e HTTPS_PROXY=http://172.16.40.91:7890 \
  -v $PWD:/openwrt \
  immortalwrt/opde:base zsh

DATE_START=$(date "+%Y-%m-%d %H:%M:%S")

./scripts/feeds update -a && ./scripts/feeds install -a

make defconfig


make package/install -j$(nproc)

DATE_END=$(date "+%Y-%m-%d %H:%M:%S")
echo "DATE_START:$DATE_START"
echo "DATE_END:$DATE_END"
