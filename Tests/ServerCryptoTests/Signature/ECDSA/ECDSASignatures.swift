/**
 *  ServerCrypto
 *  Copyright (c) 2017 Alexis Aubry. Licensed under the MIT license.
 */

import Foundation
import Hash
import Signature

struct ECDSASignature: AsymmetricSignature {
    
    let hasher: Hasher
    let privateKeyName: String
    let publicKeyName: String
    let privateKeyPassphrase: String?
    let message: String
    let validSignature: String

    init(_ hasher: Hasher, _ privateKeyName: String, _ publicKeyName: String, _ privateKeyPassphrase: String?, _ message: String, _ validSignature: String) {
        self.hasher = hasher
        self.privateKeyName = privateKeyName
        self.publicKeyName = publicKeyName
        self.privateKeyPassphrase = privateKeyPassphrase
        self.message = message
        self.validSignature = validSignature
    }

}

// MARK: - P-256 Signatures

let ecdsaP256withSHA1Signatures = [
    ECDSASignature(.sha1, "ecdsa_p256_private", "ecdsa_p256_public", nil, "Signature", "30440220142d2bf02bc162e09f9afe050cd4ab7b6d0c65d3976837d36d2c27524839e1bd0220787279af8e5b67f5760a118bd4ad7f0b5dc82798eb775a26fb1ac13c16b087ea"),
    ECDSASignature(.sha1, "ecdsa_p256_private_secure", "ecdsa_p256_public", "secret", "Signature", "30440220142d2bf02bc162e09f9afe050cd4ab7b6d0c65d3976837d36d2c27524839e1bd0220787279af8e5b67f5760a118bd4ad7f0b5dc82798eb775a26fb1ac13c16b087ea")
]

let ecdsaP256withSHA224Signatures = [
    ECDSASignature(.sha224, "ecdsa_p256_private", "ecdsa_p256_public", nil, "Signature", "304402203a35f5dbf44d9483390350743666e76719b60c6afbeaa59230c2aaadf0cc0c2b022037f0d41dcf3f6df4074856bd96010791e264a27f397809eb14ac734b0ab34325"),
    ECDSASignature(.sha224, "ecdsa_p256_private_secure", "ecdsa_p256_public", "secret", "Signature", "304402203a35f5dbf44d9483390350743666e76719b60c6afbeaa59230c2aaadf0cc0c2b022037f0d41dcf3f6df4074856bd96010791e264a27f397809eb14ac734b0ab34325")
]

let ecdsaP256withSHA256Signatures = [
    ECDSASignature(.sha256, "ecdsa_p256_private", "ecdsa_p256_public", nil, "Signature", "30440220696492055ba3dff587079215060159936836885f4b581992fe2f7442ff4aedd402201e5120aa9750715da8171f59ee7ada254c479fca2ac181cf3d34ec9902afcea6"),
    ECDSASignature(.sha256, "ecdsa_p256_private_secure", "ecdsa_p256_public", "secret", "Signature", "30440220696492055ba3dff587079215060159936836885f4b581992fe2f7442ff4aedd402201e5120aa9750715da8171f59ee7ada254c479fca2ac181cf3d34ec9902afcea6")
]

let ecdsaP256withSHA384Signatures = [
    ECDSASignature(.sha384, "ecdsa_p256_private", "ecdsa_p256_public", nil, "Signature", "3045022100b0f9d2af16e8de339a868c7e09c27885d265ffaa112fb59c6ed19c4dd90edd7102204955fa0cccdce5ab6736f7d35c768b8fb405a1f156d2545342480619da5ca5dd"),
    ECDSASignature(.sha384, "ecdsa_p256_private_secure", "ecdsa_p256_public", "secret", "Signature", "3045022100b0f9d2af16e8de339a868c7e09c27885d265ffaa112fb59c6ed19c4dd90edd7102204955fa0cccdce5ab6736f7d35c768b8fb405a1f156d2545342480619da5ca5dd")
]

let ecdsaP256withSHA512Signatures = [
    ECDSASignature(.sha512, "ecdsa_p256_private", "ecdsa_p256_public", nil, "Signature", "304602210088a32c22c712d2840e19548f3e4807c4ef2329c51bd2c3581f2586c6734df8d8022100c47c083a771d2696a7e5c94740eb7f5a4f7c0f9a0f8dde55dc9ae846a74de50e"),
    ECDSASignature(.sha512, "ecdsa_p256_private_secure", "ecdsa_p256_public", "secret", "Signature", "304602210088a32c22c712d2840e19548f3e4807c4ef2329c51bd2c3581f2586c6734df8d8022100c47c083a771d2696a7e5c94740eb7f5a4f7c0f9a0f8dde55dc9ae846a74de50e")
]

// MARK: - P-256 Fake Signatures

let ecdsaFakeP256withSHA1Signatures = [
    ECDSASignature(.sha1, "ecdsa_p256_private", "ecdsa_p256_public", nil, "Signature", "40440220142d2bf02bc162e09f9afe050cd4ab7b6d0c65d3976837d36d2c27524839e1bd0220787279af8e5b67f5760a118bd4ad7f0b5dc82798eb775a26fb1ac13c16b087ea"),
    ECDSASignature(.sha1, "ecdsa_p256_private_secure", "ecdsa_p256_public", "secret", "Signature", "40440220142d2bf02bc162e09f9afe050cd4ab7b6d0c65d3976837d36d2c27524839e1bd0220787279af8e5b67f5760a118bd4ad7f0b5dc82798eb775a26fb1ac13c16b087ea")
]

let ecdsaFakeP256withSHA224Signatures = [
    ECDSASignature(.sha224, "ecdsa_p256_private", "ecdsa_p256_public", nil, "Signature", "404402203a35f5dbf44d9483390350743666e76719b60c6afbeaa59230c2aaadf0cc0c2b022037f0d41dcf3f6df4074856bd96010791e264a27f397809eb14ac734b0ab34325"),
    ECDSASignature(.sha224, "ecdsa_p256_private_secure", "ecdsa_p256_public", "secret", "Signature", "404402203a35f5dbf44d9483390350743666e76719b60c6afbeaa59230c2aaadf0cc0c2b022037f0d41dcf3f6df4074856bd96010791e264a27f397809eb14ac734b0ab34325")
]

let ecdsaFakeP256withSHA256Signatures = [
    ECDSASignature(.sha256, "ecdsa_p256_private", "ecdsa_p256_public", nil, "Signature", "40440220696492055ba3dff587079215060159936836885f4b581992fe2f7442ff4aedd402201e5120aa9750715da8171f59ee7ada254c479fca2ac181cf3d34ec9902afcea6"),
    ECDSASignature(.sha256, "ecdsa_p256_private_secure", "ecdsa_p256_public", "secret", "Signature", "40440220696492055ba3dff587079215060159936836885f4b581992fe2f7442ff4aedd402201e5120aa9750715da8171f59ee7ada254c479fca2ac181cf3d34ec9902afcea6")
]

let ecdsaFakeP256withSHA384Signatures = [
    ECDSASignature(.sha384, "ecdsa_p256_private", "ecdsa_p256_public", nil, "Signature", "4045022100b0f9d2af16e8de339a868c7e09c27885d265ffaa112fb59c6ed19c4dd90edd7102204955fa0cccdce5ab6736f7d35c768b8fb405a1f156d2545342480619da5ca5dd"),
    ECDSASignature(.sha384, "ecdsa_p256_private_secure", "ecdsa_p256_public", "secret", "Signature", "4045022100b0f9d2af16e8de339a868c7e09c27885d265ffaa112fb59c6ed19c4dd90edd7102204955fa0cccdce5ab6736f7d35c768b8fb405a1f156d2545342480619da5ca5dd")
]

let ecdsaFakeP256withSHA512Signatures = [
    ECDSASignature(.sha512, "ecdsa_p256_private", "ecdsa_p256_public", nil, "Signature", "404602210088a32c22c712d2840e19548f3e4807c4ef2329c51bd2c3581f2586c6734df8d8022100c47c083a771d2696a7e5c94740eb7f5a4f7c0f9a0f8dde55dc9ae846a74de50e"),
    ECDSASignature(.sha512, "ecdsa_p256_private_secure", "ecdsa_p256_public", "secret", "Signature", "404602210088a32c22c712d2840e19548f3e4807c4ef2329c51bd2c3581f2586c6734df8d8022100c47c083a771d2696a7e5c94740eb7f5a4f7c0f9a0f8dde55dc9ae846a74de50e")
]

// MARK: - SECP256K1 Signatures

let ecdsaSECP256K1withSHA1Signatures = [
    ECDSASignature(.sha1, "ecdsa_p256k1_private", "ecdsa_p256k1_public", nil, "Signature", "30440220223af119d5501f5b8ab3f6f5af7d771975cbe6abc191f23d58fae8e26d87d0530220587d078ab8d92282bccf59dcdee45417353c229755c56cc9fa0e596d4c3d6ba0"),
    ECDSASignature(.sha1, "ecdsa_p256k1_private_secure", "ecdsa_p256k1_public", "secret", "Signature", "30440220223af119d5501f5b8ab3f6f5af7d771975cbe6abc191f23d58fae8e26d87d0530220587d078ab8d92282bccf59dcdee45417353c229755c56cc9fa0e596d4c3d6ba0")
]

let ecdsaSECP256K1withSHA224Signatures = [
    ECDSASignature(.sha224, "ecdsa_p256k1_private", "ecdsa_p256k1_public", nil, "Signature", "304502204820c26d0e8241ac9a0387a4c31c5f17239cb3e0417c34f6be76355c53137a4a022100abecf3e33f6fee4650c491f9c295351382f95ecaec01b9b73505711af03d3e1b"),
    ECDSASignature(.sha224, "ecdsa_p256k1_private_secure", "ecdsa_p256k1_public", "secret", "Signature", "304502204820c26d0e8241ac9a0387a4c31c5f17239cb3e0417c34f6be76355c53137a4a022100abecf3e33f6fee4650c491f9c295351382f95ecaec01b9b73505711af03d3e1b")
]

let ecdsaSECP256K1withSHA256Signatures = [
    ECDSASignature(.sha256, "ecdsa_p256k1_private", "ecdsa_p256k1_public", nil, "Signature", "304502200fc7b74e34192a018649422ef4ea7663ee195ae2f104bf02cecaafc5c1d43a1d0221009ab13bb52d2f980a9eab42033f246e1495236898d613e484e81671578ad58bad"),
    ECDSASignature(.sha256, "ecdsa_p256k1_private_secure", "ecdsa_p256k1_public", "secret", "Signature", "304502200fc7b74e34192a018649422ef4ea7663ee195ae2f104bf02cecaafc5c1d43a1d0221009ab13bb52d2f980a9eab42033f246e1495236898d613e484e81671578ad58bad")
]

let ecdsaSECP256K1withSHA384Signatures = [
    ECDSASignature(.sha384, "ecdsa_p256k1_private", "ecdsa_p256k1_public", nil, "Signature", "304402207b0d6dc6a1aa3bd9ec28dca80fcb265fb8bb92c4dc58f1892e0cab3dfd8e4fd0022056a280b4e8c3c1940a88048ba10cb693ec99d057a88e9365f1ab0b675d7706f5"),
    ECDSASignature(.sha384, "ecdsa_p256k1_private_secure", "ecdsa_p256k1_public", "secret", "Signature", "304402207b0d6dc6a1aa3bd9ec28dca80fcb265fb8bb92c4dc58f1892e0cab3dfd8e4fd0022056a280b4e8c3c1940a88048ba10cb693ec99d057a88e9365f1ab0b675d7706f5")
]

let ecdsaSECP256K1withSHA512Signatures = [
    ECDSASignature(.sha512, "ecdsa_p256k1_private", "ecdsa_p256k1_public", nil, "Signature", "3044022000f851e1d80ce3820f6dfa2895f1c759fa12dbac3f6386cb409043c3bc4b3fd202206d3d300404c7af7ac5fb30576dc65997af24a0adb4f40da60d762362c747c67b"),
    ECDSASignature(.sha512, "ecdsa_p256k1_private_secure", "ecdsa_p256k1_public", "secret", "Signature", "3044022000f851e1d80ce3820f6dfa2895f1c759fa12dbac3f6386cb409043c3bc4b3fd202206d3d300404c7af7ac5fb30576dc65997af24a0adb4f40da60d762362c747c67b")
]

// MARK: - SECP256K1 Fake Signatures

let ecdsaFakeSECP256K1withSHA1Signatures = [
    ECDSASignature(.sha1, "ecdsa_p256k1_private", "ecdsa_p256k1_public", nil, "Signature", "40440220223af119d5501f5b8ab3f6f5af7d771975cbe6abc191f23d58fae8e26d87d0530220587d078ab8d92282bccf59dcdee45417353c229755c56cc9fa0e596d4c3d6ba0"),
    ECDSASignature(.sha1, "ecdsa_p256k1_private_secure", "ecdsa_p256k1_public", "secret", "Signature", "40440220223af119d5501f5b8ab3f6f5af7d771975cbe6abc191f23d58fae8e26d87d0530220587d078ab8d92282bccf59dcdee45417353c229755c56cc9fa0e596d4c3d6ba0")
]

let ecdsaFakeSECP256K1withSHA224Signatures = [
    ECDSASignature(.sha224, "ecdsa_p256k1_private", "ecdsa_p256k1_public", nil, "Signature", "404502204820c26d0e8241ac9a0387a4c31c5f17239cb3e0417c34f6be76355c53137a4a022100abecf3e33f6fee4650c491f9c295351382f95ecaec01b9b73505711af03d3e1b"),
    ECDSASignature(.sha224, "ecdsa_p256k1_private_secure", "ecdsa_p256k1_public", "secret", "Signature", "404502204820c26d0e8241ac9a0387a4c31c5f17239cb3e0417c34f6be76355c53137a4a022100abecf3e33f6fee4650c491f9c295351382f95ecaec01b9b73505711af03d3e1b")
]

let ecdsaFakeSECP256K1withSHA256Signatures = [
    ECDSASignature(.sha256, "ecdsa_p256k1_private", "ecdsa_p256k1_public", nil, "Signature", "404502200fc7b74e34192a018649422ef4ea7663ee195ae2f104bf02cecaafc5c1d43a1d0221009ab13bb52d2f980a9eab42033f246e1495236898d613e484e81671578ad58bad"),
    ECDSASignature(.sha256, "ecdsa_p256k1_private_secure", "ecdsa_p256k1_public", "secret", "Signature", "404502200fc7b74e34192a018649422ef4ea7663ee195ae2f104bf02cecaafc5c1d43a1d0221009ab13bb52d2f980a9eab42033f246e1495236898d613e484e81671578ad58bad")
]

let ecdsaFakeSECP256K1withSHA384Signatures = [
    ECDSASignature(.sha384, "ecdsa_p256k1_private", "ecdsa_p256k1_public", nil, "Signature", "404402207b0d6dc6a1aa3bd9ec28dca80fcb265fb8bb92c4dc58f1892e0cab3dfd8e4fd0022056a280b4e8c3c1940a88048ba10cb693ec99d057a88e9365f1ab0b675d7706f5"),
    ECDSASignature(.sha384, "ecdsa_p256k1_private_secure", "ecdsa_p256k1_public", "secret", "Signature", "404402207b0d6dc6a1aa3bd9ec28dca80fcb265fb8bb92c4dc58f1892e0cab3dfd8e4fd0022056a280b4e8c3c1940a88048ba10cb693ec99d057a88e9365f1ab0b675d7706f5")
]

let ecdsaFakeSECP256K1withSHA512Signatures = [
    ECDSASignature(.sha512, "ecdsa_p256k1_private", "ecdsa_p256k1_public", nil, "Signature", "4044022000f851e1d80ce3820f6dfa2895f1c759fa12dbac3f6386cb409043c3bc4b3fd202206d3d300404c7af7ac5fb30576dc65997af24a0adb4f40da60d762362c747c67b"),
    ECDSASignature(.sha512, "ecdsa_p256k1_private_secure", "ecdsa_p256k1_public", "secret", "Signature", "4044022000f851e1d80ce3820f6dfa2895f1c759fa12dbac3f6386cb409043c3bc4b3fd202206d3d300404c7af7ac5fb30576dc65997af24a0adb4f40da60d762362c747c67b")
]

// MARK: - P-384 Signatures

let ecdsaP384withSHA1Signatures = [
    ECDSASignature(.sha1, "ecdsa_p384_private", "ecdsa_p384_public", nil, "Signature", "30660231009a7b01956f59e56de1ec906b2b6e05871fac65fb3a5084cca973f8378f010f15ae3b36026eb7f71e1a1d3c87c5a33f69023100e8a6564376e4a614cb3a9df5fa26725a1cd53052fe3be91a000e23f7e5d0775b73463a5b7334b078b069e5775ed39a13"),
    ECDSASignature(.sha1, "ecdsa_p384_private_secure", "ecdsa_p384_public", "secret", "Signature", "30660231009a7b01956f59e56de1ec906b2b6e05871fac65fb3a5084cca973f8378f010f15ae3b36026eb7f71e1a1d3c87c5a33f69023100e8a6564376e4a614cb3a9df5fa26725a1cd53052fe3be91a000e23f7e5d0775b73463a5b7334b078b069e5775ed39a13")
]

let ecdsaP384withSHA224Signatures = [
    ECDSASignature(.sha224, "ecdsa_p384_private", "ecdsa_p384_public", nil, "Signature", "306402300d6a2f3636989a489b4d89b21f314d86620e4db7a0938512439a5e51d91a48d9512fda486d11d29ed8cd526a8f4cb8b5023071d271b4b74285809bb134aea6bf904d72013acd094a0dadb7d8db687a3b1abe045f571cbebe0793c1991c57334fb51d"),
    ECDSASignature(.sha224, "ecdsa_p384_private_secure", "ecdsa_p384_public", "secret", "Signature", "306402300d6a2f3636989a489b4d89b21f314d86620e4db7a0938512439a5e51d91a48d9512fda486d11d29ed8cd526a8f4cb8b5023071d271b4b74285809bb134aea6bf904d72013acd094a0dadb7d8db687a3b1abe045f571cbebe0793c1991c57334fb51d")
]

let ecdsaP384withSHA256Signatures = [
    ECDSASignature(.sha256, "ecdsa_p384_private", "ecdsa_p384_public", nil, "Signature", "306502302e599b6bdf333b5eaa8e8edebfd476bb279bdd573f551c8db48b15a4734d865d1d9a9a15fbf3af67ce9034d6208efbf9023100fd02c1312797d5181fbe78da5da71172b8e6f395a5c67934c4a242077969982e0de7244836444b289b56a13e963b0282"),
    ECDSASignature(.sha256, "ecdsa_p384_private_secure", "ecdsa_p384_public", "secret", "Signature", "306502302e599b6bdf333b5eaa8e8edebfd476bb279bdd573f551c8db48b15a4734d865d1d9a9a15fbf3af67ce9034d6208efbf9023100fd02c1312797d5181fbe78da5da71172b8e6f395a5c67934c4a242077969982e0de7244836444b289b56a13e963b0282")
]

let ecdsaP384withSHA384Signatures = [
    ECDSASignature(.sha384, "ecdsa_p384_private", "ecdsa_p384_public", nil, "Signature", "3065023100e9c98f98173349ecebeebfab349fa1831bea133355dd06f1e62e02052d960ad78547210934cbd4897ac254ead80e323e02304add0ca8fa2a6fbd7021095c6da8acd84d1339c9e6d939df107514eb2786e0b0cd113380e4d99dfb36b6f5808401c1c6"),
    ECDSASignature(.sha384, "ecdsa_p384_private_secure", "ecdsa_p384_public", "secret", "Signature", "3065023100e9c98f98173349ecebeebfab349fa1831bea133355dd06f1e62e02052d960ad78547210934cbd4897ac254ead80e323e02304add0ca8fa2a6fbd7021095c6da8acd84d1339c9e6d939df107514eb2786e0b0cd113380e4d99dfb36b6f5808401c1c6")
]

let ecdsaP384withSHA512Signatures = [
    ECDSASignature(.sha512, "ecdsa_p384_private", "ecdsa_p384_public", nil, "Signature", "3065023053e18a3d2fcde03585522e7ede736b50b8ab38c91cc6779ffc4f5e386463e9c3df34b9a8634900442af309f5d7d65d1f023100a31f00e3fc50a9b1f869b8d9c82fa66305343dbffb15a5a44163a117c86d9f1eb3cb9971fb1264a56e3c215181ecc01f"),
    ECDSASignature(.sha512, "ecdsa_p384_private_secure", "ecdsa_p384_public", "secret", "Signature", "3065023053e18a3d2fcde03585522e7ede736b50b8ab38c91cc6779ffc4f5e386463e9c3df34b9a8634900442af309f5d7d65d1f023100a31f00e3fc50a9b1f869b8d9c82fa66305343dbffb15a5a44163a117c86d9f1eb3cb9971fb1264a56e3c215181ecc01f")
]

// MARK: - P-384 Fake Signatures

let ecdsaFakeP384withSHA1Signatures = [
    ECDSASignature(.sha1, "ecdsa_p384_private", "ecdsa_p384_public", nil, "Signature", "40660231009a7b01956f59e56de1ec906b2b6e05871fac65fb3a5084cca973f8378f010f15ae3b36026eb7f71e1a1d3c87c5a33f69023100e8a6564376e4a614cb3a9df5fa26725a1cd53052fe3be91a000e23f7e5d0775b73463a5b7334b078b069e5775ed39a13"),
    ECDSASignature(.sha1, "ecdsa_p384_private_secure", "ecdsa_p384_public", "secret", "Signature", "40660231009a7b01956f59e56de1ec906b2b6e05871fac65fb3a5084cca973f8378f010f15ae3b36026eb7f71e1a1d3c87c5a33f69023100e8a6564376e4a614cb3a9df5fa26725a1cd53052fe3be91a000e23f7e5d0775b73463a5b7334b078b069e5775ed39a13")
]

let ecdsaFakeP384withSHA224Signatures = [
    ECDSASignature(.sha224, "ecdsa_p384_private", "ecdsa_p384_public", nil, "Signature", "406402300d6a2f3636989a489b4d89b21f314d86620e4db7a0938512439a5e51d91a48d9512fda486d11d29ed8cd526a8f4cb8b5023071d271b4b74285809bb134aea6bf904d72013acd094a0dadb7d8db687a3b1abe045f571cbebe0793c1991c57334fb51d"),
    ECDSASignature(.sha224, "ecdsa_p384_private_secure", "ecdsa_p384_public", "secret", "Signature", "406402300d6a2f3636989a489b4d89b21f314d86620e4db7a0938512439a5e51d91a48d9512fda486d11d29ed8cd526a8f4cb8b5023071d271b4b74285809bb134aea6bf904d72013acd094a0dadb7d8db687a3b1abe045f571cbebe0793c1991c57334fb51d")
]

let ecdsaFakeP384withSHA256Signatures = [
    ECDSASignature(.sha256, "ecdsa_p384_private", "ecdsa_p384_public", nil, "Signature", "406502302e599b6bdf333b5eaa8e8edebfd476bb279bdd573f551c8db48b15a4734d865d1d9a9a15fbf3af67ce9034d6208efbf9023100fd02c1312797d5181fbe78da5da71172b8e6f395a5c67934c4a242077969982e0de7244836444b289b56a13e963b0282"),
    ECDSASignature(.sha256, "ecdsa_p384_private_secure", "ecdsa_p384_public", "secret", "Signature", "406502302e599b6bdf333b5eaa8e8edebfd476bb279bdd573f551c8db48b15a4734d865d1d9a9a15fbf3af67ce9034d6208efbf9023100fd02c1312797d5181fbe78da5da71172b8e6f395a5c67934c4a242077969982e0de7244836444b289b56a13e963b0282")
]

let ecdsaFakeP384withSHA384Signatures = [
    ECDSASignature(.sha384, "ecdsa_p384_private", "ecdsa_p384_public", nil, "Signature", "4065023100e9c98f98173349ecebeebfab349fa1831bea133355dd06f1e62e02052d960ad78547210934cbd4897ac254ead80e323e02304add0ca8fa2a6fbd7021095c6da8acd84d1339c9e6d939df107514eb2786e0b0cd113380e4d99dfb36b6f5808401c1c6"),
    ECDSASignature(.sha384, "ecdsa_p384_private_secure", "ecdsa_p384_public", "secret", "Signature", "4065023100e9c98f98173349ecebeebfab349fa1831bea133355dd06f1e62e02052d960ad78547210934cbd4897ac254ead80e323e02304add0ca8fa2a6fbd7021095c6da8acd84d1339c9e6d939df107514eb2786e0b0cd113380e4d99dfb36b6f5808401c1c6")
]

let ecdsaFakeP384withSHA512Signatures = [
    ECDSASignature(.sha512, "ecdsa_p384_private", "ecdsa_p384_public", nil, "Signature", "4065023053e18a3d2fcde03585522e7ede736b50b8ab38c91cc6779ffc4f5e386463e9c3df34b9a8634900442af309f5d7d65d1f023100a31f00e3fc50a9b1f869b8d9c82fa66305343dbffb15a5a44163a117c86d9f1eb3cb9971fb1264a56e3c215181ecc01f"),
    ECDSASignature(.sha512, "ecdsa_p384_private_secure", "ecdsa_p384_public", "secret", "Signature", "4065023053e18a3d2fcde03585522e7ede736b50b8ab38c91cc6779ffc4f5e386463e9c3df34b9a8634900442af309f5d7d65d1f023100a31f00e3fc50a9b1f869b8d9c82fa66305343dbffb15a5a44163a117c86d9f1eb3cb9971fb1264a56e3c215181ecc01f")
]
