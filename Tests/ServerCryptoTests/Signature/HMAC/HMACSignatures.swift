/**
 *  ServerCrypto
 *  Copyright (c) 2017 Alexis Aubry. Licensed under the MIT license.
 */

import Foundation
import Hash
import Signature

struct HMACSignature {
    
    let hasher: Hasher
    let keyPassword: String
    let message: String
    let expectedSignature: String
    
    init(_ hasher: Hasher, _ keyPassword: String, _ message: String, _ expectedSignature: String) {
        self.hasher = hasher
        self.keyPassword = keyPassword
        self.message = message
        self.expectedSignature = expectedSignature
    }
    
}

// MARK: - HMAC Signatures

let hmd4Signatures = [
    HMACSignature(.md4, "secret", "4869205468657265", "aa52213133eae9ae2adb86f01d79b098"),
    HMACSignature(.md4, "secret", "7768617420646f2079612077616e7420666f72206e6f7468696e673f", "896d9c033fcb197f1bd1993f716eea91"),
    HMACSignature(.md4, "secret", "dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd", "87b258f40db19d2059736988801f7dd0"),
    HMACSignature(.md4, "secret", "cdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcd", "5a06db78c30ed795057541289e87eb1a"),
    HMACSignature(.md4, "secret", "546573742057697468205472756e636174696f6e", "c2284a36b025d3dec59b32552b32a372"),
    HMACSignature(.md4, "secret", "54657374205573696e67204c6172676572205468616e20426c6f636b2d53697a65204b6579202d2048617368204b6579204669727374", "73847ea99388a189f50c5a0c552b76c1")
]

let hmd5Signatures = [
    HMACSignature(.md5, "secret", "4869205468657265", "1f337b759bb8c23e9f9ef1d28f6ac822"),
    HMACSignature(.md5, "secret", "7768617420646f2079612077616e7420666f72206e6f7468696e673f", "8d5b74cac41c45a0f22b7a353bdb27b7"),
    HMACSignature(.md5, "secret", "dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd", "3bd09138f1c959fc9a85040f2613aa9c"),
    HMACSignature(.md5, "secret", "cdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcd", "09a0fa300a224deaf01d6d9da640d188"),
    HMACSignature(.md5, "secret", "546573742057697468205472756e636174696f6e", "2443afbf1bcb5c01563365e447fa1ea9"),
    HMACSignature(.md5, "secret", "54657374205573696e67204c6172676572205468616e20426c6f636b2d53697a65204b6579202d2048617368204b6579204669727374", "731738a059b3f585bfdf5a810280101e")
]

let hs1Signatures = [
    HMACSignature(.sha1, "secret", "4869205468657265", "dd3c907046caa39e26428dd00afd66e7ba758fd0"),
    HMACSignature(.sha1, "secret", "7768617420646f2079612077616e7420666f72206e6f7468696e673f", "e65afa52fc891d188ded82a4a35ebe3cd04be9bc"),
    HMACSignature(.sha1, "secret", "dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd", "6b9f8180b03d020da32941c757d9683cf1b43c19"),
    HMACSignature(.sha1, "secret", "cdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcd", "b86c2818df18264ce27b33fb621647ec8f2271bf"),
    HMACSignature(.sha1, "secret", "546573742057697468205472756e636174696f6e", "64ee7f075ce9a063c863391b343c6512ba25a273"),
    HMACSignature(.sha1, "secret", "54657374205573696e67204c6172676572205468616e20426c6f636b2d53697a65204b6579202d2048617368204b6579204669727374", "582bc4f8dd7ab86337234ddb680aad33f9a77536")
]

let hs224Signatures = [
    HMACSignature(.sha224, "secret", "4869205468657265", "0109f3443e9dbdcd9b3c588ce3a284bd72a17ab9d01771a6aa901305"),
    HMACSignature(.sha224, "secret", "7768617420646f2079612077616e7420666f72206e6f7468696e673f", "c514a97333c41c9f76ba475560fe46d3a02665c560632cd7ba7ed11a"),
    HMACSignature(.sha224, "secret", "dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd", "82f9b92da6cd4d349bfb6513fd8b211bcfc7c204d2682d8f6a60c728"),
    HMACSignature(.sha224, "secret", "cdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcd", "4354aaf1c7ddd3a2691da13b9239e9679aef6ca319df810c34da527a"),
    HMACSignature(.sha224, "secret", "546573742057697468205472756e636174696f6e", "338931e05590f1143a6c80e3ac21e691e55e2932961ec930175d88d5"),
    HMACSignature(.sha224, "secret", "54657374205573696e67204c6172676572205468616e20426c6f636b2d53697a65204b6579202d2048617368204b6579204669727374", "ef373b7722c72be96f1f17b376814ef97f2da0db8abe962c61fff448")
]

let hs256Signatures = [
    HMACSignature(.sha256, "secret", "4869205468657265", "891972b1433ed6038585b2af44c757398e050d411ffcde118f271b5d2b637168"),
    HMACSignature(.sha256, "secret", "7768617420646f2079612077616e7420666f72206e6f7468696e673f", "ae974fb8f1d2f09aab9bcb0354946ace98a2976bd7204c43c0844ddbeae11977"),
    HMACSignature(.sha256, "secret", "dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd", "245b32c433a7fbf112a7e1b61ad6caa8f53df23698f094a7c966c81a597c1653"),
    HMACSignature(.sha256, "secret", "cdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcd", "74d02e25f0c3e0b5db5f8e720ae9905dac00e76e3d1b67e138a609efb4750817"),
    HMACSignature(.sha256, "secret", "546573742057697468205472756e636174696f6e", "b957fb9adee927335cd732e97ac3d74788ad62e642f2efc324856461667d4048"),
    HMACSignature(.sha256, "secret", "54657374205573696e67204c6172676572205468616e20426c6f636b2d53697a65204b6579202d2048617368204b6579204669727374", "ea5ae39f48fef23342b288e26305d4e359f961c741a85a2f5cdd9ebe02db5e3f")
]

let hs384Signatures = [
    HMACSignature(.sha384, "secret", "4869205468657265", "4f8435f1cfe3fe1342ea0961e1cf3fda4b2e061d16b69216f717e321fd2981298986e7f3ecfd178833f4500cfbcdb56d"),
    HMACSignature(.sha384, "secret", "7768617420646f2079612077616e7420666f72206e6f7468696e673f", "a149f16c4e2ba0eda01cfce43998b2ee71424ae6d1bc6e73fa63738c5faf2a196793379af11e2979b1e1994a1f8aa5b1"),
    HMACSignature(.sha384, "secret", "dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd", "e54431ad21df0e8c28a080c334c158e826ba1e09746ed2eebfb9727418cf3f65f9758aaba33835b4fc9e75f3e50054bb"),
    HMACSignature(.sha384, "secret", "cdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcd", "3045f925ade5f4abf40e93280bbc13e6b4a6e4a05d37594632d93abfbcca1d1f2dc9a309d6852515afdd96911acd5eb1"),
    HMACSignature(.sha384, "secret", "546573742057697468205472756e636174696f6e", "4919ab0d79a9a646bf8ef57bb015ee3173a332157dbcd4ccbad3d77bdf846937f8cf9f55506b6579e0f8465a37ad16cd"),
    HMACSignature(.sha384, "secret", "54657374205573696e67204c6172676572205468616e20426c6f636b2d53697a65204b6579202d2048617368204b6579204669727374", "a35407dab3248ab81f7451f9675e8b55af2de0c41f77634865b07ef0dbbdd10c018426aaa883b00c69868db802b58653")
]

let hs512Signatures = [
    HMACSignature(.sha512, "secret", "4869205468657265", "278dcfbdedead24e23633f1f7057dffbaf6ee8c706a4da19a6028c90ccf28708cdb3cbd224e4d12bbcb0a44a615622938509a20f8b3e4963cec715a211957b81"),
    HMACSignature(.sha512, "secret", "7768617420646f2079612077616e7420666f72206e6f7468696e673f", "f7047c2e9e2afb00865108fa062e9605b97e7a40652d3660624dd88acb2f5cb12daebdfc19c1472993fce4d3752a3b3dbd0e07c7c37bfcdbdc777d166c705a88"),
    HMACSignature(.sha512, "secret", "dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd", "1e99362a14801505715619e10260ad124d36cff093dba67fb026e12a5f032707df9991db219d0d63e18f89df21bceac0bba085b521ec792fac38a9063c96d1cd"),
    HMACSignature(.sha512, "secret", "cdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcd", "03960e8605dd3356546e39f5484d9907e4f9eb3d4a43135fd88ff4704f913a97f7f83e5fbd41d7facd1362c91daea26baa9e9e3f8175f4ef11f880e3a3bf4c0e"),
    HMACSignature(.sha512, "secret", "546573742057697468205472756e636174696f6e", "b97610d8d1df4093fcca0e3387d6ac553c6dd845ae8cd51e916b7a2087f02628ef66c4a6fbc9685b8445934eb9f567c35532b615e71f82779e1e19d89bfb99d5"),
    HMACSignature(.sha512, "secret", "54657374205573696e67204c6172676572205468616e20426c6f636b2d53697a65204b6579202d2048617368204b6579204669727374", "534ab2f3ac9fdfe41ca6c761c87def5dcd8e8aa6f14a676909014092ae3bf4fa0f36bedebe0842f52e89b29686822c577742d6873b5b551c86d960685a2bf2bf")
]

let hrmd160Signatures = [
    HMACSignature(.ripeMd160, "secret", "4869205468657265", "652483494188b83c0cf114c9ad78a732de26a220"),
    HMACSignature(.ripeMd160, "secret", "7768617420646f2079612077616e7420666f72206e6f7468696e673f", "23e73b856e4804300b1fbd40587d97ca36dfcbfb"),
    HMACSignature(.ripeMd160, "secret", "dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd", "a356873991ac57e844bed4484b14469c744321d4"),
    HMACSignature(.ripeMd160, "secret", "cdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcd", "b337e700692ca6dda4434db54e67a2ea65c03458"),
    HMACSignature(.ripeMd160, "secret", "546573742057697468205472756e636174696f6e", "e7183d8738b7ee472ce7817ebc9e3a2fa94ce707"),
    HMACSignature(.ripeMd160, "secret", "54657374205573696e67204c6172676572205468616e20426c6f636b2d53697a65204b6579202d2048617368204b6579204669727374", "ce9268e72624ae8f04408b12249f40aa33e795f8")
]

// MARK: - Fake HMAC Signatures

let hmd4FakeSignatures = [
    HMACSignature(.md4, "secret", "4869205468657265", "aa52213133eae9ae2adb86f01d79b099"),
    HMACSignature(.md4, "secret", "7768617420646f2079612077616e7420666f72206e6f7468696e673f", "896d9c033fcb197f1bd1993f716eea92"),
    HMACSignature(.md4, "secret", "dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd", "87b258f40db19d2059736988801f7dd1"),
    HMACSignature(.md4, "secret", "cdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcd", "5a06db78c30ed795057541289e87eb1b"),
    HMACSignature(.md4, "secret", "546573742057697468205472756e636174696f6e", "c2284a36b025d3dec59b32552b32a373"),
    HMACSignature(.md4, "secret", "54657374205573696e67204c6172676572205468616e20426c6f636b2d53697a65204b6579202d2048617368204b6579204669727374", "73847ea99388a189f50c")
]

let hmd5FakeSignatures = [
    HMACSignature(.md5, "secret", "4869205468657265", "1f337b759bb8c23e9f9ef1d28f6ac823"),
    HMACSignature(.md5, "secret", "7768617420646f2079612077616e7420666f72206e6f7468696e673f", "8d5b74cac41c45a0f22b7a353bdb27b8"),
    HMACSignature(.md5, "secret", "dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd", "3bd09138f1c959fc9a85040f2613aa9d"),
    HMACSignature(.md5, "secret", "cdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcd", "09a0fa300a224deaf01d6d9da640d189"),
    HMACSignature(.md5, "secret", "546573742057697468205472756e636174696f6e", "2443afbf1bcb5c01563365e447fa1eaa"),
    HMACSignature(.md5, "secret", "54657374205573696e67204c6172676572205468616e20426c6f636b2d53697a65204b6579202d2048617368204b6579204669727374", "731738a059b10280101f")
]

let hs1FakeSignatures = [
    HMACSignature(.sha1, "secret", "4869205468657265", "dd3c907046caa39e26428dd00afd66e7ba758fd1"),
    HMACSignature(.sha1, "secret", "7768617420646f2079612077616e7420666f72206e6f7468696e673f", "e65afa52fc891d188ded82a4a35ebe3cd04be9bd"),
    HMACSignature(.sha1, "secret", "dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd", "6b9f8180b03d020da32941c757d9683cf1b43c1a"),
    HMACSignature(.sha1, "secret", "cdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcd", "b86c2818df18264ce27b33fb621647ec8f2271b0"),
    HMACSignature(.sha1, "secret", "546573742057697468205472756e636174696f6e", "64ee7f075ce9a063c863391b343c6512ba25a274"),
    HMACSignature(.sha1, "secret", "54657374205573696e67204c6172676572205468616e20426c6f636b2d53697a65204b6579202d2048617368204b6579204669727374", "582bc4f80aad33f9a77537")
]

let hs224FakeSignatures = [
    HMACSignature(.sha224, "secret", "4869205468657265", "0109f3443e9dbdcd9b3c588ce3a284bd72a17ab9d01771a6aa901306"),
    HMACSignature(.sha224, "secret", "7768617420646f2079612077616e7420666f72206e6f7468696e673f", "c514a97333c41c9f76ba475560fe46d3a02665c560632cd7ba7ed11b"),
    HMACSignature(.sha224, "secret", "dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd", "82f9b92da6cd4d349bfb6513fd8b211bcfc7c204d2682d8f6a60c729"),
    HMACSignature(.sha224, "secret", "cdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcd", "4354aaf1c7ddd3a2691da13b9239e9679aef6ca319df810c34da527b"),
    HMACSignature(.sha224, "secret", "546573742057697468205472756e636174696f6e", "338931e05590f1143a6c80e3ac21e691e55e2932961ec930175d88d6"),
    HMACSignature(.sha224, "secret", "54657374205573696e67204c6172676572205468616e20426c6f636b2d53697a65204b6579202d2048617368204b6579204669727374", "ef373b77b376814ef97f2da0db8abe962c61fff449")
]

let hs256FakeSignatures = [
    HMACSignature(.sha256, "secret", "4869205468657265", "891972b1433ed6038585b2af44c757398e050d411ffcde118f271b5d2b637169"),
    HMACSignature(.sha256, "secret", "7768617420646f2079612077616e7420666f72206e6f7468696e673f", "ae974fb8f1d2f09aab9bcb0354946ace98a2976bd7204c43c0844ddbeae11978"),
    HMACSignature(.sha256, "secret", "dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd", "245b32c433a7fbf112a7e1b61ad6caa8f53df23698f094a7c966c81a597c1654"),
    HMACSignature(.sha256, "secret", "cdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcd", "74d02e25f0c3e0b5db5f8e720ae9905dac00e76e3d1b67e138a609efb4750818"),
    HMACSignature(.sha256, "secret", "546573742057697468205472756e636174696f6e", "b957fb9adee927335cd732e97ac3d74788ad62e642f2efc324856461667d4049"),
    HMACSignature(.sha256, "secret", "54657374205573696e67204c6172676572205468616e20426c6f636b2d53697a65204b6579202d2048617368204b6579204669727374", "ea5a26305d4e359f961c741a85a2f5cdd9ebe02db5e30")
]

let hs384FakeSignatures = [
    HMACSignature(.sha384, "secret", "4869205468657265", "4f8435f1cfe3fe1342ea0961e1cf3fda4b2e061d16b69216f717e321fd2981298986e7f3ecfd178833f4500cfbcdb56e"),
    HMACSignature(.sha384, "secret", "7768617420646f2079612077616e7420666f72206e6f7468696e673f", "a149f16c4e2ba0eda01cfce43998b2ee71424ae6d1bc6e73fa63738c5faf2a196793379af11e2979b1e1994a1f8aa5b2"),
    HMACSignature(.sha384, "secret", "dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd", "e54431ad21df0e8c28a080c334c158e826ba1e09746ed2eebfb9727418cf3f65f9758aaba33835b4fc9e75f3e50054bc"),
    HMACSignature(.sha384, "secret", "cdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcd", "3045f925ade5f4abf40e93280bbc13e6b4a6e4a05d37594632d93abfbcca1d1f2dc9a309d6852515afdd96911acd5eb2"),
    HMACSignature(.sha384, "secret", "546573742057697468205472756e636174696f6e", "4919ab0d79a9a646bf8ef57bb015ee3173a332157dbcd4ccbad3d77bdf846937f8cf9f55506b6579e0f8465a37ad16ce"),
    HMACSignature(.sha384, "secret", "54657374205573696e67204c6172676572205468616e20426c6f636b2d53697a65204b6579202d2048617368204b6579204669727374", "a35407dab3248ab81f7451f9675e8b55af2de0c8426aaa883b00c69868db802b58654")
]

let hs512FakeSignatures = [
    HMACSignature(.sha512, "secret", "4869205468657265", "278dcfbdedead24e23633f1f7057dffbaf6ee8c706a4da19a6028c90ccf28708cdb3cbd224e4d12bbcb0a44a615622938509a20f8b3e4963cec715a211957b82"),
    HMACSignature(.sha512, "secret", "7768617420646f2079612077616e7420666f72206e6f7468696e673f", "f7047c2e9e2afb00865108fa062e9605b97e7a40652d3660624dd88acb2f5cb12daebdfc19c1472993fce4d3752a3b3dbd0e07c7c37bfcdbdc777d166c705a89"),
    HMACSignature(.sha512, "secret", "dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd", "1e99362a14801505715619e10260ad124d36cff093dba67fb026e12a5f032707df9991db219d0d63e18f89df21bceac0bba085b521ec792fac38a9063c96d1ce"),
    HMACSignature(.sha512, "secret", "cdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcd", "03960e8605dd3356546e39f5484d9907e4f9eb3d4a43135fd88ff4704f913a97f7f83e5fbd41d7facd1362c91daea26baa9e9e3f8175f4ef11f880e3a3bf4c0f"),
    HMACSignature(.sha512, "secret", "546573742057697468205472756e636174696f6e", "b97610d8d1df4093fcca0e3387d6ac553c6dd845ae8cd51e916b7a2087f02628ef66c4a6fbc9685b8445934eb9f567c35532b615e71f82779e1e19d89bfb99d6"),
    HMACSignature(.sha512, "secret", "54657374205573696e67204c6172676572205468616e20426c6f636b2d53697a65204b6579202d2048617368204b6579204669727374", "534ab2f3ac9fdfe41ca09014092ae3bf4fa0f36bedebe0842f52e89b29686822c577742d6873b5b551c86d960685a2bf2b0")
]

let hrmd160FakeSignatures = [
    HMACSignature(.ripeMd160, "secret", "4869205468657265", "652483494188b83c0cf114c9ad78a732de26a221"),
    HMACSignature(.ripeMd160, "secret", "7768617420646f2079612077616e7420666f72206e6f7468696e673f", "23e73b856e4804300b1fbd40587d97ca36dfcbfc"),
    HMACSignature(.ripeMd160, "secret", "dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd", "a356873991ac57e844bed4484b14469c744321d5"),
    HMACSignature(.ripeMd160, "secret", "cdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcd", "b337e700692ca6dda4434db54e67a2ea65c03459"),
    HMACSignature(.ripeMd160, "secret", "546573742057697468205472756e636174696f6e", "e7183d8738b7ee472ce7817ebc9e3a2fa94ce708"),
    HMACSignature(.ripeMd160, "secret", "54657374205573696e67204c6172676572205468616e20426c6f636b2d53697a65204b6579202d2048617368204b6579204669727374", "ce9268e72624aea33e795f9")
]
