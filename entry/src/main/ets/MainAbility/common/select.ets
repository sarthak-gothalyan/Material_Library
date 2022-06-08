// make dimensions dynamic

// ############################ single material select component
export class MenuOption {
  value: string
  id: any
}

@Component
export struct MaterialSelect {
  // initialize selection

  menu: MenuOption[]
  @Link selection: MenuOption
  width: number = 185
  height: number = 60
  default?: number
  @State placeholder: string = 'Select'
  // might decide to make it change dynamically
  @State font_size: number = 18;

  scroller: Scroller = new Scroller()

  // make these non-accessible
  private idle_background_color: ResourceColor | string = Color.White;
  private idle_border_color: ResourceColor | string = '#d4d4d4';
  private hover_background_color: ResourceColor | string = '#f2a0e7';
  private hover_border_color: ResourceColor | string = '#eb59d7';
  // current active colors
  @State private background_color: ResourceColor | string = Color.White;
  @State private border_color: ResourceColor | string = '#d4d4d4';

  // single menu item
  @Builder MenuItem(option: MenuOption) {
    Row() {
      Text(option.value)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .height(21)
        .width(185 - (12 + 12))
        .textOverflow({overflow: TextOverflow.Ellipsis})
        .margin({left: 12, top: 15, bottom: 15})
    }
      .height(15 + 21 + 15)
      .width(185)
      .onClick(() => {
        this.placeholder = option.value
        this.selection = {value: option.value, id: option.id}
      })
  }

  // the complete menu
  @Builder MenuBuilder() {
     Column() {
        ForEach(this.menu, (item) => {
          this.MenuItem(item)
        })
     }
        .height(205)
        .width(185)
        .padding({top: 7, bottom: 7})
        .borderRadius(4)
  }

  build() {
    Row() {
      Text(this.placeholder)
        .fontSize(this.font_size)
        .fontWeight(FontWeight.Bold)
        .fontColor('#333F48')
        .width(this.width - (16 + 26 + 10))
        .height(this.height - (18 + 18))
        .textOverflow({overflow: TextOverflow.Ellipsis})
        .maxLines(1)
        .margin({left: 16, top: 18, bottom: 18})
      Image($r('app.media.dropdown'))
        .height(8)
        .width(16)
        .objectFit(ImageFit.Cover)
        .opacity(0.5)
        .margin({right: 10, top: 26, bottom: 26})
    }
      .width(this.width)
      .height(this.height)
      .justifyContent(FlexAlign.SpaceBetween)
      .borderWidth(1)
      .borderColor('#9CA2C7')
      .borderRadius(4)
      .backgroundColor(this.background_color)
      .bindMenu(this.MenuBuilder)
  }
}

// ############################ multiple material select component
export class MultipleMenuOption {
  value: string
  id: any
  is_checked: boolean
}

export class MultipleMenuSelection {
  value: string
  id: any
}

@Component
export struct MultipleMaterialSelect {
  // stop the menu from disappearing on click
  // initialize selection

  @Link menu: MultipleMenuOption[]
  @Link selection: MultipleMenuSelection[]
  width: number = 185
  height: number = 60
  // might decide to make it change dynamically
  @State font_size: number = 18;

  // make these non-accessible
  private idle_background_color: ResourceColor | string = Color.White;
  private idle_border_color: ResourceColor | string = '#d4d4d4';
  private hover_background_color: ResourceColor | string = '#f2a0e7';
  private hover_border_color: ResourceColor | string = '#eb59d7';
  // current active colors
  @State private background_color: ResourceColor | string = Color.White;
  @State private border_color: ResourceColor | string = '#d4d4d4';

  // single menu item
  @Builder MenuItem(option: MultipleMenuOption, index: number) {
    Row({space: 9}) {
      Checkbox({name: option.value,  group: "check"})
        .select(option.is_checked)
        .selectedColor(Color.Blue)
        .height(24)
        .width(24)
        .margin({left: 12})
      Text(option.value)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .height(21)
        .width(185 - (45 + 12))
        .textOverflow({overflow: TextOverflow.Ellipsis})
    }
      .height(15 + 21 + 15)
      .width(185)
      .onClick(() => {
        this.menu[index].is_checked = !this.menu[index].is_checked
        let list = []
        let choices = []
        for (let i = 0; i < this.menu.length; i++) {
          let m = this.menu[i]
          list.push(m)
          console.log("" + m.is_checked)
          if(m.is_checked) {
            choices.push({value: m.value, id: m.id})
          }
        }
        this.menu = list
        this.selection = choices
      })
  }

  // complete menu
  @Builder MenuBuilder() {
    //Flex({direction: FlexDirection.Column, alignContent: FlexAlign.Start}) {
    Column() {
      ForEach(this.menu, (item, i) => {
        this.MenuItem(item, i)
      })
    }
      .height(205)
      .width(185)
      .padding({top: 7, bottom: 7})
      .borderRadius(4)
  }

  build() {
    Row() {
      Image($r('app.media.dropdown'))
        .height(8)
        .width(16)
        .objectFit(ImageFit.Cover)
        .opacity(0.5)
        .margin({right: 10, top: 26, bottom: 26})
    }
      .width(this.width)
      .height(this.height)
      .justifyContent(FlexAlign.End)
      .borderWidth(1)
      .borderColor('#9CA2C7')
      .borderRadius(4)
      .backgroundColor(this.background_color)
      .bindMenu(this.MenuBuilder)
      .onHover((isHover) => {
        if(isHover) {
          this.background_color = this.hover_background_color
          this.border_color = this.hover_border_color
        }
        else {
          this.background_color = this.idle_background_color
          this.border_color = this.idle_border_color
        }
      })
  }
}

// ############################ file material select component
class FileOption {
  value: string
  icon?: Resource | string
}

@Component
export struct MaterialFileSelect {
  width: number = 380
  height: number = 96
  @State font_size: number = 18;
  @State placeholder: string = 'File'
  @State text: string = "lore ipsum"

  // single menu item
  @Builder MenuItem(option: FileOption, index: number) {
    Row({space: 12}) {
      Image(option.icon)
        .objectFit(ImageFit.Cover)
        .width(18)
        .height(18)
      Text(option.value)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .height(21)
        .width(185 - (47 + 12))
    }
    .height(15 + 21 + 15)
    .width(185)
    .onClick(() => {
      console.log("" + index + ": " + option.value)
    })
  }

  // complete menu
  @Builder MenuBuilder() {
    //Flex({direction: FlexDirection.Column, alignContent: FlexAlign.Start}) {
    Column() {
      this.MenuItem({value: "Preview", icon: $r('app.media.preview')}, 0)
      this.MenuItem({value: "Share", icon: $r('app.media.share')}, 1)
      this.MenuItem({value: "Get Link", icon: $r('app.media.get_link')}, 2)
      Divider().strokeWidth(1).color('#d4d4d4')
      this.MenuItem({value: "Remove", icon: $r('app.media.remove')}, 3)
      this.MenuItem({value: "Download", icon: $r('app.media.download')}, 4)
    }
      .height(205)
      .width(185)
      .padding({top: 7, bottom: 7})
      .borderRadius(4)
  }

  build() {
    Column({space: 8}) {
      Row() {
        Text(this.placeholder)
          .fontSize(this.font_size)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333F48')
          .width(this.width - (16 + 279))
          .height(this.height - (16 + 56))
          .textOverflow({overflow: TextOverflow.Ellipsis})
        Image($r('app.media.dot_menu'))
          .height(26)
          .width(6)
          .objectFit(ImageFit.Cover)
          .opacity(0.5)
          .bindMenu(this.MenuBuilder)
      }
        .width(this.width - (16+16))
        .height(26)
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({top: 16})
      Text(this.text)
        .fontSize(14)
        .fontColor('#9CA2C7')
        .height(this.height - (48 + 12))
        .width(this.width - (16 + 56))
        .textOverflow({overflow: TextOverflow.Ellipsis})
        .margin({left: 16, right: 56})
    }
      .width(this.width)
      .height(this.height)
      .justifyContent(FlexAlign.SpaceBetween)
      .borderWidth(1)
      .borderColor('#9CA2C7')
      .borderRadius(4)
  }
}