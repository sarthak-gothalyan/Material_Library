export class MenuOption {
  value: string
  icon?: Resource | string
}

// make callback for select

@Component
export struct MaterialSelect {
  menu: MenuOption[]
  @State width: number = 120
  @State height: number = 60
  @State placeholder: string = 'Select'
  @State font_size: number = 20;

  // make these non-accessible
  private idle_background_color: ResourceColor | string = Color.White;
  private idle_border_color: ResourceColor | string = '#d4d4d4';
  private hover_background_color: ResourceColor | string = '#f2a0e7';
  private hover_border_color: ResourceColor | string = '#eb59d7';
  @State private background_color: ResourceColor | string = Color.White;
  @State private border_color: ResourceColor | string = '#d4d4d4';

  @Builder MenuItem(msg: string, icon?: Resource | string) {
    Row({space: 12}) {
      Image(icon)
        .objectFit(ImageFit.Cover)
        .width(24)
        .height(24)
      Text(msg)
        .fontSize(18)
    }
      .height(48)
      .margin({top: 8, bottom: 8, left: 12, right: 12})
      .onClick(() => {
        this.placeholder = msg
      })
  }

  @Builder MenuBuilder() {
    //Flex({direction: FlexDirection.Column, alignContent: FlexAlign.Start}) {
     Column() {
      ForEach(this.menu, (item) => {
        this.MenuItem(item.value, item.icon)
      })
    }
      .alignItems(HorizontalAlign.Start)
      .width(250)
      .borderRadius(4)
  }

  build() {
    Row() {
      Text(this.placeholder)
        .fontSize(this.font_size)
        .width(this.width - (24 + 20 + 10))
        .height(this.height - (10))
        .textOverflow({overflow: TextOverflow.Ellipsis})
        .maxLines(1)
        .margin({left: 10, top: 5})
      Image($r('app.media.down'))
        .height(24)
        .width(24)
        .objectFit(ImageFit.Cover)
        .opacity(0.5)
        .margin(5)
      //      Polygon({ wi
//      Polygon({ width: 24, height: 12 })
//        .points([[0, 0], [12, 12], [24, 0]])
//        .opacity(0.5)
//        .margin(5)
    }
      .width(this.width)
      .height(this.height)
      .justifyContent(FlexAlign.SpaceBetween)
      .borderWidth(2)
      .borderColor('#d4d4d4')
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

export class MultipleMenuOption {
  value: string
  is_checked: boolean
}

@Component
export struct MultipleMaterialSelect {
  @Link menu: MultipleMenuOption[]
  @State width: number = 120
  @State height: number = 60
  @State placeholder: string = 'Select'
  @State font_size: number = 20;

  // make these non-accessible
  private idle_background_color: ResourceColor | string = Color.White;
  private idle_border_color: ResourceColor | string = '#d4d4d4';
  private hover_background_color: ResourceColor | string = '#f2a0e7';
  private hover_border_color: ResourceColor | string = '#eb59d7';
  @State private background_color: ResourceColor | string = Color.White;
  @State private border_color: ResourceColor | string = '#d4d4d4';

  @Builder MenuItem(option: MultipleMenuOption) {
    Row({space: 12}) {
      Checkbox({name: option.value,  group: 'checkboxGroup'})
        .select(option.is_checked)
        .selectedColor(Color.Blue)
        .height(10)
        .width(10)
        .padding(0)
        .margin(4)
      Text(option.value)
        .fontSize(18)
    }
      .height(48)
      .margin({top: 8, bottom: 8, left: 12, right: 12})
      .onClick((e) => {
        option.is_checked = !option.is_checked
      })
  }

  @Builder MenuBuilder() {
    //Flex({direction: FlexDirection.Column, alignContent: FlexAlign.Start}) {
    Column() {
      ForEach(this.menu, (item) => {
        this.MenuItem(item)
      })
    }
      .alignItems(HorizontalAlign.Start)
      .width(250)
      .borderRadius(4)
  }

  build() {
    Row() {
      Text(this.placeholder)
        .fontSize(this.font_size)
        .width(this.width - (24 + 20 + 10))
        .height(this.height - (10))
        .textOverflow({overflow: TextOverflow.Ellipsis})
        .maxLines(1)
        .margin({left: 10, top: 5})
      Image($r('app.media.down'))
        .height(24)
        .width(24)
        .objectFit(ImageFit.Cover)
        .opacity(0.5)
        .margin(5)
//      Polygon({ width: 24, height: 12 })
//        .points([[0, 0], [12, 12], [24, 0]])
//        .opacity(0.5)
//        .margin(5)
    }
      .width(this.width)
      .height(this.height)
      .justifyContent(FlexAlign.SpaceBetween)
      .borderWidth(2)
      .borderColor('#d4d4d4')
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

@Component
export struct MaterialDescription {
  @State width: number = 120
  @State height: number = 120
  @State font_size: number = 20;
  @State placeholder: string = 'File'
  @State text: string = "lore ipsum"

  build() {
    Column({space: 5}) {
      Row() {
        Text(this.placeholder)
          .fontSize(this.font_size)
          .width(this.width - (24 + 20 + 10))
          .height(24)
          .textOverflow({overflow: TextOverflow.Ellipsis})
          .maxLines(1)
          .margin({left: 10, top: 5})
        Image($r('app.media.menu'))
          .height(24)
          .width(24)
          .objectFit(ImageFit.Cover)
          .opacity(0.5)
          .margin(5)
        }
      Text(this.text)
        .height(this.height - (24 + 10 + 5 + 10 + 5))
        .width(this.width - (10 + 5))
        .textOverflow({overflow: TextOverflow.Ellipsis})
        .margin(5)
    }
      .width(this.width)
      .height(this.height)
      .justifyContent(FlexAlign.SpaceBetween)
      .borderWidth(2)
      .borderColor('#d4d4d4')
      .borderRadius(4)
  }
}