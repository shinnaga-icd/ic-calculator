# 履歴機能付きの電卓アプリ

## Overview

#### Project background

> 本プロジェクトは、IC内勉強会の一環として「アーキテクチャを学ぶ」と題して作成されたプロジェクトの一つとなります。
各メンバー毎に同じテーマ、要件のアプリをMVVM、CleanArchitecture、MVPで作った場合の違いを見つつアーキテクチャに対しての理解を深めるということで、本プロジェクトではその中のMVPでの作成を行っております。

#### theme

電卓

#### features

- 四則演算
- 過去実行履歴の閲覧


## Getting Started

```
> flutter run
```

## System Requirements

- Flutter 3.16.3 (channel stable)
- Dart 3.2.3


## System Arcitecture

- logic architecture：MVP architecture
- state:InheritedWidget


```
lib
|- core : 共通ロジックを配置
|   |-enum       : システム全体で利用するenum
|   |-extentions : システム全体で利用する拡張型
|   |-models     : Model層
|   |-state      : システム全体で利用する状態管理
|- features : 機能別ロジックを配置
|   |-(feature) : 機能別にフォルダを分割
|       |-widgets                   : UIパーツ
|       |-(feature)_presenter.dart  : Presenter層
|       |-(feature)_view.dart       : View層
|       |-(feature)_viewmodel.dart  : View層のInterface用
|- home.dart : 全体をオーバーラップ
|- main.dart : エントリポイント
```

## MVP Architecture
![MVP image(from medium)](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*tvlv-zFL-cnbk9O8pgIgIw.png)

#### 各層の役割

- View
    - アプリケーションUIを構築
    - イベントハンドラはPresenterへ移譲
- Model
    - データ管理、ビジネスロジック（ルール）を担う
    - Presenterからのみ呼び出される
- Presenter
    - Viewのイベント処理
    - View-Model間のブリッジ
    - データ更新をViewへ通知
