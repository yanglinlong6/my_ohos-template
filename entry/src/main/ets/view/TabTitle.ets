import { CommonConstants } from '../common/constants/CommonConstants'


@Component
export struct TabText {
  build() {
    Row() {
      Text($r('app.string.page_title'))
        .fontColor($r('app.color.title'))
        .fontSize($r('app.float.title_size'))
    }
    .width(CommonConstants.FULL_WIDTH_PERCENT)
    .height($r('app.float.title_height'))
    .margin({
      top: $r('app.float.title_margin_top'),
      left: $r('app.float.title_margin_left')
    })
  }
}