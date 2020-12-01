# shc_openwrt
<h4>how to:</h4>
<code>
cd ~/openwrt/
git clone https://github.com/friyadhibiermann/shc_openwrt.git
mv shc_openwrt ~/openwrt/package/utils/shc
make menuconfig -> utilities -> [*]shc 
make package/utils/shc/compile V=s
</code>
