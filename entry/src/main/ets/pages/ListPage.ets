import { CommonConstants } from '../common/constants/CommonConstants';
import type { TabItemData } from '../common/bean/TabItemData';
import { ListAreaComponent } from '../view/ListAreaComponent';
import PageViewModel from '../viewmodel/PageViewModel';
import { TabHome } from '../view/TabHome';
import { TabSub } from '../view/TabSub';
import { TabMe } from '../view/TabMe';

/**
 * ListPage is the entry of application and shows how to develop a list page.The page consists of the search component,
 * list, and tabs. The list component is ListAreaComponent, and each item in the list corresponds to ListItemComponent.
 * The LazyForEach interface is used to implement high performance. Developers can expand
 * ListItemData, TabItemData, and PageViewModel, modify or add your own text, pictures, etc,
 * and quickly develop functions that meet project requirements.
 */
@Entry
@Component
struct ListPage {
  @State currentTabIndex: number = 0;
  @State breakPoint: string = CommonConstants.BREAK_POINT_XS;

  @Builder BuildTabs(item: TabItemData, index: number) {
    Column() {
      Image(this.currentTabIndex === index ? item.imageActivated : item.imageOriginal)
        .width($r('app.float.image_star_width'))
        .height($r('app.float.image_star_height'))
      Text(item.title)
        .margin({ top: $r('app.float.tab_text_margin_top') })
        .fontSize($r('app.float.tab_text_size'))
        .fontColor(this.currentTabIndex === index ?
        $r('app.color.tab_text_activated') : $r('app.color.tab_text_normal'))
    }
    .justifyContent(FlexAlign.Center)
    .width(CommonConstants.TABS_WIDTH_PERCENT)
    .height($r('app.float.tab_bar_height'))
  }

  build() {
    Column() {
      Tabs({
        index: this.currentTabIndex,
        barPosition: this.breakPoint === CommonConstants.BREAK_POINT_LG ? BarPosition.Start : BarPosition.End
      }) {
        ForEach(PageViewModel.getTabData(), (item: TabItemData, index) => {
          TabContent() {
            if (index == 0) {
              TabHome({ breakPoint: this.breakPoint })
            } else if (index == 1) {
              TabSub()
            } else if (index == 2) {
              TabMe()
            } else {
              Text("wode")
            }
          }
          .backgroundColor($r('app.color.theme_background'))
          .tabBar(this.BuildTabs(item, index))
        }, (item, index) => index + JSON.stringify(item))
      }
      .vertical(this.breakPoint === CommonConstants.BREAK_POINT_LG)
      .barWidth(this.breakPoint === CommonConstants.BREAK_POINT_LG ?
      $r('app.float.bar_width') : CommonConstants.TAB_BAR_HEIGHT_PERCENT)
      .barHeight(this.breakPoint === CommonConstants.BREAK_POINT_LG ?
      CommonConstants.TAB_HEIGHT_PERCENT : $r('app.float.bar_height'))
      .margin({ top: $r('app.float.tab_margin_top') })
      .layoutWeight(CommonConstants.TAB_LAYOUT_WEIGHT)
      .backgroundColor($r('app.color.tab_bar_background'))
      .onChange(index => {
        this.currentTabIndex = index;
      })
    }
    .backgroundColor($r('app.color.theme_background'))
  }
}