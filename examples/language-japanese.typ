#import "@local/fancy-cookbook:3.0.0": *

#set text(lang:"ja")

#let japanese = (
  ja: (
      appendices: "付録",
      author: "著者",
      authors: "著者一覧",
      index: "テーマ別索引",
      ingredients: "材料",
      notes: "シェフのメモ",
      preparation: "下準備",
      toc: "目次",
      page-numbering: "一",
      page-ref-numbering: "一頁",
      step-numbering: "一"
    )
)
#show: cookbook.with(
  title: "私のレシピ本",
  subtitle: "小さなサブタイトル",
  book-author: "私自身",
  custom-i18n: japanese
)
#chapter[さあ、始めましょう]

#recipe(
  [シンプルなレシピ],
  label: <simple>,
  description: [本当のレシピではありません],
  servings: 6,
  prep-time: [2分],
  cook-time: [10分],
  ingredients:[
    - *1 l* の水
    - *350 ml* のフルーツジュース
  ],
  instructions: [
    + すべてを一緒に入れる
    + よく振る
    + 冷蔵庫で保存する
  ]
)
#recipe(
  [グループ分けしたレシピ],
  description: [本当のレシピではありません],
  servings: 6,
  prep-time: [2分],
  cook-time: [10分],
  ingredients:(
    (
      title: [液体],
      items: [
        - *1 l* @simple
        - *350 ml* のフルーツジュース
      ]
    ),
    (
      title: [固体],
      items: [
        - *300 mg* の小麦粉
        - *12 g* のバター
        - *150 g* の砂糖
      ]
    )
  ),
  instructions: (
    (
      title: [液体],
      steps: [
        + すべてを一緒に入れる
        + よく振る
        + 冷蔵庫で保存する
      ]
    ),
    (
      title: [固体],
      steps: [
        + すべてを一緒に入れる
        + よく混ぜる
        + 全部ゴミ箱に捨てる
        + ピザを注文する
      ]
    )
  )
)







