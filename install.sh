＃！/ binに/ shを

インストール {（）

設定 -I

それら= $（それらを）
であれば [ " $ UNAME " ！=  " Linuxの"  -a  " $のUNAME " ！=  "ダーウィン"  -a  " $のUNAME " ！=  " OpenBSDの" ] ;  その後、
    エコー "申し訳ありませんが、OSには対応していません：$ {UNAME} https://github.com/apex/apex/releasesからバイナリをダウンロードしてください。」
    出口 1
あります

であれば [ " $ UNAME "  =  "ダーウィン" ] ;  その後、
  OSX_ARCH = $（のuname -m ）
  であれば [ " $ {OSX_ARCH} "  =  " x86_64版" ] ;  その後、
    PLATFORM = " darwin_amd64 "
  ほかに
    エコー "申し訳ありませんが、アーキテクチャがサポートされていません：$ {OSX_ARCH} https://github.com/apex/apex/releasesからバイナリをダウンロードしてください。」
    出口 1
  あります
elifの [ " $ UNAME "  =  " Linuxの" ] ;  その後、
  LINUX_ARCH = $（のuname -mを）
  であれば [ " $ {LINUX_ARCH} "  =  " i686の" ] ;  その後、
    PLATFORM = " linux_386 "
  elifの [ " $ {LINUX_ARCH} "  =  " x86_64版" ] ;  その後、
    PLATFORM = " linux_amd64 "
  ほかに
    エコー "申し訳ありませんが、アーキテクチャがサポートされていません：$ {LINUX_ARCH} https://github.com/apex/apex/releasesからバイナリをダウンロードしてください。」
    出口 1
  あります
elifの [ " $ UNAME "  =  " OpenBSDの" ] ;  その後、
    OPENBSD_ARCH = $（のuname -mを）
  であれば [ " $ {OPENBSD_ARCH} "  =  " AMD64 " ] ;  その後、
      PLATFORM = " openbsd_amd64 "
  ほかに
      エコー "申し訳ありませんが、アーキテクチャがサポートされていません：$ {OPENBSD_ARCH} https://github.com/apex/apex/releasesからバイナリをダウンロードしてください。」
      出口 1
  あります

あります

LATEST = $（カール-s https://api.github.com/repos/apex/apex/tags | grepの-Eo ' "名前"：？* [^ \\] "、'   |ヘッド-n 1 | sedの' sの/ [、 "] //グラム'  |カット-d '：' -f 2 ）
URL = " https://github.com/apex/apex/releases/download/ $ LATEST / apex_の$のPLATFORM 」
DEST = $ {DEST ： - / USR /ローカル/ binに/頂点}

であれば [ -z  $ LATEST ] ;  その後、
  エコー "エラー要求する。https://github.com/apex/apex/releasesからバイナリをダウンロードしてください」
  出口 1
ほかに
  -sL https://github.com/apex/apex/releases/download/カール$ LATEST / apex_の$プラットフォーム -o $ DEST
  chmodの+ X $ DEST
あります
}

インストールル