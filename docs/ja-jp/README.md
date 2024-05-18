# Firefish 配布用リポジトリ

[Firefish](https://firefish.dev/firefish/firefish) は、オープンソースの分散型ソーシャルメディアプラットフォームソフトウェアです。絵文字リアクション、カスタマイズ可能なWeb UI、豊かなチャット機能などを備えた [ActivityPub](https://www.w3.org/TR/activitypub/) 上のマイクロブログを利用可能にします。開発は https://firefish.dev/firefish/firefish で進められています。

このプロジェクトでは、Debian ベースの Linux ディストリビューション用に Firefish パッケージを配布する、APT リポジトリを提供します。

## Fediverse に Firefish で参加する

Firefish で分散型ソーシャルメディアネットワーク Fediverse に参加したい場合、あなたには2つの選択肢があります。

1つ目は、既存の Firefish インスタンスにアカウントを作成し、そのアカウントを使う方法です。これは最も手軽で、手早く Fediverse に参加することができる手段です。もしこの方法を取るなら、このドキュメントは必要ありません。

2つ目は、新しく Firefish インスタンスを作成し、そこにアカウントを作成して使う方法です。この方法は、コストがかかる代わりに絶対的な制御を手にすることができます。このドキュメントではこちらの方法を紹介します。

## Firefish インスタンスを立てる

Firefish インスタンスを立てるには、以下を用意する必要があります:

<dl>
<dt>ドメイン名</dt>
<dd>

* インターネットにおいて、個々のノードの識別子です。Fediverse で個々のサーバの識別に使われる他、Web UI へのアクセス時の URL の一部となります。
* [Cloudflare Registrar](https://www.cloudflare.com/products/registrar/)、[Namecheap](https://www.namecheap.com/) などのサービスを通して取得できます。ただし、通常は取得及び保守に費用がかかります。

</dd>

<dt>サーバ</dt>
<dd>

* Firefish をインストールして実行し、インターネットに公開するには、そのためのサーバ環境が必要です。
* サーバ環境は、自宅に物理的に PC を用意し専用のネット回線を整備することでも用意できますが、仮想サーバ提供サービスを使用することでより手間なくサーバ環境を用意できます。
* [DigitalOcean](https://www.digitalocean.com/)、[Hetzner](https://www.hetzner.com/) などのサービスを通して用意できます。ただし、通常は取得及び保守に費用がかかります。

</dd>
</dl>

これらを用意した上で、インターネットに公開するためサーバのセットアップを行い、Firefish をインストールして立ち上げを行うことで、自身の Firefish インスタンスを Fediverse に参加させることができます。詳細な手順は、[Firefish のインストール](ja-jp/install-firefish.md)をご覧ください。

## Firefish の開発に貢献する

開発

## ライセンス

Firefish のソースコードは [AGPLv3 ライセンス](https://firefish.dev/firefish/firefish/-/blob/develop/LICENSE?ref_type=heads)で提供されています。ただし、Firefish は多くのライブラリに依存しており、それぞれのライブラリは多様なライセンスによって提供されています。このリポジトリで提供されている Firefish パッケージは、それらのライブラリや、このプロジェクトで管理している設定ファイル群を含んでおり、多様なライセンスのコードが含まれていることに注意してください。詳細はパッケージに含まれている、ライセンス表記を参照してください。

また、このプロジェクトのコード及びドキュメントは、Apache-2.0 と MPL-2.0 のデュアルライセンスで提供されており、再配布にあたってどちらかを選択することができます。詳しくは、[ライセンス](https://github.com/mizunashi-mana/firefish-dist-pkg/blob/main/LICENSE)を参照してください。
