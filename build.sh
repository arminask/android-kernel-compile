ROOTDIR=$PWD

rm -rf build
mkdir build

cd android_kernel_oneplus_sm8150

BINARIES=$PATH:$ROOTDIR/build-tools/linux-x86/bin:$ROOTDIR/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9/aarch64-linux-android/bin:$ROOTDIR/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9/bin:$ROOTDIR/android_prebuilts_clang_kernel_linux-x86_clang-r416183b/bin:$ROOTDIR/android_prebuilts_tools-lineage/linux-x86/bin

make clean

make mrproper

make O=../build ARCH=arm64 PATH=$BINARIES CC=clang CROSS_COMPILE=aarch64-linux-android- CLANG_TRIPLE=aarch64-linux-gnu- BRAND_SHOW_FLAG=oneplus TARGET_PRODUCT=msmnile lineage_sm8150_defconfig

make -j4 O=$ROOTDIR/build ARCH=arm64 PATH=$BINARIES CC=clang CROSS_COMPILE=aarch64-linux-android- CLANG_TRIPLE=aarch64-linux-gnu- DEFCONFIG=lineage_sm8150_defconfig DTC_EXT=$ROOTDIR/android_prebuilts_tools-lineage/linux-x86/dtc/dtc BRAND_SHOW_FLAG=oneplus TARGET_PRODUCT=msmnile
