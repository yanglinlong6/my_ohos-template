import { CommonConstants } from '../common/constants/CommonConstants'
import { ListAreaComponent } from './ListAreaComponent'
import { TabText } from './TabTitle';


@Component
export struct TabHome {
  private breakPoint: string;

  build() {
    GridRow({
      breakpoints: {
        value: CommonConstants.BREAK_POINTS_VALUE,
        reference: BreakpointsReference.WindowSize
      },
      columns: {
        sm: CommonConstants.COLUMN_SM,
        md: CommonConstants.COLUMN_MD,
        lg: CommonConstants.COLUMN_LG
      },
      gutter: { x: CommonConstants.GUTTER_X },
      direction: GridRowDirection.Row
    }) {
      GridCol({
        span: {
          sm: CommonConstants.SPAN_SM,
          md: CommonConstants.SPAN_MD,
          lg: CommonConstants.SPAN_LG
        },
        offset: {
          md: CommonConstants.OFFSET_MD,
          lg: CommonConstants.OFFSET_LG
        }
      }) {
        Column() {
          TabText()
          Search({
            placeholder: CommonConstants.SEARCH_PLACEHOLDER
          })
            .width(CommonConstants.SEARCH_WIDTH_PERCENT)
            .height($r('app.float.search_height'))
            .border({ radius: $r('app.float.search_radius') })
            .placeholderColor($r('app.color.search_placeholder'))
            .placeholderFont({
              size: $r('app.float.search_text_size'),
              weight: CommonConstants.SEARCH_FONT_WEIGHT,
              family: CommonConstants.SEARCH_FONT_FAMILY,
              style: FontStyle.Normal
            })
            .textFont({ size: $r('app.float.search_text_size') })
            .margin({
              bottom: $r('app.float.search_margin_bottom')
            })

          ListAreaComponent()
            .layoutWeight(CommonConstants.LIST_LAYOUT_WEIGHT)
        }
        .justifyContent(FlexAlign.Center)
        .width(CommonConstants.SEARCH_WIDTH_PERCENT)
        .height(CommonConstants.COLUMN_HEIGHT_PERCENT)
      }
    }
    .margin({
      left: $r('app.float.grid_row_margin'),
      right: $r('app.float.grid_row_margin')
    })
    .onBreakpointChange((breakPoint) => {
      this.breakPoint = breakPoint;
    })
  }
}