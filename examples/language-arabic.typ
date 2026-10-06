#import "@local/fancy-cookbook:3.0.0": *
#set text(lang: "ar")

#show: cookbook.with(
  title: "كتاب طبخي",
  subtitle: "عنوان فرعي صغير",
  book-author: "أنا نفسي"
)

#chapter[ها هو ذا]

#recipe(
  [وصفة بسيطة],
  description: [ليست وصفة حقيقية],
  servings: 6,
  prep-time: [٢ دقيقة],
  cook-time: [١٠ دقائق],
  ingredients:[
    - *١ ل* من الماء
    - *٣٥٠ مل* من عصير الفاكهة
  ],
  instructions: [
    + ضع كل شيء معاً
    + اهزّ جيداً
    + احفظ في الثلاجة
  ]
)

#recipe(
  [وصفة بمجموعات],
  description: [ليست وصفة حقيقية],
  servings: 6,
  prep-time: [٢ دقيقة],
  cook-time: [١٠ دقائق],
  ingredients:(
    (
      title: [سائل],
      items: [
        - *١ ل* من الماء
        - *٣٥٠ مل* من عصير الفاكهة
      ]
    ),
    (
      title: [صلب],
      items: [
        - *٣٠٠ مغ* من دقيق القمح
        - *١٢ غ* من الزبدة
        - *١٥٠ غ* من السكر
      ]
    )
  ),
  instructions: (
    (
      title: [سائل],
      steps: [
        + ضع كل شيء معاً
        + اهزّ جيداً
        + احفظ في الثلاجة
      ]
    ),
    (
      title: [صلب],
      steps: [
        + ضع كل شيء معاً
        + اخلط جيداً
        + ضع كل شيء في سلة المهملات
        + اطلب بيتزا
      ]
    )
  )
)